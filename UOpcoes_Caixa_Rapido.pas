unit UOpcoes_Caixa_Rapido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, IBCustomDataSet, IBQuery, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmOpcoes_Caixa_Rapido = class(TForm)
    btnEntrada_Operador: TButton;
    btnSaida_Operador: TButton;
    btnVenda: TButton;
    btnRetorna: TButton;
    QRel: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEntrada_OperadorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure btnSaida_OperadorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Habilita_Botoes;
  end;

var
  FrmOpcoes_Caixa_Rapido: TFrmOpcoes_Caixa_Rapido;

implementation

uses
  UPrincipal, UAbre_Turno, UData, UCaixa_Rapido, UFecha_Turno;

{$R *.dfm}

procedure TFrmOpcoes_Caixa_Rapido.Habilita_Botoes;
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT * FROM TURNO');
  QRel.Sql.Add('WHERE');
  QRel.Sql.Add('(CAIXA_ID = :CAIXA_ID)');
  QRel.Sql.Add('AND (STATUS = :STATUS)');

  QRel.ParamByName('CAIXA_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));
  QRel.ParamByName('STATUS').AsString    := 'A';

  QRel.Prepare;
  QRel.Open;

  if QRel.IsEmpty then
  begin
    btnEntrada_Operador.Enabled := True;
    btnSaida_Operador.Enabled   := False;
    btnVenda.Enabled            := False;
  end
  else
  begin
    btnEntrada_Operador.Enabled := False;
    btnSaida_Operador.Enabled   := True;
    btnVenda.Enabled            := True;
  end;
end;

procedure TFrmOpcoes_Caixa_Rapido.btnEntrada_OperadorClick(Sender: TObject);
begin
  Application.CreateForm(TFrmAbre_Turno, FrmAbre_Turno);
  try
    FrmAbre_Turno.ShowModal;
  finally
    FrmAbre_Turno.Release;
  end;

  Habilita_Botoes;
end;

procedure TFrmOpcoes_Caixa_Rapido.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOpcoes_Caixa_Rapido.btnSaida_OperadorClick(Sender: TObject);
begin
  Application.CreateForm(TFrmFecha_Turno, FrmFecha_Turno);
  try
    FrmFecha_Turno.ShowModal;
  finally
    FrmFecha_Turno.Release;
  end;

  Habilita_Botoes;
end;

procedure TFrmOpcoes_Caixa_Rapido.btnVendaClick(Sender: TObject);
begin
  if not ThereIs('Caixa Rápido') then
    TFrmCaixa_Rapido.Create(Application);

  if LeIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente') = 'True' then
    FrmPrincipal.Cascade;
end;

procedure TFrmOpcoes_Caixa_Rapido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmOpcoes_Caixa_Rapido.FormShow(Sender: TObject);
begin
  Habilita_Botoes;
end;

end.


