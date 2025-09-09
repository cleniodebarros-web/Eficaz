program Atu_Versao;

uses
  Forms,
  UAtualiza in 'UAtualiza.pas' {FrmAtualiza},
  Funcoes in '..\..\Funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Atualização de Versão';
  Application.CreateForm(TFrmAtualiza, FrmAtualiza);
  Application.Run;
end.
