program Atu_Versao_Pdv;

uses
  Forms,
  UAtualiza_Pdv in 'UAtualiza_Pdv.pas' {FrmAtualiza},
  Funcoes in '..\..\Funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Atualização de Versão';
  Application.CreateForm(TFrmAtualiza, FrmAtualiza);
  Application.Run;
end.
