unit UUnificar_SPED_Pis_Cofins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, rxCurrEdit, rxToolEdit, Buttons, CheckLst,
  DB, DBTables,IdHashMessageDigest,ShellApi, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type

  { TFrmSPED_Pis_Cofins }

  TFrmUnificar_SPED_Pis_Cofins = class(TForm)
    edtFile: TEdit;
    Label1: TLabel;
    Matriz: TEdit;
    btnMatriz: TSpeedButton;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Label2: TLabel;
    Filiais: TCheckListBox;
    btnFiliais: TSpeedButton;
    Panel2: TPanel;
    Senha: TEdit;
    Label3: TLabel;
    Table_Temp: TFDMemTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnMatrizClick(Sender: TObject);
    procedure btnFiliaisClick(Sender: TObject);
    procedure MatrizKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    function Soma_Registros(Registro: String): Integer;
  end;

var
  FrmUnificar_SPED_Pis_Cofins: TFrmUnificar_SPED_Pis_Cofins;

implementation

uses
  UData, UPrincipal, UGerar_Base_Sped;

{$R *.dfm}

procedure TFrmUnificar_SPED_Pis_Cofins.btnExecutaClick(Sender: TObject);
var
Laudo, Temp_Name,Ult_Cst: String;
F1, F2: TextFile;
S, W: String;
Colunas, Col_Filiais: TStringList;
X, Tot_Reg_A, Tot_Reg_B ,Tot_Reg_C, Tot_Reg_D,Tot_Reg_M, Regs: Integer;
M_acumM100, M_AcumF100, M1_acumM100, M1_acumF100,
M_acumM105, M_AcumF105, M_AcumM200, M_AcumF200, M1_acumM200, M1_acumF200,M2_acumM200, M2_acumF200,
M_acumM210, M_AcumF210, M1_AcumM210, M1_acumF210,
M_acumM500, M_AcumF500, M1_acumM500, M1_acumF500,
M_acumM505, M_AcumF505, M_AcumM600, M_AcumF600, M1_acumM600, M1_acumF600,M2_acumM600, M2_acumF600,
M_acumM610, M_AcumF610, M1_AcumM610, M1_acumF610 :real;
servico : boolean;
Md5 : TIdHashMessageDigest5;
fs  : TFileStream;
begin

 Md5 :=  TIdHashMessageDigest5.Create;
 fs := TFileStream.Create(Matriz.Text, fmOpenRead OR fmShareDenyWrite) ;

 if Senha.Text = '' then
 Begin
 AssignFile(F1, 'C:\WINDOWS\SYSTEM32\' + Copy(matriz.Text,21,19));
 Reset(F1);
 while not Eof(F1) do
 ReadLn(F1, S);
 End;

 if (Copy(S,1,33) = MD5.HashStringAsHex(Md5.HashStreamAsHex(Fs))) OR (Senha.Text = LowerCase(MD5.HashStringAsHex(('AMO A DEUS E MINHA FAMILIA'+ DateTostr(date))))) then

 Begin

 try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;
    Filiais.Enabled    := False;
    btnMatriz.Enabled  := False;
    btnFiliais.Enabled := False;
    Panel2.Visible     := True;

    try
      with Table_Temp do
      begin
        Temp_Name    := Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2);

        with FieldDefs do
        begin
          Clear;
          Add('CODIGO', ftAutoInc, 0, False);
          Add('REGISTRO', ftString, 4, False);
          Add('LINHA', ftString, 250, False);
          Add('CST', ftString, 3, False);
          Add('NATREC', ftString, 3, False);
          Add('VALOR_01', ftFloat, 0, False);
          Add('VALOR_02', ftFloat, 0, False);
          Add('VALOR_03', ftFloat, 0, False);
         {Add('VALOR_05', ftFloat, 0, False);
          Add('VALOR_06', ftFloat, 0, False);
          Add('VALOR_07', ftFloat, 0, False);
          Add('VALOR_08', ftFloat, 0, False);
          Add('VALOR_09', ftFloat, 0, False);
          Add('VALOR_10', ftFloat, 0, False);
          Add('VALOR_11', ftFloat, 0, False);
          Add('VALOR_12', ftFloat, 0, False);
          Add('VALOR_13', ftFloat, 0, False);
          Add('VALOR_14', ftFloat, 0, False);
          Add('VALOR_15', ftFloat, 0, False);
          Add('VALOR_16', ftFloat, 0, False);
          Add('VALOR_17', ftFloat, 0, False);
          Add('VALOR_18', ftFloat, 0, False);
          Add('VALOR_19', ftFloat, 0, False);
          Add('VALOR_20', ftFloat, 0, False);
}        end;

        with IndexDefs do
        begin
          Clear;
          Add('', 'CODIGO', [ixPrimary, ixUnique]);
          Add('TEMP', 'REGISTRO', [ixCaseInsensitive]);
        end;

        Open;

        IndexName := 'TEMP';
      end;
    except
      Application.MessageBox('Ocorreu um erro ao criar um arquivo temporário', PChar(Msg_Title), mb_IconStop);
      exit;
    end;

    AssignFile(F1, Matriz.Text);
    Reset(F1);
    Servico := False;
    while not Eof(F1) do
    begin
      ReadLn(F1, S);

      try
        Colunas := TStringList.Create;

        Colunas.Text := StringReplace(S, '|', #13, [rfReplaceAll]);

        if (Colunas[1] = '0000') or (Colunas[1] = '0001') or (Colunas[1] = '0100') or (Colunas[1] = '0110') or (Colunas[1] = '0140') or (Colunas[1] = '0150') or (Colunas[1] = '0190') or (Colunas[1] = '0200')  then
        begin
          Table_Temp.Append;
          Table_Temp.FieldByName('REGISTRO').AsString := Colunas[1];
          Table_Temp.FieldByName('LINHA').AsString    := S;
          Table_Temp.Post;

          if  (Colunas[1] = '0200') and (Copy(Colunas[2],1,1) ='S') then
               Servico := True;

        end;
      finally
        Colunas.Free;
      end;

      Application.ProcessMessages;
    end;

    CloseFile(F1);

    for X := 0 to (Filiais.Items.Count - 1) do
    begin

      if Filiais.Checked[X] then
      begin
        AssignFile(F2, Filiais.Items.Strings[X]);
        Reset(F2);
        while not Eof(F2) do
        begin
          ReadLn(F2, W);

          try
            Col_Filiais := TStringList.Create;

            Col_Filiais.Text := StringReplace(W, '|', #13, [rfReplaceAll]);

            if (Col_Filiais[1] = '0140') or (Col_Filiais[1] = '0150') or (Col_Filiais[1] = '0190') or (Col_Filiais[1] = '0200')   then
            begin

              //|0150|F001650|ESTRELA DE DAVI ALIMENTOS LTDA|1058|25074228000157||0027842770042|3143302||RUA RUI BARBOSA|103||CENTRO|

              IF (Col_Filiais[1] = '0150') and (Copy(Col_filiais[2],1,1) ='F') then
              begin
              Table_Temp.Append;
              Table_Temp.FieldByName('REGISTRO').AsString := Col_Filiais[1];
              Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + 'F' + IntToStr(X + 1) +  Copy(Col_filiais[2],3,5) + '|' + Col_Filiais[3] + '|' + Col_Filiais[4] + '|' +
              Col_Filiais[5] + '|' + Col_Filiais[6] + '|' + Col_Filiais[7] + '|' + Col_Filiais[8] + '|' + Col_Filiais[9] + '|' + Col_Filiais[10] + '|' + Col_Filiais[11] + '|' + Col_Filiais[12] + '|' + Col_Filiais[13] + '|';
              Table_Temp.Post;
              end
              else
              Begin
              Table_Temp.Append;
              Table_Temp.FieldByName('REGISTRO').AsString := Col_Filiais[1];
              Table_Temp.FieldByName('LINHA').AsString    := W;
              Table_Temp.Post;
              End;

              if  (Col_Filiais[1] = '0200') and (Copy(Col_filiais[2],1,1) ='S') then
               Servico := True;

            end;
          finally
            Col_Filiais.Free;
          end;
           Panel2.Caption := S;

          Application.ProcessMessages;
        end;

        CloseFile(F2);
      end;
    end;

    AssignFile(F1, Matriz.Text);
    Reset(F1);
    while not Eof(F1) do
    begin
      ReadLn(F1, S);
      try
        Colunas := TStringList.Create;

        Colunas.Text := StringReplace(S, '|', #13, [rfReplaceAll]);

        if (Colunas[1] = '0500') or (Colunas[1] = '0600')  then
        begin
          Table_Temp.Append;
          Table_Temp.FieldByName('REGISTRO').AsString := Colunas[1];
          Table_Temp.FieldByName('LINHA').AsString    := S;
          Table_Temp.Post;

        end;
      finally
        Colunas.Free;
      end;

      Application.ProcessMessages;
    end;

     CloseFile(F1);


    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := '0990';
    Table_Temp.FieldByName('LINHA').AsString    := '|0990|' + IntToStr((Table_Temp.RecordCount + 1)) + '|';
    Table_Temp.Post;

    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := 'A001';

    if servico  then
    Table_Temp.FieldByName('LINHA').AsString    := '|A001|0|'
    Else
    Table_Temp.FieldByName('LINHA').AsString    := '|A001|1|' ;

    Table_Temp.Post;

    Tot_Reg_A := 1;

    AssignFile(F1, Matriz.Text);
    Reset(F1);

    while not Eof(F1) do
    begin
      ReadLn(F1, S);

      try
        Colunas := TStringList.Create;

        Colunas.Text := StringReplace(S, '|', #13, [rfReplaceAll]);

        if (Colunas[1] = 'A010') or (Colunas[1] = 'A100') or (Colunas[1] = 'A120') or
           (Colunas[1] = 'A170') then
        begin
          Table_Temp.Append;
          Table_Temp.FieldByName('REGISTRO').AsString := Colunas[1];
          Table_Temp.FieldByName('LINHA').AsString    := S;
          Table_Temp.Post;

          Inc(Tot_Reg_A);
        end;
      finally
        Colunas.Free;
      end;

      Panel2.Caption := S;

      Application.ProcessMessages;
    end;

    CloseFile(F1);

    for X := 0 to (Filiais.Items.Count - 1) do
    begin
      if Filiais.Checked[X] then
      begin
        AssignFile(F2, Filiais.Items.Strings[X]);
        Reset(F2);

        while not Eof(F2) do
        begin
          ReadLn(F2, W);

          try
            Col_Filiais := TStringList.Create;

            Col_Filiais.Text := StringReplace(W, '|', #13, [rfReplaceAll]);

            if (Col_Filiais[1] = 'A010') or (Col_Filiais[1] = 'A100') or (Col_Filiais[1] = 'A120') or
               (Col_Filiais[1] = 'A170') then
            begin
              Table_Temp.Append;
              Table_Temp.FieldByName('REGISTRO').AsString := Col_Filiais[1];
              Table_Temp.FieldByName('LINHA').AsString    := W;
              Table_Temp.Post;

              Inc(Tot_Reg_A);
            end;
          finally
            Col_Filiais.Free;
          end;

          Panel2.Caption := W;

          Application.ProcessMessages;
        end;

        CloseFile(F2);
      end;
    end;

    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := 'A990';
    Table_Temp.FieldByName('LINHA').AsString    := '|A990|' + IntToStr((Tot_Reg_A + 1)) + '|';
    Table_Temp.Post;


    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := 'C001';
    Table_Temp.FieldByName('LINHA').AsString    := '|C001|1|';
    Table_Temp.Post;

    Tot_Reg_C := 1;

    AssignFile(F1, Matriz.Text);
    Reset(F1);

    while not Eof(F1) do
    begin
      ReadLn(F1, S);

      try
        Colunas := TStringList.Create;

        Colunas.Text := StringReplace(S, '|', #13, [rfReplaceAll]);

        if (Colunas[1] = 'C010') or (Colunas[1] = 'C100') or (Colunas[1] = 'C170') or
           (Colunas[1] = 'C400') or (Colunas[1] = 'C405') or (Colunas[1] = 'C481') or
           (Colunas[1] = 'C485') or (Colunas[1] = 'C500') or (Colunas[1] = 'C501') or
           (Colunas[1] = 'C505') or (Colunas[1] = 'C380') or (Colunas[1] = 'C381') or
           (Colunas[1] = 'C385') or (Colunas[1] = 'C175') then
        begin
          Table_Temp.Append;
          Table_Temp.FieldByName('REGISTRO').AsString := Colunas[1];
          Table_Temp.FieldByName('LINHA').AsString    := S;
          Table_Temp.Post;

          Inc(Tot_Reg_C);
        end;
      finally
        Colunas.Free;
      end;

      Panel2.Caption := S;

      Application.ProcessMessages;
    end;

    CloseFile(F1);

    for X := 0 to (Filiais.Items.Count - 1) do
    begin
      if Filiais.Checked[X] then
      begin
        AssignFile(F2, Filiais.Items.Strings[X]);
        Reset(F2);

        while not Eof(F2) do
        begin
          ReadLn(F2, W);

          try
            Col_Filiais := TStringList.Create;

            Col_Filiais.Text := StringReplace(W, '|', #13, [rfReplaceAll]);

            if (Col_Filiais[1] = 'C010') or (Col_Filiais[1] = 'C100') or (Col_Filiais[1] = 'C170') or
               (Col_Filiais[1] = 'C400') or (Col_Filiais[1] = 'C405') or (Col_Filiais[1] = 'C481') or
               (Col_Filiais[1] = 'C485') or (Col_Filiais[1] = 'C500') or (Col_Filiais[1] = 'C501') or
               (Col_Filiais[1] = 'C505') or (Col_Filiais[1] = 'C380') or (Col_Filiais[1] = 'C381') or
               (Col_Filiais[1] = 'C385') or (Col_Filiais[1] = 'C175') then
            begin

             //|C100|0|1|F002038|55|00|001|1|31181217018976000194550010000000011005100252|28122018|02012019|1950|2|0|0|1950|9|0|0|0|0|0|0|0|0|0|0|0|0|



             if (Col_Filiais[1] = 'C100') and (Copy(Col_filiais[4],1,1) ='F') Then
             begin
              Table_Temp.Append;
              Table_Temp.FieldByName('REGISTRO').AsString := Col_Filiais[1];
              Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' + Col_Filiais[3] + '|' + 'F' + IntToStr(X + 1) +  Copy(Col_filiais[4],3,5) +
              Copy(W,18,length(W));
              Table_Temp.Post;
             end
              //|C500|F000001|06|00|01|0|84407776|22012019|22012019|356,98|0||5,89|27,13|
             Else
             Begin
               if (Col_Filiais[1] = 'C500') and (Copy(Col_filiais[2],1,1) ='F') then
               begin

                Table_Temp.Append;
                Table_Temp.FieldByName('REGISTRO').AsString := Col_Filiais[1];
                Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + 'F' + IntToStr(X + 1) +  Copy(Col_filiais[2],3,5) +
                Copy(W,14,length(W));
                Table_Temp.Post;
               end
               else
               begin
                Table_Temp.Append;
                Table_Temp.FieldByName('REGISTRO').AsString := Col_Filiais[1];
                Table_Temp.FieldByName('LINHA').AsString    := W;
                Table_Temp.Post;
               end;
             End;

              Inc(Tot_Reg_C);
            end;
          finally
            Col_Filiais.Free;
          end;

          Panel2.Caption := W;

          Application.ProcessMessages;
        end;

        CloseFile(F2);
      end;
    end;

    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := 'C990';
    Table_Temp.FieldByName('LINHA').AsString    := '|C990|' + IntToStr((Tot_Reg_C + 1)) + '|';
    Table_Temp.Post;

    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := 'D001';
    Table_Temp.FieldByName('LINHA').AsString    := '|D001|1|';
    Table_Temp.Post;

    Tot_Reg_D := 1;

    AssignFile(F1, Matriz.Text);
    Reset(F1);

    while not Eof(F1) do
    begin
      ReadLn(F1, S);

      try
        Colunas := TStringList.Create;

        Colunas.Text := StringReplace(S, '|', #13, [rfReplaceAll]);

        if (Colunas[1] = 'D010') or (Colunas[1] = 'D100') or (Colunas[1] = 'D101') or
           (Colunas[1] = 'D105') or (Colunas[1] = 'D200') or (Colunas[1] = 'D201') or
           (Colunas[1] = 'D205') or (Colunas[1] = 'D500') or (Colunas[1] = 'D501') or
           (Colunas[1] = 'D505') or (Colunas[1] = 'D600') or (Colunas[1] = 'D601') or
           (Colunas[1] = 'D605') then
        begin

           Table_Temp.Append;
           Table_Temp.FieldByName('REGISTRO').AsString := Colunas[1];
           Table_Temp.FieldByName('LINHA').AsString    := S;
           Table_Temp.Post;

          Inc(Tot_Reg_D);
        end;
      finally
        Colunas.Free;
      end;

      Panel2.Caption := S;

      Application.ProcessMessages;
    end;

    CloseFile(F1);

    for X := 0 to (Filiais.Items.Count - 1) do
    begin
      if Filiais.Checked[X] then
      begin
        AssignFile(F2, Filiais.Items.Strings[X]);
        Reset(F2);

        while not Eof(F2) do
        begin
          ReadLn(F2, W);

          try
            Col_Filiais := TStringList.Create;

            Col_Filiais.Text := StringReplace(W, '|', #13, [rfReplaceAll]);

            if (Col_Filiais[1] = 'D010') or (Col_Filiais[1] = 'D100') or (Col_Filiais[1] = 'D101') or
               (Col_Filiais[1] = 'D105') or (Col_Filiais[1] = 'D200') or (Col_Filiais[1] = 'D201') or
               (Col_Filiais[1] = 'D205') or (Col_Filiais[1] = 'D500') or (Col_Filiais[1] = 'D501') or
               (Col_Filiais[1] = 'D505') or (Col_Filiais[1] = 'D600') or (Col_Filiais[1] = 'D601') or
               (Col_Filiais[1] = 'D605') then
            begin


              //|D500|0|1|F000290|22|00|01|0|7453|01012019|01012019|56,86|0|56,86|0|0|0|0|0||0|0|
              //|D100|0|1|F000178|57|00|01||552193|31190116505190000139570010005521931002138989|02012019|02012019|||32,16|0|9|32,16|0|0|0||31|
              if ((Col_Filiais[1] = 'D500') or (Col_Filiais[1] = 'D100'))  and (Copy(Col_filiais[4],1,1) ='F') Then
              begin
               Table_Temp.Append;
               Table_Temp.FieldByName('REGISTRO').AsString := Col_Filiais[1];
               Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' + Col_Filiais[3] + '|' + 'F' + IntToStr(X + 1) +  Copy(Col_filiais[4],3,5) +
               Copy(W,18,length(W));
               Table_Temp.Post;
              end
              else
              Begin
              Table_Temp.Append;
              Table_Temp.FieldByName('REGISTRO').AsString := Col_Filiais[1];
              Table_Temp.FieldByName('LINHA').AsString    := W;
              Table_Temp.Post;
              End;

              Inc(Tot_Reg_D);
            end;
          finally
            Col_Filiais.Free;
          end;

          Panel2.Caption := W;

          Application.ProcessMessages;
        end;

        CloseFile(F2);
      end;
    end;

    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := 'D990';
    Table_Temp.FieldByName('LINHA').AsString    := '|D990|' + IntToStr((Tot_Reg_D + 1)) + '|';
    Table_Temp.Post;

    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := 'F001';
    Table_Temp.FieldByName('LINHA').AsString    := '|F001|1|';
    Table_Temp.Post;

    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := 'F990';
    Table_Temp.FieldByName('LINHA').AsString    := '|F990|2|';
    Table_Temp.Post;

    AssignFile(F1, Matriz.Text);
    Reset(F1);

    while not Eof(F1) do
    begin
      ReadLn(F1, S);

      try
        Colunas := TStringList.Create;

        Colunas.Text := StringReplace(S, '|', #13, [rfReplaceAll]);

        if Copy(Colunas[1], 1, 1) = 'M' then
        begin
          Table_Temp.Append;
          Table_Temp.FieldByName('REGISTRO').AsString := Colunas[1];
          Table_Temp.FieldByName('LINHA').AsString    := S;
          if (Colunas[1] = 'M400') or (Colunas[1] = 'M800') Then
          Begin
          Ult_Cst := Colunas[2];
          Table_Temp.FieldByName('CST').AsString      := Colunas[2];
          Table_Temp.FieldByName('VALOR_01').AsFloat  := StrToFloat(Colunas[3]);

          End;

          if (Colunas[1] = 'M410') or (Colunas[1] = 'M810') Then
          Begin
          Table_Temp.FieldByName('CST').AsString      := Ult_Cst;
          Table_Temp.FieldByName('NATREC').AsString   := Colunas[2];
          Table_Temp.FieldByName('VALOR_01').AsFloat  := StrToFloat(Colunas[3]);
          End;

          If(Colunas[1] = 'M100') or (Colunas[1] = 'M500')Then
          Begin
          Table_Temp.FieldByName('VALOR_01').AsFloat  := StrToFloat(Colunas[4]);
          Table_Temp.FieldByName('VALOR_02').AsFloat  := StrToFloat(Colunas[8]);
          End;

          If(Colunas[1] = 'M105') or (Colunas[1] = 'M505')Then
          Begin
          Table_Temp.FieldByName('CST').AsString      := Colunas[2];
          Table_Temp.FieldByName('VALOR_01').AsFloat  := StrToFloat(Colunas[4]);

          End;

          If(Colunas[1] = 'M200') or (Colunas[1] = 'M600')Then
          Begin
          Table_Temp.FieldByName('VALOR_01').AsFloat  := StrToFloat(Colunas[2]);
          Table_Temp.FieldByName('VALOR_02').AsFloat  := StrToFloat(Colunas[3]);
          Table_Temp.FieldByName('VALOR_03').AsFloat  := StrToFloat(Colunas[5]);
          End;

          If(Colunas[1] = 'M205') or (Colunas[1] = 'M605')Then
          Begin
          Table_Temp.FieldByName('CST').AsString      := Colunas[2];
          Table_Temp.FieldByName('VALOR_01').AsFloat  := StrToFloat(Colunas[4]);
          End;

          If(Colunas[1] = 'M210') or (Colunas[1] = 'M610')Then
          Begin
          Table_Temp.FieldByName('VALOR_01').AsFloat  := StrToFloat(Colunas[3]);
          Table_Temp.FieldByName('VALOR_02').AsFloat  := StrToFloat(Colunas[4]);
          Table_Temp.FieldByName('VALOR_03').AsFloat  := StrToFloat(Colunas[11]);
          End;
          Table_Temp.Post;
        end;
         Inc(Tot_Reg_M) ;
      finally
        Colunas.Free;
      end;

      Panel2.Caption := S;

      Application.ProcessMessages;
    end;

    CloseFile(F1);
 // INICIO  SOMATORIO M

    for X := 0 to (Filiais.Items.Count - 1) do
    begin
      if Filiais.Checked[X] then
      begin
        AssignFile(F2, Filiais.Items.Strings[X]);
        Reset(F2);

        while not Eof(F2) do
        begin
          ReadLn(F2, W);

          try
            Col_Filiais := TStringList.Create;

            Col_Filiais.Text := StringReplace(W, '|', #13, [rfReplaceAll]);

           //PIS

            if Col_Filiais[1] = 'M100' then
            begin
              if Table_Temp.Locate('REGISTRO', VarArrayOf([Col_Filiais[1], Col_Filiais[2]]), [loCaseInsensitive]) then
              begin
                Table_Temp.Edit;
            //|M100|101|0|168839,23|1,65|0||2785,85|0|0|0|2785,85|0|2785,85|0,00|
                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[4]);
                Table_Temp.FieldByName('VALOR_02').AsFloat  := Table_Temp.FieldByName('VALOR_02').AsFloat + StrToFloat(Col_Filiais[8]);
                Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                Col_Filiais[3] +   '|' + FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|' + Col_Filiais[5] + '|' + Col_Filiais[6] + '|'
                +  Col_Filiais[7]   + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|' + Col_Filiais[9]  + '|' + Col_Filiais[10] + '|'
                +  Col_Filiais[11]  + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|' + Col_Filiais[13] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|'
                +  Col_Filiais[15]  + '|';

                Table_Temp.Post;
              end;
            end;

            if Col_Filiais[1] = 'M105' then
            begin

              if Table_Temp.Locate('REGISTRO;CST', VarArrayOf([Col_Filiais[1], Col_Filiais[2] ]), [loCaseInsensitive]) then
              begin
                Table_Temp.Edit;
            //|M105|01|50|1875||1875|1875||0||
                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[4]);
                Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                Col_Filiais[3] +   '|' + FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|' + Col_Filiais[5] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|'
                +  FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|' + Col_Filiais[8] + '|' + Col_Filiais[9]  + '|' + Col_Filiais[10]  + '|';
                Table_Temp.Post;
              end;
            end;


            if Col_Filiais[1] = 'M200' then
            begin

              if Table_Temp.Locate('REGISTRO', VarArrayOf([Col_Filiais[1]]), [loCaseInsensitive]) then
              begin
                Table_Temp.Edit;
               //M200|1282,79|758,92|0|523,87|0|0|523,87|0|0|0|0|523,87|
               Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[2]);
               Table_Temp.FieldByName('VALOR_02').AsFloat  := Table_Temp.FieldByName('VALOR_02').AsFloat + StrToFloat(Col_Filiais[3]);
               Table_Temp.FieldByName('VALOR_03').AsFloat  := Table_Temp.FieldByName('VALOR_03').AsFloat + StrToFloat(Col_Filiais[5]);
                Table_Temp.FieldByName('LINHA').AsString  := '|' + Col_Filiais[1] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|' +
                FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|' + Col_Filiais[4] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_03').AsFloat) + '|' + Col_Filiais[6] + '|'
                +  Col_Filiais[7] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_03').AsFloat) + '|' + Col_Filiais[9]  + '|' + Col_Filiais[10] + '|' + Col_Filiais[11]
                + '|' + Col_Filiais[12] + '|' +  FloatToStr(Table_Temp.FieldByName('VALOR_03').AsFloat) + '|';
                Table_Temp.Post;
              end;
            end;

            if Col_Filiais[1] = 'M205' then
            begin

              if Table_Temp.Locate('REGISTRO;CST', VarArrayOf([Col_Filiais[1], Col_Filiais[2] ]), [loCaseInsensitive]) then
              begin
                Table_Temp.Edit;
                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[4]);
                Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                Col_Filiais[3] +   '|' + FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|';
                Table_Temp.Post;
              end;
            end;


            if Col_Filiais[1] = 'M210' then
            begin
              if Table_Temp.Locate('REGISTRO', VarArrayOf([Col_Filiais[1]]), [loCaseInsensitive]) then
              begin
               { Table_Temp.Edit;
               //|M210|01|144,2|144,2|1,65|0||2,38|0|0|0|0|2,38|
                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[3]);
                Table_Temp.FieldByName('VALOR_02').AsFloat  := Table_Temp.FieldByName('VALOR_02').AsFloat + StrToFloat(Col_Filiais[8]);
                Table_Temp.FieldByName('LINHA').AsString  := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|' + Col_Filiais[5] + '|' + Col_Filiais[6] + '|'
                +  Col_Filiais[7] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|' + Col_Filiais[9]  + '|' + Col_Filiais[10] + '|' + Col_Filiais[11]
                + '|' + Col_Filiais[12] + '|' +  FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|';
                Table_Temp.Post;
                }

                Table_Temp.Edit;
               //|M210|01|114092,22|114017,42|0|0|114017,42|1,65|0||1881,29|0|0|0|0|1881,29|
               //|M210|01|149257,32|149182,52|0|0||35165,1||1,65|149182,52|1,65|0||2461,51|0||0||0||0|2461,51|

                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[3]);
                Table_Temp.FieldByName('VALOR_02').AsFloat  := Table_Temp.FieldByName('VALOR_02').AsFloat + StrToFloat(Col_Filiais[4]);
                Table_Temp.FieldByName('VALOR_03').AsFloat  := Table_Temp.FieldByName('VALOR_03').AsFloat + StrToFloat(Col_Filiais[11]);
                Table_Temp.FieldByName('LINHA').AsString  := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|' + Col_Filiais[5] + '|' + Col_Filiais[6] + '|'
                +  FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|' + Col_Filiais[8] + '|' + Col_Filiais[9]  + '|' + Col_Filiais[10] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_03').AsFloat)
                + '|' + Col_Filiais[12] + '|'  + Col_Filiais[13] +  '|' + Col_Filiais[14]  + '|' + Col_Filiais[15] + '|' +  FloatToStr(Table_Temp.FieldByName('VALOR_03').AsFloat) + '|';
                Table_Temp.Post;



              end;
            end;

           if Col_Filiais[1] = 'M400' then
            begin

              if Table_Temp.Locate('REGISTRO;CST', VarArrayOf([Col_Filiais[1], Col_Filiais[2]]), [loCaseInsensitive]) then
              begin
               Ult_Cst := Col_Filiais[2];
                Table_Temp.Edit;
            //|M400|04|214654,22|||
                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[3]);
                Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                FloatToStr (Table_Temp.FieldByName('VALOR_01').AsFloat) +   '|' + Col_Filiais[4] + '|' + Col_Filiais[5] + '|' ;
                Table_Temp.Post;
              end;

            end;


            if Col_Filiais[1] = 'M410' then
            begin

              if Table_Temp.Locate('REGISTRO;NATREC;CST', VarArrayOf([Col_Filiais[1], Col_Filiais[2] , Ult_Cst]), [loCaseInsensitive]) then
              begin
                Table_Temp.Edit;
            //|M410|103|214654,22|||
                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[3]);
                Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) +   '|' + Col_Filiais[4] + '|' + Col_Filiais[5] + '|' ;
                Table_Temp.Post;
              end;
            end;


            //COFINS

            if Col_Filiais[1] = 'M500' then
            begin
              if Table_Temp.Locate('REGISTRO', VarArrayOf([Col_Filiais[1], Col_Filiais[2]]), [loCaseInsensitive]) then
              begin
                Table_Temp.Edit;
            //|M100|101|0|168839,23|1,65|0||2785,85|0|0|0|2785,85|0|2785,85|0,00|
                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[4]);
                Table_Temp.FieldByName('VALOR_02').AsFloat  := Table_Temp.FieldByName('VALOR_02').AsFloat + StrToFloat(Col_Filiais[8]);
                Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                Col_Filiais[3] +   '|' + FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|' + Col_Filiais[5] + '|' + Col_Filiais[6] + '|'
                +  Col_Filiais[7]   + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|' + Col_Filiais[9]  + '|' + Col_Filiais[10] + '|'
                +  Col_Filiais[11]  + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|' + Col_Filiais[13] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|'
                +  Col_Filiais[15]  + '|';

                Table_Temp.Post;
              end;
            end;

            if Col_Filiais[1] = 'M505' then
            begin

              if Table_Temp.Locate('REGISTRO;CST', VarArrayOf([Col_Filiais[1], Col_Filiais[2]]), [loCaseInsensitive]) then
              begin
                Table_Temp.Edit;
            //|M105|01|50|1875||1875|1875||0||
                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[4]);
                Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                Col_Filiais[3] +   '|' + FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|' + Col_Filiais[5] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|'
                +  FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|' + Col_Filiais[8] + '|' + Col_Filiais[9]  + '|' + Col_Filiais[10]  + '|';
                Table_Temp.Post;
              end;
            end;


            if Col_Filiais[1] = 'M600' then
            begin

              if Table_Temp.Locate('REGISTRO', VarArrayOf([Col_Filiais[1]]), [loCaseInsensitive]) then
              begin
                Table_Temp.Edit;
               //M200|1282,79|758,92|0|523,87|0|0|523,87|0|0|0|0|523,87|
               Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[2]);
               Table_Temp.FieldByName('VALOR_02').AsFloat  := Table_Temp.FieldByName('VALOR_02').AsFloat + StrToFloat(Col_Filiais[3]);
               Table_Temp.FieldByName('VALOR_03').AsFloat  := Table_Temp.FieldByName('VALOR_03').AsFloat + StrToFloat(Col_Filiais[5]);
                Table_Temp.FieldByName('LINHA').AsString  := '|' + Col_Filiais[1] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|' +
                FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|' + Col_Filiais[4] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_03').AsFloat) + '|' + Col_Filiais[6] + '|'
                +  Col_Filiais[7] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_03').AsFloat) + '|' + Col_Filiais[9]  + '|' + Col_Filiais[10] + '|' + Col_Filiais[11]
                + '|' + Col_Filiais[12] + '|' +  FloatToStr(Table_Temp.FieldByName('VALOR_03').AsFloat) + '|';
                Table_Temp.Post;
              end;
            end;

            if Col_Filiais[1] = 'M605' then
            begin
              if Table_Temp.Locate('REGISTRO;CST', VarArrayOf([Col_Filiais[1], Col_Filiais[2] ]), [loCaseInsensitive]) then
              begin
                Table_Temp.Edit;
                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[4]);
                Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                Col_Filiais[3] +   '|' + FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|';
                Table_Temp.Post;
              end;
            end;


            if Col_Filiais[1] = 'M610' then
            begin
              if Table_Temp.Locate('REGISTRO', VarArrayOf([Col_Filiais[1]]), [loCaseInsensitive]) then
              begin
                Table_Temp.Edit;
               //M210|01|114092,22|114017,42|0|0|114017,42|1,65|0||1881,29|0|0|0|0|1881,29|

                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[3]);
                Table_Temp.FieldByName('VALOR_02').AsFloat  := Table_Temp.FieldByName('VALOR_02').AsFloat + StrToFloat(Col_Filiais[4]);
                Table_Temp.FieldByName('VALOR_03').AsFloat  := Table_Temp.FieldByName('VALOR_03').AsFloat + StrToFloat(Col_Filiais[11]);
                Table_Temp.FieldByName('LINHA').AsString  := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|' + Col_Filiais[5] + '|' + Col_Filiais[6] + '|'
                +  FloatToStr(Table_Temp.FieldByName('VALOR_02').AsFloat) + '|' + Col_Filiais[8] + '|' + Col_Filiais[9]  + '|' + Col_Filiais[10] + '|' + FloatToStr(Table_Temp.FieldByName('VALOR_03').AsFloat)
                + '|' + Col_Filiais[12] + '|'  + Col_Filiais[13] +  '|' + Col_Filiais[14]  + '|' + Col_Filiais[15] + '|' +  FloatToStr(Table_Temp.FieldByName('VALOR_03').AsFloat) + '|';
                Table_Temp.Post;
              end;
            end;

           if Col_Filiais[1] = 'M800' then
            begin

              if Table_Temp.Locate('REGISTRO;CST', VarArrayOf([Col_Filiais[1], Col_Filiais[2]]), [loCaseInsensitive]) then
              begin
                Ult_Cst := Col_Filiais[2];
                Table_Temp.Edit;
            //|M400|04|214654,22|||
                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[3]);
                Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                FloatToStr (Table_Temp.FieldByName('VALOR_01').AsFloat) +   '|' + Col_Filiais[4] + '|' + Col_Filiais[5] + '|' ;
                Table_Temp.Post;
              end;

            end;


            if Col_Filiais[1] = 'M810' then
            begin

              if Table_Temp.Locate('REGISTRO;NATREC;CST', VarArrayOf([Col_Filiais[1], Col_Filiais[2], Ult_Cst]), [loCaseInsensitive]) then
              begin
                Table_Temp.Edit;
            //|M410|103|214654,22|||
                Table_Temp.FieldByName('VALOR_01').AsFloat  := Table_Temp.FieldByName('VALOR_01').AsFloat + StrToFloat(Col_Filiais[3]);
                Table_Temp.FieldByName('LINHA').AsString    := '|' + Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                FloatToStr(Table_Temp.FieldByName('VALOR_01').AsFloat) +   '|' + Col_Filiais[4] + '|' + Col_Filiais[5] + '|' ;
                Table_Temp.Post;
              end;
            end;


           { if (Col_Filiais[1] = 'M105') or (Col_Filiais[1] = 'M200') or
                (Col_Filiais[1] = 'M210') or (Col_Filiais[1] = 'M400') or (Col_Filiais[1] = 'M410') or
                (Col_Filiais[1] = 'M500') or (Col_Filiais[1] = 'M505') or (Col_Filiais[1] = 'M600') or
                (Col_Filiais[1] = 'M610') or (Col_Filiais[1] = 'M800') or (Col_Filiais[1] = 'M810') then
            begin
              Table_Temp.Append;
              Table_Temp.FieldByName('REGISTRO').AsString := Col_Filiais[1];
              Table_Temp.FieldByName('LINHA').AsString    := W;
              Table_Temp.Post;

              if Col_Filiais[1]  = 'M100'then
              Begin
              Table_Temp.Append;
              Table_Temp.FieldByName('REGISTRO').AsString := Col_Filiais[1];
              Table_Temp.FieldByName('LINHA').AsString    := Col_Filiais[1] + '|' + Col_Filiais[2] + '|' +
                Col_Filiais[3] +'|' + FloatToStr(M_AcumM + M_AcumF) + '|' + Col_Filiais[5] + '|' + Col_Filiais[6] + '|'
                + Col_Filiais[7] + '|'+ Col_Filiais[8] + '|' + Col_Filiais[9] + '|' + Col_Filiais[10] + '|'
                + Col_Filiais[11] + '|' + Col_Filiais[12] + '|' + Col_Filiais[13] + '|' + Col_Filiais[14] + '|';
              Table_Temp.Post;
              End;

              Inc(Tot_Reg_M);
            end; }

            Inc(Tot_Reg_M)
          finally
            Col_Filiais.Free;
          end;

          Panel2.Caption := W;

          Application.ProcessMessages;
        end;

        CloseFile(F2);
      end;
    end;

    Panel2.Caption := 'Aguarde...';

    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := '1001';
    Table_Temp.FieldByName('LINHA').AsString    := '|1001|1|';
    Table_Temp.Post;

    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := '1990';
    Table_Temp.FieldByName('LINHA').AsString    := '|1990|2|';
    Table_Temp.Post;

    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := '9001';
    Table_Temp.FieldByName('LINHA').AsString    := '|9001|0|';
    Table_Temp.Post;

    Regs := Soma_Registros('0000');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|0000|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('0001');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|0001|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('0100');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|0100|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('0110');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|0110|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('0140');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|0140|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('0150');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|0150|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('0190');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|0190|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('0200');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|0200|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('0500');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|0500|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;


    Regs := Soma_Registros('0600');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|0600|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('0990');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|0990|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('1001');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|1001|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('1990');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|1990|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('9001');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|9001|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := '9900';
    Table_Temp.FieldByName('LINHA').AsString    := '|9900|9990|1|';
    Table_Temp.Post;

    Regs := Soma_Registros('9999');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|9999|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('A001');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|A001|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('A010');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|A010|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('A100');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|A100|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('A120');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|A120|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('A170');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|A170|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;


    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := '9900';
    Table_Temp.FieldByName('LINHA').AsString    := '|9900|9999|1|';
    Table_Temp.Post;

    Regs := Soma_Registros('A990');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|A990|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C001');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C001|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C010');

    if Regs > 0 then
    begin
      if Table_Temp.FindKey(['C001']) then
      begin
        Table_Temp.Edit;
        Table_Temp.FieldByName('LINHA').AsString    := '|C001|0|';
        Table_Temp.Post;
      end;

      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C010|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C100');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C100|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C170');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C170|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C175');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C175|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;


    Regs := Soma_Registros('C380');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C380|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C381');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C381|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C385');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C385|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C400');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C400|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C405');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C405|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C481');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C481|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C485');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C485|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C500');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C500|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C501');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C501|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C505');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C505|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('C990');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|C990|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('D001');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|D001|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('D010');

    if Regs > 0 then
    begin
      if Table_Temp.FindKey(['D001']) then
      begin
        Table_Temp.Edit;
        Table_Temp.FieldByName('LINHA').AsString    := '|D001|0|';
        Table_Temp.Post;
      end;

      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|D010|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('D990');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|D990|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

        Regs := Soma_Registros('D100');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|D100|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('D101');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|D101|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('D105');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|D105|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('D500');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|D500|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('D501');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|D501|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('D505');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|D505|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

   
    Regs := Soma_Registros('F001');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|F001|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('F990');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|F990|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M001');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M001|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M100');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M100|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M105');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M105|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M200');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M200|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M205');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M205|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M210');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M210|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M400');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M400|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M410');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M410|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M500');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M500|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M505');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M505|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M600');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M600|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

     Regs := Soma_Registros('M605');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M605|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;


    Regs := Soma_Registros('M610');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M610|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M800');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M800|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M810');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M810|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('M990');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|M990|' + IntToStr(Regs) + '|';
      Table_Temp.Post;
    end;

    Regs := Soma_Registros('9900');

    if Regs > 0 then
    begin
      Table_Temp.Append;
      Table_Temp.FieldByName('REGISTRO').AsString := '9900';
      Table_Temp.FieldByName('LINHA').AsString    := '|9900|9900|' + IntToStr((Regs + 1)) + '|';
      Table_Temp.Post;
    end;

    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := '9990';
    Table_Temp.FieldByName('LINHA').AsString    := '|9990|' + IntToStr((Regs + 4)) + '|';
    Table_Temp.Post;


    Table_Temp.Append;
    Table_Temp.FieldByName('REGISTRO').AsString := '9999';
    Table_Temp.FieldByName('LINHA').AsString    := '|9999|' + IntToStr((Table_Temp.RecordCount + 1)) + '|';
    Table_Temp.Post;

    Laudo        := 'POL1462013';
    edtFile.Text := Laudo + Copy(DateToStr(date), 1, 2) + Copy(DateToStr(date), 4, 2) + Copy(DateToStr(date), 7, 4) +
                    Copy(TimeToStr(time), 1, 2) +  Copy(TimeToStr(time), 4, 2) + Copy(TimeToStr(time), 7, 2) + '.Txt';

    AssignFile(F1, ExtractFilePath(ParamStr(0)) + edtFile.Text);
    Rewrite(F1);

    Table_Temp.IndexName := '';

    Table_Temp.First;
    while not Table_Temp.Eof do
    begin
      WriteLn(F1, Table_Temp.FieldByName('LINHA').AsString);

      Panel2.Caption := Table_Temp.FieldByName('LINHA').AsString;

      Application.ProcessMessages;
      Table_Temp.Next;
    end;

    CloseFile(F1);

    Application.MessageBox(PChar('O arquivo ' + ExtractFilePath(ParamStr(0)) + edtFile.Text + ' foi criado com sucesso'), PChar(Msg_Title), mb_IconInformation);

    ShellExecute(Handle,'',PChar('NOTEPAD.EXE' + ' ' + ExtractFilePath(ParamStr(0)) + edtFile.Text),'','',SW_SHOW);
  finally
    Table_Temp.Close;

    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
    Filiais.Enabled    := True;
    btnMatriz.Enabled  := True;
    btnFiliais.Enabled := True;
    Panel2.Visible     := False;
  end;
 End
 Else
 MessageDlg('Arquivo Matriz não gerado no padrão do EFICAZ!',mtinformation,[mbok],0);
