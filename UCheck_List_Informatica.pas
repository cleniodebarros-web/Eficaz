unit UCheck_List_Informatica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Buttons, ComCtrls, Mask, DB,
  IBCustomDataSet, IBQuery, IBUpdateSQL, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TFrmCheck_List_Informatica = class(TForm)
    DBRadioGroup1: TDBRadioGroup;
    Panel1: TPanel;
    btnRetorna: TBitBtn;
    Label5: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup7: TDBRadioGroup;
    DBRadioGroup8: TDBRadioGroup;
    DBRadioGroup9: TDBRadioGroup;
    DBRadioGroup10: TDBRadioGroup;
    DBRadioGroup11: TDBRadioGroup;
    DBRadioGroup12: TDBRadioGroup;
    DBRadioGroup13: TDBRadioGroup;
    DBRadioGroup14: TDBRadioGroup;
    DBRadioGroup15: TDBRadioGroup;
    DBRadioGroup16: TDBRadioGroup;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DataSub_Detail: TDataSource;
    btnExecuta: TBitBtn;
    Label1: TLabel;
    QSub_Detail: TFDQuery;
    USql_OrcItens: TFDUpdateSQL;
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QSub_DetailNewRecord(DataSet: TDataSet);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCheck_List_Informatica: TFrmCheck_List_Informatica;
  ID: Integer;

  procedure CheckList_Informatica(Ordem: Integer);

implementation

uses
  UData;

{$R *.dfm}

procedure CheckList_Informatica(Ordem: Integer);
begin
  ID := Ordem;

  Application.CreateForm(TFrmCheck_List_Informatica, FrmCheck_List_Informatica);
  try
    FrmCheck_List_Informatica.ShowModal;
  finally
    FrmCheck_List_Informatica.Release;
  end;
end;

procedure TFrmCheck_List_Informatica.btnExecutaClick(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    QSub_Detail.Post;

  end;

  Close;
end;

procedure TFrmCheck_List_Informatica.DBComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmCheck_List_Informatica.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmCheck_List_Informatica.FormCreate(Sender: TObject);
begin
  QSub_Detail.Close;

  QSub_Detail.ParamByName('ORDEM_ID').AsInteger := ID;

  QSub_Detail.Prepare;
  QSub_Detail.Open;

  if QSub_Detail.IsEmpty then
  begin
    QSub_Detail.Append;
    QSub_Detail.Post;


  end;
end;

procedure TFrmCheck_List_Informatica.QSub_DetailNewRecord(DataSet: TDataSet);
begin
  DataSet['ORDEM_ID']            := ID;
  DataSet['CHECK_LIST']          := -1;
  DataSet['COMBUSTIVEL']         := -1;
  DataSet['ESTADO_PINTURA']      := -1;
  DataSet['TAMPA_LAT_ESQ']       := -1;
  DataSet['TAMPA_LAT_DIR']       := -1;
  DataSet['TANQUE_COMB']         := -1;
  DataSet['PARALAMA_DIANT']      := -1;
  DataSet['RETROVISOR_ESQ']      := -1;
  DataSet['RETROVISOR_DIR']      := -1;
  DataSet['PISCA_TRASEIRO']      := -1;
  DataSet['PISCA_DIANTEIRO']     := -1;
  DataSet['FAROLETE']            := -1;
  DataSet['MANETE']              := -1;
  DataSet['MANICOTO']            := -1;
  DataSet['JOGO_FERRAMENTA']     := -1;
  DataSet['ELASTICOS']           := -1;
  DataSet['FLANELA']             := -1;
  DataSet['REVISAO']             := -1;
  DataSet['LAVAGEM']             := -1;
  DataSet['TROCA_TRANSMISSAO']   := -1;
  DataSet['TROCA_DIRECAO']       := -1;
  DataSet['TROCA_RET_BENGALA']   := -1;
  DataSet['TROCA_ROL_DIANT']     := -1;
  DataSet['TROCA_ROL_TRAS']      := -1;
  DataSet['TROCA_RET_EMBREAGEM'] := -1;
  DataSet['MOTOR']               := -1;
  DataSet['TROCA_PATIM_DIANT']   := -1;
  DataSet['TROCA_PATIM_TRAS']    := -1;
  DataSet['TROCA_AGULHA_CARB']   := -1;
  DataSet['TROCA_PECAS']         := -1;
  DataSet['TROCA_ACESSORIOS']    := -1;
end;

end.
