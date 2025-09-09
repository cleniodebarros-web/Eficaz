unit URelAgenda_Ordens_Servico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, rxCurrEdit, Buttons,
  ExtCtrls, Mask, rxToolEdit, QuickRpt, QRCtrls, DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRelAgenda_Ordens_Servico = class(TForm)
    Dtmen: TDateEdit;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Bevel1: TBevel;
    btnTecnico: TSpeedButton;
    Tecnico: TCurrencyEdit;
    Label2: TLabel;
    Dtmai: TDateEdit;
    Label1: TLabel;
    Label3: TLabel;
    Rel_Ordem_Tecnico: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    Label4: TLabel;
    Centro_Custo: TCurrencyEdit;
    btnCentro_Custo: TSpeedButton;
    Label5: TLabel;
    btnAtendente: TSpeedButton;
    Atendente: TCurrencyEdit;
    Label6: TLabel;
    Modelo: TComboBox;
    Rel_Ordem_Servico: TQuickRep;
    QRBand17: TQRBand;
    QRSysData17: TQRSysData;
    QRLabel75: TQRLabel;
    QRSysData18: TQRSysData;
    QRLabel80: TQRLabel;
    QRShape19: TQRShape;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRShape20: TQRShape;
    QRDBText54: TQRDBText;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRBand18: TQRBand;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand2: TQRBand;
    QRSysData3: TQRSysData;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    Label7: TLabel;
    Status: TDBLookupComboBox;
    DataStatus: TDataSource;
    Tipo_Atendimento: TDBLookupComboBox;
    DataAtend: TDataSource;
    Rel_Fechamento: TCheckBox;
    QAtend: TFDQuery;
    QStatus: TFDQuery;
    QRel: TFDQuery;
    Aparelho: TEdit;
    Label8: TLabel;
    QRLabel1: TQRLabel;
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TecnicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTecnicoClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCentro_CustoClick(Sender: TObject);
    procedure btnAtendenteClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelAgenda_Ordens_Servico: TFrmRelAgenda_Ordens_Servico;

implementation

uses
  UConsulta, UData, UPrincipal;

{$R *.dfm}

procedure TFrmRelAgenda_Ordens_Servico.btnAtendenteClick(Sender: TObject);
begin
  try
    Atendente.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Atendente.Text));
  except
    Atendente.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmRelAgenda_Ordens_Servico.btnCentro_CustoClick(Sender: TObject);
begin
  try
    Centro_Custo.Value := GetConsulta('CCUSTO', 0, 0, StrToInt(Centro_Custo.Text));
  except
    Centro_Custo.Value := GetConsulta('CCUSTO', 0, 0, 0);
  end;
end;

procedure TFrmRelAgenda_Ordens_Servico.btnExecutaClick(Sender: TObject);
begin
  // 255, 325
  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT ORDEM_SERVICO.*, FUNCIONARIOS.NOME');
  QRel.Sql.Add('FROM ORDEM_SERVICO');

  if Modelo.Text = 'Modelo 1' then
  begin
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS');
    QRel.Sql.Add('ON (ORDEM_SERVICO.FUNCIONARIO = FUNCIONARIOS.FUNCIONARIO_ID)');
  end
  else
  begin
    QRel.Sql.Add('INNER JOIN FUNCIONARIOS');
    QRel.Sql.Add('ON (ORDEM_SERVICO.ATENDENTE = FUNCIONARIOS.FUNCIONARIO_ID)');
  end;

  QRel.Sql.Add('WHERE');

  if Rel_Fechamento.Checked then
  QRel.Sql.Add('(ORDEM_SERVICO.DT_FECHAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL)')
  Else
  QRel.Sql.Add('(ORDEM_SERVICO.DT_ORDEM BETWEEN :DT_INICIAL AND :DT_FINAL)');

  if Atendente.Value > 0 then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.ATENDENTE = :ATENDENTE)');

    QRel.ParamByName('ATENDENTE').AsInteger := StrToInt(Atendente.Text);
  end;

  if Tecnico.Value > 0 then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.FUNCIONARIO = :FUNCIONARIO)');

    QRel.ParamByName('FUNCIONARIO').AsInteger := StrToInt(Tecnico.Text);

    QRlabel1.Visible := True;
    QRlabel1.Caption := 'Técnico Responsável: ' +  QRel.FieldbyName('NOME').AsString;

  end
  Else
  QRlabel1.Visible := False;


  if Centro_Custo.Value > 0 then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.C_CUSTO_ID = :C_CUSTO)');

    QRel.ParamByName('C_CUSTO').AsInteger := StrToInt(Centro_Custo.Text);
  end;

  if Status.Text <> '' then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.STATUS = :STATUS)');

    QRel.ParamByName('STATUS').AsString := Status.Text;
  end;

  if Aparelho.Text <> '' then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.APARELHO ILIKE :APARELHO)');

    QRel.ParamByName('APARELHO').AsString :=  Aparelho.Text + '%';
  end;

  if Tipo_Atendimento.Text <> '' then
  begin
    QRel.Sql.Add('AND (ORDEM_SERVICO.TIPO_ATENDIMENTO = :TIPO_ATENDIMENTO)');

    QRel.ParamByName('TIPO_ATENDIMENTO').AsString := Tipo_Atendimento.Text;
  end;

  if Rel_Fechamento.Checked then
  QRel.Sql.Add('ORDER BY ORDEM_SERVICO.ORDEM_ID, FUNCIONARIOS.NOME, ORDEM_SERVICO.DT_FECHAMENTO, ORDEM_SERVICO.HORAS')
  Else
  QRel.Sql.Add('ORDER BY ORDEM_SERVICO.ORDEM_ID, FUNCIONARIOS.NOME, ORDEM_SERVICO.DT_ORDEM, ORDEM_SERVICO.HORAS');

  QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
  QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

  QRel.Prepare;
  QRel.Open;

  QRLabel13.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;
  QRLabel93.Caption := 'Período: ' + Dtmen.Text + ' a ' + Dtmai.Text;

  if QRel.IsEmpty then
    Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
  else
  begin
    if Modelo.Text = 'Modelo 1' then
      Rel_Ordem_Tecnico.PreviewModal
    else
      Rel_Ordem_Servico.PreviewModal;
  end;
end;

procedure TFrmRelAgenda_Ordens_Servico.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelAgenda_Ordens_Servico.btnTecnicoClick(Sender: TObject);
begin
  try
    Tecnico.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(Tecnico.Text));
  except
    Tecnico.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmRelAgenda_Ordens_Servico.DtmenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
   // Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRelAgenda_Ordens_Servico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRelAgenda_Ordens_Servico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
QStatus.Open;
QAtend.Open;
end;

procedure TFrmRelAgenda_Ordens_Servico.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);
  QStatus.Open;
  QAtend.Open;
end;

procedure TFrmRelAgenda_Ordens_Servico.TecnicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = Tecnico) then
    btnTecnicoClick(Self);

  if (Key = Vk_F7) and (Sender = Centro_Custo) then
    btnCentro_CustoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
