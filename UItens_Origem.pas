unit UItens_Origem;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs, Controls, StdCtrls, 
  Buttons;

type
  TFrmItens_Origem = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    SrcList: TListBox;
    DstList: TListBox;
    SrcLabel: TLabel;
    DstLabel: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
  end;

var
  FrmItens_Origem: TFrmItens_Origem;
  X_DEST :INTEGER;

implementation
uses
  UPrincipal;

{$R *.dfm}

procedure TFrmItens_Origem.IncludeBtnClick(Sender: TObject);
var
Index: Integer;
inputstring : string;
begin

  Index := GetFirstSelection(SrcList);
  InputString := InputBox(PChar('Eficaz'), 'QUANTIDADE A DEVOLVER: ' + #13 + copy(SrcList.Items[Index],9,20), '1');
 //DstList.Items. := DstList.Items.Strings[Index] + '-' + Strzero(InputString,3,0);
  MoveSelected(SrcList, DstList.Items);
  SetItem(SrcList, index);
  DstList.Items[X_DEST] := DstList.Items[X_DEST] + '-' + Strzero(InputString,3,0);
  INC(X_DEST);
end;

procedure TFrmItens_Origem.ExcludeBtnClick(Sender: TObject);
var
Index: Integer;
begin
  Index := GetFirstSelection(DstList);
  DstList.ITEMS[INDEX] := COPY(DstList.ITEMS[INDEX],1,LENGTH(DstList.ITEMS[INDEX]) - 4);
  MoveSelected(DstList, SrcList.Items);
  SetItem(DstList, Index);
  X_DEST := X_DEST - 1;
end;

procedure TFrmItens_Origem.FormCreate(Sender: TObject);
begin
 X_DEST := 0
end;

procedure TFrmItens_Origem.IncAllBtnClick(Sender: TObject);
var
I: Integer;
begin
  for I := 0 to SrcList.Items.Count - 1 do
    DstList.Items.AddObject(SrcList.Items[I], SrcList.Items.Objects[I]);

  SrcList.Items.Clear;
  SetItem(SrcList, 0);
end;

procedure TFrmItens_Origem.ExcAllBtnClick(Sender: TObject);
var
I: Integer;
begin
  for I := 0 to DstList.Items.Count - 1 do
  Begin
    DstList.ITEMS[I] := COPY(DstList.ITEMS[I],1,LENGTH(DstList.ITEMS[I]) - 4);
    SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
  End;

  DstList.Items.Clear;
  SetItem(DstList, 0);
  X_DEST := 0;
end;

procedure TFrmItens_Origem.MoveSelected(List: TCustomListBox; Items: TStrings);
var
I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
  begin
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
  end;
end;

procedure TFrmItens_Origem.SetButtons;
var
SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := SrcList.Items.Count = 0;
  DstEmpty := DstList.Items.Count = 0;

  IncludeBtn.Enabled := not SrcEmpty;
  IncAllBtn.Enabled  := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
  ExAllBtn.Enabled   := not DstEmpty;
end;

function TFrmItens_Origem.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
  begin
    if List.Selected[Result] then
      exit;
  end;

  Result := LB_ERR;
end;

procedure TFrmItens_Origem.SetItem(List: TListBox; Index: Integer);
var
MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;

    if Index = LB_ERR then
      Index := 0
    else if Index > MaxIndex then
      Index := MaxIndex;

    Selected[Index] := True;
  end;

  SetButtons;
end;

end.
