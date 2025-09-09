unit USobre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Shellapi, jpeg;

type
  TFrmSobre = class(TForm)
    SpeedButton1: TSpeedButton;
    Label12: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label11: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Bevel3: TBevel;
    Image1: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSobre: TFrmSobre;

implementation

{$R *.DFM}

procedure TFrmSobre.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSobre.Label6Click(Sender: TObject);
begin
  ShellExecute(Handle,'Open', PChar('mailto:eficaz@eficazautomacao.com.br?subject=About'), nil, nil, Sw_ShowMaximized);
end;

procedure TFrmSobre.Label7Click(Sender: TObject);
begin
  ShellExecute(Handle, 'Open', PChar('http://www.eficazautomacao.com.br'), nil, nil, Sw_ShowMaximized);
end;

procedure TFrmSobre.Label15Click(Sender: TObject);
begin
  ShellExecute(Handle, 'Open', PChar('http://www.eficazautomacao.com.br'), nil, nil, Sw_ShowMaximized);
end;

function SerialNum(FDrive:String) :String;
var
Serial: DWord;
DirLen,Flags: DWord;
DLabel : Array[0..11] of Char;
begin
  try
    GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
    Result := IntToHex(Serial,8);
  except
    Result :='';
  end;
end;

procedure TFrmSobre.FormCreate(Sender: TObject);
var
MS: TMemoryStatus;
begin
  GlobalMemoryStatus(MS);
  Label10.Caption := FormatFloat('#,###" KB"', MS.dwTotalPhys / 1024);
  Label11.Caption := Format('%d %%', [MS.dwMemoryLoad]);
  Label16.Caption := Serialnum('C');
end;

procedure TFrmSobre.Label1Click(Sender: TObject);
begin
  ShellExecute(Handle,'Open', PChar('mailto:eficaz@eficazautomacao.com.br?subject=About'), nil, nil, Sw_ShowMaximized);
end;

end.
