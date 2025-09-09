program Consiste;

uses
  Forms,
  UConsiste in 'UConsiste.pas' {FrmConsiste_Codigo},
  Funcoes in '..\..\Funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmConsiste_Codigo, FrmConsiste_Codigo);
  Application.Run;
end.
