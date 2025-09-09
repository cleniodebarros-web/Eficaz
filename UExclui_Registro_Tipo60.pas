unit UExclui_Registro_Tipo60;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, ExtCtrls, Mask,
  rxToolEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmExclui_Registro_Tipo60 = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    QRel: TFDQuery;
    List_Serial: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenEnter(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExclui_Registro_Tipo60: TFrmExclui_Registro_Tipo60;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmExclui_Registro_Tipo60.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    QRel.Sql.Clear;
    QRel.Sql.Add('DELETE FROM REGISTRO_60A');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL) AND (NUM_SERIE = :NUM_SERIE)');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('NUM_SERIE').AsString    := Copy(List_Serial.Text,6,20);

    QRel.Prepare;
    QRel.ExecSql;



    QRel.Sql.Clear;
    QRel.Sql.Add('DELETE FROM REGISTRO_60D');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL) AND (NUM_SERIE = :NUM_SERIE)');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('NUM_SERIE').AsString    := Copy(List_Serial.Text,6,20);

    QRel.Prepare;
    QRel.ExecSql;



    QRel.Sql.Clear;
    QRel.Sql.Add('DELETE FROM REGISTRO_60I');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL) AND (NUM_SERIE = :NUM_SERIE)');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('NUM_SERIE').AsString    := Copy(List_Serial.Text,6,20);

    QRel.Prepare;
    QRel.ExecSql;



    QRel.Sql.Clear;
    QRel.Sql.Add('DELETE FROM REGISTRO_60M');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_EMISSAO BETWEEN :DT_INICIAL AND :DT_FINAL) AND (NUM_SERIE = :NUM_SERIE)');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;
    QRel.ParamByName('NUM_SERIE').AsString    := Copy(List_Serial.Text,6,20);

    QRel.Prepare;
    QRel.ExecSql;



    QRel.Sql.Clear;
    QRel.Sql.Add('DELETE FROM REGISTRO_60R');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(MES_ANO = :MES_ANO)');

    QRel.ParamByName('MES_ANO').AsString := Copy(Dtmai.Text, 4, 7);

    QRel.Prepare;
    QRel.ExecSql;



    QRel.Sql.Clear;
    QRel.Sql.Add('DELETE FROM REGISTRO_75');
    QRel.Sql.Add('WHERE');
    QRel.Sql.Add('(DT_INICIAL >= :DT_INICIAL)');
    QRel.Sql.Add('AND (DT_FINAL <= :DT_FINAL)');

    QRel.ParamByName('DT_INICIAL').AsDateTime := Dtmen.Date;
    QRel.ParamByName('DT_FINAL').AsDateTime   := Dtmai.Date;

    QRel.Prepare;
    QRel.ExecSql;


  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
    Application.MessageBox('Registros excluídos com sucesso.', PChar(Msg_Title), mb_IconInformation)

  end;

end;

procedure TFrmExclui_Registro_Tipo60.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExclui_Registro_Tipo60.DtmenEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmExclui_Registro_Tipo60.DtmenKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmExclui_Registro_Tipo60.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmExclui_Registro_Tipo60.FormCreate(Sender: TObject);
begin
  Dtmen.Date := StrToDate('01/' + Copy(DateToStr(date), 4, 7));
  Dtmai.Date := Ult_Dia_Mes(date);

  QRel.Sql.Clear;
  QRel.Sql.Add('SELECT SERIAL , NUM_ECF FROM LICENCA_IF WHERE STATUS  = :STATUS ORDER BY NUM_ECF');
  QRel.ParamByName('STATUS').AsString :=  'A';
  QRel.Prepare;
  QRel.Open;

  List_Serial.Items.Clear;

  while not QRel.Eof do
  Begin
  List_Serial.Items.Add(StrZero(QRel.FieldByName('NUM_ECF').AsString,3,0) +' :' + QRel.FieldByName('SERIAL').AsString);
  QRel.Next;
  End;


end;

end.
