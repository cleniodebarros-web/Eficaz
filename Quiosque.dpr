program Quiosque;

uses
  Forms,
  UQuiosque_Consulta in 'UQuiosque_Consulta.pas' {FrmConsulta_Preco},
  Funcoes in '..\Funcoes.pas',
  UConsulta_Quiosque in 'UConsulta_Quiosque.pas' {FrmConsulta};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmConsulta_Preco, FrmConsulta_Preco);
  Application.Run;
end.
