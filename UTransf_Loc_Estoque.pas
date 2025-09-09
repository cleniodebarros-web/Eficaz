unit UTransf_Loc_Estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.DBCtrls,
  Vcl.StdCtrls, RxToolEdit, Vcl.Buttons, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, RxCurrEdit, Vcl.ExtCtrls;

type
  TFrmTransf_Loc_Estoque = class(TForm)
    Panel1: TPanel;
    Qtd_loc_ori: TRxCalcEdit;
    Qlocalizacao_Estoque: TFDQuery;
    QRel: TFDQuery;
    btnRetorna: TBitBtn;
    BtnGrava: TBitBtn;
    DT_TRANSF: TDateEdit;
    Label92: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Qtd_Loc_dest: TRxCalcEdit;
    Qtd_Estoque_atual: TRxCalcEdit;
    Label5: TLabel;
    QUpdate: TFDQuery;
    localizacao_id_ori: TDBLookupComboBox;
    localizacao_id_dest: TDBLookupComboBox;
    QLoc_Estoque: TFDQuery;
    DataLocEstoque: TDataSource;
    DataLocEstoqdest: TDataSource;
    QLoc_Estoque_dest: TFDQuery;
    Label_Produto: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Qtd_Estoque_atualChange(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure localizacao_id_oriCloseUp(Sender: TObject);
    procedure localizacao_id_destCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTransf_Loc_Estoque: TFrmTransf_Loc_Estoque;
  ID:Integer;
  procedure Transferencia_Estoque(Produto_id: Integer);

implementation

Uses
UPrincipal,Udata;

{$R *.dfm}
procedure Transferencia_Estoque(Produto_id: Integer);
begin
  ID := Produto_id;

  Application.CreateForm(TFrmTransf_Loc_Estoque, FrmTransf_Loc_Estoque);
  try
    FrmTransf_Loc_Estoque.ShowModal;
  finally
    FrmTransf_Loc_Estoque.Release;
  end;
end;

procedure TFrmTransf_Loc_Estoque.BtnGravaClick(Sender: TObject);
begin
    if Application.MessageBox('Deseja efetuar a transferência da localização do estoque?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
   Begin

     try


     QUpdate.Sql.Clear;
     QUpdate.Sql.Add('INSERT INTO LOCALIZACAO_ESTOQUE_PRODUTOS(PRODUTO_ID,LOCALIZACAO_ID,DESCRICAO,DT_SAIDA,QUANTIDADE,TRANSACAO_ID) ' +
                     'VALUES(:PRODUTO_ID,:LOCALIZACAO_ID,:DESCRICAO,:DT_SAIDA,:QUANTIDADE,:TRANSACAO_ID)');

     QUpdate.ParamByName('PRODUTO_ID').AsInteger     := ID;
     QUpdate.ParamByName('LOCALIZACAO_ID').AsInteger := QLoc_Estoque_Dest.FieldByName('TABELA_ID').AsInteger;
     QUpdate.ParamByName('DESCRICAO').AsString       := QLoc_Estoque_Dest.FieldByName('DESCRICAO').AsString;
     QUpdate.ParamByName('DT_SAIDA').AsDateTime      := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
     QUpdate.ParamByName('QUANTIDADE').AsFloat       := Qtd_Estoque_Atual.Value ;
     QUpdate.ParamByName('TRANSACAO_ID').AsInteger   := 0;

     QUpdate.Prepare;
     QUpdate.ExecSQL;




     QUpdate.Sql.Clear;
     QUpdate.Sql.Add('INSERT INTO LOCALIZACAO_ESTOQUE_PRODUTOS(PRODUTO_ID,LOCALIZACAO_ID,DESCRICAO,DT_ENTRADA,QUANTIDADE,TRANSACAO_ID) ' +
                     'VALUES(:PRODUTO_ID,:LOCALIZACAO_ID,:DESCRICAO,:DT_ENTRADA,:QUANTIDADE,:TRANSACAO_ID)');

     QUpdate.ParamByName('PRODUTO_ID').AsInteger     := ID;
     QUpdate.ParamByName('LOCALIZACAO_ID').AsInteger := QLoc_Estoque.FieldByName('TABELA_ID').AsInteger;
     QUpdate.ParamByName('DESCRICAO').AsString       := QLoc_Estoque.FieldByName('DESCRICAO').AsString;
     QUpdate.ParamByName('DT_ENTRADA').AsDateTime    := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
     QUpdate.ParamByName('QUANTIDADE').AsFloat       := (Qtd_Estoque_Atual.Value) * -1;
     QUpdate.ParamByName('TRANSACAO_ID').AsInteger   := 0;

     QUpdate.Prepare;
     QUpdate.ExecSQL;



     Except
      on e:Exception do
        begin
          Application.MessageBox(PChar('Erro ao gravar:' + #13 +
            'Erro: ' + e.Message), 'Erro', MB_ICONSTOP + MB_TASKMODAL);
        end;
     end;


     Application.MessageBox('Processo concluído com sucesso.','Eficaz', MB_IconInformation + MB_OK);

     QLoc_Estoque.Close;
     QLoc_Estoque_Dest.Close;
     Qtd_Estoque_Atual.Value := 0;
     BtnGrava.Enabled := False;
     Close;
   End;


end;

procedure TFrmTransf_Loc_Estoque.FormShow(Sender: TObject);
begin
 QRel.Sql.Clear;
 QRel.Sql.Text := 'SELECT DESCRICAO FROM PRODUTOS WHERE PRODUTO_ID = :PRODUTO_ID';
 QRel.ParamByName('PRODUTO_ID').AsInteger := ID;
 QRel.Prepare;
 QRel.Open;

 Label_Produto.Caption := 'Produto: ' + QRel.FieldByName('DESCRICAO').AsString;

QLoc_Estoque.open;
QLoc_Estoque_Dest.Open;
{
QLocalizacao_Estoque.Close;
QLocalizacao_Estoque.ParamByName('PRODUTO_ID').AsInteger  := ID;
QLocalizacao_Estoque.ParamByName('DESCRICAO').AsString    := QLoc_Estoque.FieldByName('DESCRICAO').AsString;
QLocalizacao_Estoque.Prepare;
QLocalizacao_Estoque.Open;

Qtd_Loc_ori.Value := QLocalizacao_Estoque.FieldByName('QUANTIDADE').AsFloat;

QLocalizacao_Estoque.Close;
QLocalizacao_Estoque.ParamByName('PRODUTO_ID').AsInteger := ID;
QLocalizacao_Estoque.ParamByName('DESCRICAO').AsString   := QLoc_Estoque_Dest.FieldByName('DESCRICAO').AsString;
QLocalizacao_Estoque.Prepare;
QLocalizacao_Estoque.Open;
}

Qtd_Loc_ori.Value  := 0;

Qtd_Loc_Dest.Value := 0;

DT_TRANSF.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;

end;

procedure TFrmTransf_Loc_Estoque.localizacao_id_destCloseUp(Sender: TObject);
begin
QLocalizacao_Estoque.Close;
QLocalizacao_Estoque.ParamByName('PRODUTO_ID').AsInteger := ID;
QLocalizacao_Estoque.ParamByName('DESCRICAO').AsString   := QLoc_Estoque_Dest.FieldByName('DESCRICAO').AsString;
QLocalizacao_Estoque.Prepare;
QLocalizacao_Estoque.Open;

Qtd_Loc_Dest.Value := QLocalizacao_Estoque.FieldByName('QUANTIDADE').AsFloat;
end;

procedure TFrmTransf_Loc_Estoque.localizacao_id_oriCloseUp(Sender: TObject);
begin
QLocalizacao_Estoque.Close;
QLocalizacao_Estoque.ParamByName('PRODUTO_ID').AsInteger := ID;
QLocalizacao_Estoque.ParamByName('DESCRICAO').AsString   := QLoc_Estoque.FieldByName('DESCRICAO').AsString;
QLocalizacao_Estoque.Prepare;
QLocalizacao_Estoque.Open;

Qtd_Loc_ori.Value  := QLocalizacao_Estoque.FieldByName('QUANTIDADE').AsFloat;

end;

procedure TFrmTransf_Loc_Estoque.Qtd_Estoque_atualChange(Sender: TObject);
begin
IF ((Qtd_Loc_Ori.Value > 0) and (Qtd_Estoque_Atual.Value > 0))  Then
btnGrava.Enabled := True
Else
BtnGrava.Enabled := False;
end;

end.
