program Atu_Versao_hotel;

uses
  Forms,
  UAtualiza_Hotel in 'UAtualiza_Hotel.pas' {FrmAtualiza},
  Funcoes in '..\..\Funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Atualização de Versão';
  Application.CreateForm(TFrmAtualiza, FrmAtualiza);
  Application.Run;
end.
