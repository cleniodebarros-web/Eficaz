unit UConsulta_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, RXCtrls, StdCtrls, Mask, rxToolEdit,
  rxCurrEdit, jpeg, ExtCtrls, ACBrBase, ACBrFala, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmConsulta_Preco = class(TForm)
    Panel4: TPanel;
    Image2: TImage;
    Panel5: TPanel;
    Label3: TLabel;
    Sub_Tot: TCurrencyEdit;
    Panel1: TPanel;
    Edit1: TEdit;
    Panel3: TPanel;
    Label1: TLabel;
    SecretPanel1: TSecretPanel;
    Panel2: TPanel;
    Label2: TLabel;
    ACBrFala1: TACBrFala;
    Label4: TLabel;
    QProduto: TFDQuery;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta_Preco: TFrmConsulta_Preco;

implementation

uses
  UPrincipal,UConsulta;

{$R *.dfm}

procedure TFrmConsulta_Preco.Edit1Change(Sender: TObject);
begin
  Label4.Caption := Edit1.Text;
end;

procedure TFrmConsulta_Preco.Edit1Exit(Sender: TObject);
begin
  //Edit1.Enabled := False;
  SecretPanel1.Visible := False;
  try
    TRY
    QProduto.Sql.Clear;
    QProduto.Sql.Add('SELECT * FROM PRODUTOS');
    QProduto.Sql.Add('WHERE');
    QProduto.Sql.Add('(PRODUTO_ID = :PRODUTO_ID )');

    if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
    begin
      QProduto.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

      QProduto.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
    end;

    QProduto.ParamByName('PRODUTO_ID').AsInteger :=  StrToInt(Edit1.Text);


    QProduto.Prepare;
    QProduto.Open;

   except
    QProduto.Sql.Clear;
    QProduto.Sql.Add('SELECT * FROM PRODUTOS');
    QProduto.Sql.Add('WHERE');
    QProduto.Sql.Add('(COD_BARRA = :COD_BARRA OR COD_BARRA_AUX1 = :COD_BARRA OR COD_BARRA_AUX2 = :COD_BARRA OR COD_BARRA_AUX3 = :COD_BARRA OR COD_BARRA_AUX4 = :COD_BARRA)');

    if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
    begin
      QProduto.Sql.Add('AND (LOCALIZACAO_ID = :LOCALIZACAO_ID)');

      QProduto.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
    end;

    QProduto.ParamByName('COD_BARRA').AsString := Edit1.Text;


    QProduto.Prepare;
    QProduto.Open;

   END;

    if QProduto.IsEmpty then
    begin
      Label1.Caption := 'Código Inexistente';
      Sub_Tot.Value := 0;
      Application.ProcessMessages;
      Sleep(2000);
      Edit1.Enabled := True;
      Edit1.SetFocus;
    end
    else
    begin
      Label1.Caption := Alltrim(QProduto.FieldByName('DESCRICAO').AsString);
      Sub_Tot.Value := QProduto.FieldByName('PRECO_VAREJO').AsFloat;
      Application.ProcessMessages;
     {if Sub_Tot.Value > 0 then
      begin
        ACBrFala1.ValorFalar := Sub_Tot.Value;
        ACBrFala1.Falar;
      end;}
    end;
  finally
    Sleep(2000);
    SecretPanel1.Visible := True;
    Sub_Tot.Value := 0;
    Edit1.Enabled := True;
  //Edit1.Visible := False;
    Edit1.SetFocus;
  end;
end;

procedure TFrmConsulta_Preco.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);
  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
  if (Key = Vk_F7) Then
    Begin
    Edit1.Text :=  IntToStr(GetConsulta('ESTOQUE', FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger, 0 , 1));
    Edit1Exit(edit1);
    End;
end;

procedure TFrmConsulta_Preco.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TFrmConsulta_Preco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConsulta_Preco.FormCreate(Sender: TObject);
begin
  if LeIni(Arq_Ini, 'Sistema', 'Marketing') <> '' then
  begin
    SecretPanel1.Lines.Clear;
    SecretPanel1.Lines.Add(LeIni(Arq_Ini, 'Sistema', 'Marketing'));
  end;
end;

procedure TFrmConsulta_Preco.FormShow(Sender: TObject);
begin
  AcbrFala1.OrigemArquivos := ExtractFilePath(ParamStr(0)) + 'Sons\';
  Edit1.SetFocus;


end;

end.