end;

function TFrmUnificar_SPED_Pis_Cofins.Soma_Registros(Registro: String): Integer;
var
T_Registros: Integer;
begin
  T_Registros := 0;

  Table_Temp.First;

  while not Table_Temp.Eof do
  begin
    if Table_Temp.FieldByName('REGISTRO').AsString = Registro then
      Inc(T_Registros);

    Panel2.Caption := Table_Temp.FieldByName('LINHA').AsString;

    Application.ProcessMessages;
    Table_Temp.Next;
  end;

  Result := T_Registros;
end;


procedure TFrmUnificar_SPED_Pis_Cofins.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmUnificar_SPED_Pis_Cofins.MatrizKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #019 then
 Begin
   Label3.Visible := True;
   Senha.Visible  := True;
 End;

end;

procedure TFrmUnificar_SPED_Pis_Cofins.btnFiliaisClick(Sender: TObject);
var
X: Integer;
begin
  FrmPrincipal.OpenDialog1.Options    := FrmPrincipal.OpenDialog1.Options + [TOpenOption.ofAllowMultiSelect];
  FrmPrincipal.OpenDialog1.Title      := 'Selecione o Arquivo';
  FrmPrincipal.OpenDialog1.DefaultExt := '*.Txt';
  FrmPrincipal.OpenDialog1.Filter     := 'Arquivos Txt (*.Txt)|*.Txt|Todos os Arquivos (*.*)|*.*';
  if Filiais.Items.Count = 0 then
    FrmPrincipal.OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));

  if FrmPrincipal.OpenDialog1.Execute then
  begin
    for X := 0 to (FrmPrincipal.OpenDialog1.Files.Count - 1) do
      Filiais.Items.Add(FrmPrincipal.OpenDialog1.Files[X]);
    FrmPrincipal.OpenDialog1.InitialDir := ExtractFilePath(FrmPrincipal.OpenDialog1.FileName);
  end;

  for X := 0 to (Filiais.Items.Count - 1) do
    Filiais.Checked[X] := True;
end;

procedure TFrmUnificar_SPED_Pis_Cofins.btnMatrizClick(Sender: TObject);
begin
  FrmPrincipal.OpenDialog1.Title      := 'Selecione o Arquivo';
  FrmPrincipal.OpenDialog1.DefaultExt := '*.Txt';
  FrmPrincipal.OpenDialog1.Filter     := 'Arquivos Txt (*.Txt)|*.Txt|Todos os Arquivos (*.*)|*.*';
  FrmPrincipal.OpenDialog1.InitialDir := ExtractFilePath(ParamStr(0));

  if FrmPrincipal.OpenDialog1.Execute then
  begin
    Matriz.Text        := FrmPrincipal.OpenDialog1.FileName;
    btnExecuta.Enabled := True;
  end;
end;

procedure TFrmUnificar_SPED_Pis_Cofins.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

end.
