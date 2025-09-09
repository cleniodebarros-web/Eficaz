unit UAcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, DBCtrls, ExtCtrls, MMSystem, IBCustomDataSet,
  IBQuery, IBTable, ImgList, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg,FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Samples.Gauges, acPNG;

type
  TFrmAcesso = class(TForm)
    Edit1: TEdit;
    img1: TImage;
    imgExecuta: TImage;
    imgRetorna: TImage;
    lbl1: TLabel;
    lookbox: TDBLookupComboBox;
    QAcesso: TFDQuery;
    QRel: TFDQuery;
    IQuery1: TFDQuery;
    DataSource1: TDataSource;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRetornaClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAcesso: TFrmAcesso;
  procedure Acesso_Sistema;

implementation

uses
  UData, UPrincipal, UAbertura,URegistrolicenca;

{$R *.DFM}



procedure Acesso_Sistema;
begin

  Application.CreateForm(TFrmAcesso, FrmAcesso);

  try


    FrmAcesso.QRel.Sql.Clear;
    FrmAcesso.QRel.Sql.Add('SELECT * FROM VERSAO');
    FrmAcesso.QRel.Prepare;
    FrmAcesso.QRel.Open;
    FrmAcesso.Caption := 'Acesso                    ' + 'Versão Eficaz: ' + FrmAcesso.QRel.FieldByName('Versao').AsString;
    FrmAcesso.lbl1.Caption   := 'Versão: '+ FrmAcesso.QRel.FieldByName('versao').AsString + ' - (' + UpperCase(DecryptMsg(FrmPrincipal.Config.FieldByName('versao').AsString, 65)) + ')' ;
    FrmAcesso.Label2.Caption := 'Data Build(' + DecryptMsg(FrmAcesso.QRel.FieldByName('DATA').AsString ,39) + ')';
    FrmAcesso.ShowModal;
  finally
    FrmAcesso.Release;
  end;


end;

procedure TFrmAcesso.FormShow(Sender: TObject);
begin
  try
    QAcesso.Open;
  except
    Application.MessageBox('Erro ao conectar com o Banco de Dados', PChar(Msg_Title), mb_IconStop);
    Application.Terminate;
  end;

  FrmPrincipal.Abertura.Open;
  try

    if date < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
    begin
      Application.MessageBox(PChar('A data do Sistema não pode ser menor que o último movimento ' + FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString), PChar(Msg_Title), mb_IconStop);
      Application.Terminate;
    end;

    if (FrmPrincipal.Abertura.FieldByName('DT_FECHAMENTO').AsDateTime = FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) and (date = FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
    begin
      Application.MessageBox(PChar('Movimento já encerrado ' + FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString), PChar(Msg_Title), mb_IconStop);
      Application.Terminate;
    end;
  except
    Application.MessageBox('Erro ao verificar a data do movimento', PChar(Msg_Title), mb_IconStop);
    Application.Terminate;
  end;

  Edit1.Text := '';
  lookbox.SetFocus;
end;

procedure TFrmAcesso.btnRetornaClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmAcesso.DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmAcesso.Edit1Change(Sender: TObject);
begin
  //if (Edit1.Text <> '') and (DBLookupComboBox1.Text <> '') then
  //  btnExecuta.Enabled := True
 // else
   // btnExecuta.Enabled := False;
end;

procedure TFrmAcesso.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmAcesso.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    btnExecutaClick(Sender);
end;

procedure TFrmAcesso.btnExecutaClick(Sender: TObject);
begin
  try
    //btnExecuta.Enabled := False;
    //btnRetorna.Enabled := False;

    FrmData.QAcesso.Close;

    FrmData.QAcesso.ParamByName('FUNCIONARIO_ID').AsInteger := QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
    FrmData.QAcesso.ParamByName('SENHA').AsString           := EncryptMsg(Edit1.Text, 65);

    FrmData.QAcesso.Prepare;
    FrmData.QAcesso.Open;

     if not FrmData.QAcesso.IsEmpty then
     begin
      FrmPrincipal.QEmpresa.Close;

      FrmPrincipal.QEmpresa.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      FrmPrincipal.QEmpresa.Prepare;
      FrmPrincipal.QEmpresa.Open;


      IQuery1.SQL.Clear;
      IQuery1.Sql.Add('SELECT COUNT(*) QTD FROM EMPRESAS WHERE STATUS = :STATUS');
      IQuery1.ParamByName('STATUS').AsString := 'A';
      IQuery1.Prepare;
      IQuery1.Open;



     iF (IQuery1.FieldByName('QTD').AsInteger <= 1)  Then
     Begin
      If UData.Usuarios <= 3   Then
      Begin

          if date > FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
          begin
            if FrmData.QAcesso.FieldByName('ABERTURA').AsString = 'SIM' then
            begin
              Application.MessageBox('É preciso abrir o dia', PChar(Msg_Title), mb_IconInformation);

              Application.CreateForm(TFrmAbertura, FrmAbertura);
              try
                if FrmAbertura.ShowModal = mrCancel then
                  Application.Terminate;
              finally
                FrmAbertura.Release;
              end;
            end
            else
            begin
              Application.MessageBox('É preciso abrir o dia e você não possui autorização. Procure o gerente, por favor!', PChar(Msg_Title), mb_IconStop);
              Application.Terminate;
            end;
          end;

        //  if FrmData.QAcesso.FieldByName('DT_ACESSO').AsDateTime <> FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
        //  Application.MessageBox(PChar('Olá ' + PrimeiroNome(QAcesso.FieldByName('NOME').AsString) +
        //                               ', para o bom processamento dos dados, eu necessito que você me forneça informações confiáveis. Vamos lá então?'), PChar(Msg_Title), mb_IconInformation);
        //try
          QRel.Sql.Clear;
          QRel.Sql.Add('UPDATE ACESSO SET DT_ACESSO = :DT_ACESSO, HR_ACESSO = :HR_ACESSO');
          QRel.Sql.Add('WHERE');
          QRel.Sql.Add('(FUNCIONARIO_ID = :FUNCIONARIO_ID)');
          QRel.Sql.Add('AND (SENHA = :SENHA)');

          QRel.ParamByName('DT_ACESSO').AsDateTime     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
          QRel.ParamByName('HR_ACESSO').AsString       := Copy(TimeToStr(time), 1, 5);
          QRel.ParamByName('FUNCIONARIO_ID').AsInteger := QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
          QRel.ParamByName('SENHA').AsString           := EncryptMsg(Edit1.Text, 65);

          QRel.Prepare;
          QRel.ExecSql;



        // Except


        // end;
         FrmPrincipal.Habilita_Menu;
         ModalResult := mrOk;
      End
      Else
      Begin
          if FrmPrincipal.QEmpresa.FieldByName('LICENCA').AsString = '' then
           Begin
            if Application.MessageBox('Cliente possui mais de 3 conexões ativas. Deseja inserir Licença?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
            Begin
             Application.CreateForm(TFrmRegistrolicenca, FrmRegistrolicenca);
            try
              FrmRegistrolicenca.ShowModal;
            finally
              FrmRegistrolicenca.Release;
            end;
             Application.Terminate;
            End
            Else
            Application.Terminate;
           End;
          if Usuarios <=  StrToInt(Copy(DecryptMsg(FrmPrincipal.QEmpresa.FieldByName('LICENCA').AsString,65),29,3)) then
          Begin
            if date > FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
            begin
              if FrmData.QAcesso.FieldByName('ABERTURA').AsString = 'SIM' then
              begin
                Application.MessageBox('É preciso abrir o dia', PChar(Msg_Title), mb_IconInformation);

                Application.CreateForm(TFrmAbertura, FrmAbertura);
                try
                  if FrmAbertura.ShowModal = mrCancel then
                    Application.Terminate;
                finally
                    FrmAbertura.Release;
                end;
              end
              else
              begin
                Application.MessageBox('É preciso abrir o dia e você não possui autorização. Procure o gerente, por favor!', PChar(Msg_Title), mb_IconStop);
                Application.Terminate;
              end;
            end;

          //  if FrmData.QAcesso.FieldByName('DT_ACESSO').AsDateTime <> FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
            //   Application.MessageBox(PChar('Olá ' + PrimeiroNome(QAcesso.FieldByName('NOME').AsString) +
            //                               ', para o bom processamento dos dados, eu necessito que você me forneça informações confiáveis. Vamos lá então?'), PChar(Msg_Title), mb_IconInformation);
           try

            QRel.Sql.Clear;
            QRel.Sql.Add('UPDATE ACESSO SET DT_ACESSO = :DT_ACESSO, HR_ACESSO = :HR_ACESSO');
            QRel.Sql.Add('WHERE');
            QRel.Sql.Add('(FUNCIONARIO_ID = :FUNCIONARIO_ID)');
            QRel.Sql.Add('AND (SENHA = :SENHA)');

            QRel.ParamByName('DT_ACESSO').AsDateTime     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
            QRel.ParamByName('HR_ACESSO').AsString       := Copy(TimeToStr(time), 1, 5);
            QRel.ParamByName('FUNCIONARIO_ID').AsInteger := QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
            QRel.ParamByName('SENHA').AsString           := EncryptMsg(Edit1.Text, 65);

            QRel.Prepare;
            QRel.ExecSql;


           Except

           end;
            FrmPrincipal.Habilita_Menu;
            ModalResult := mrOk;
          End
          Else
          Begin
          Application.MessageBox('As Conexões ao banco de Dados chegaram ao limite favor entrar em contato com o Suporte!', PChar(Msg_Title), mb_IconWarning);
          Application.Terminate;
          End;
      End;
     End

     Else
     Begin

       //MessageDlg(Copy(DecryptMsg(FrmPrincipal.QEmpresa.FieldByName('LICENCA').AsString,65),27,2),mtinformation,[mbok],0);
       //MessageDlg(IQuery1.FieldByName('QTD').AsString,mtinformation,[mbok],0);
       if FrmPrincipal.QEmpresa.FieldByName('LICENCA').AsString = '' then
       Begin
        if Application.MessageBox('Cliente possui mais de 1 empresa cadastrada no sistema. Deseja inserir Licença?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
        Begin
         Application.CreateForm(TFrmRegistrolicenca, FrmRegistrolicenca);
        try
          FrmRegistrolicenca.ShowModal;
        finally
          FrmRegistrolicenca.Release;
        end;
         Application.Terminate;
        End
        Else
        Application.Terminate;
       End;

       iF IQuery1.FieldByName('QTD').AsInteger = StrToInt(Copy(DecryptMsg(FrmPrincipal.QEmpresa.FieldByName('LICENCA').AsString,65),27,2)) Then
       Begin

          if Usuarios <=  StrToInt(Copy(DecryptMsg(FrmPrincipal.QEmpresa.FieldByName('LICENCA').AsString,65),29,3)) then
          Begin
            if date > FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
            begin
              if FrmData.QAcesso.FieldByName('ABERTURA').AsString = 'SIM' then
              begin
                Application.MessageBox('É preciso abrir o dia', PChar(Msg_Title), mb_IconInformation);

                Application.CreateForm(TFrmAbertura, FrmAbertura);
                try
                  if FrmAbertura.ShowModal = mrCancel then
                    Application.Terminate;
                finally
                  FrmAbertura.Release;
                end;
              end
              else
              begin
                Application.MessageBox('É preciso abrir o dia e você não possui autorização. Procure o gerente, por favor!', PChar(Msg_Title), mb_IconStop);
                Application.Terminate;
              end;
            end;

           // if FrmData.QAcesso.FieldByName('DT_ACESSO').AsDateTime <> FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
            //   Application.MessageBox(PChar('Olá ' + PrimeiroNome(QAcesso.FieldByName('NOME').AsString) +
            //                               ', para o bom processamento dos dados, eu necessito que você me forneça informações confiáveis. Vamos lá então?'), PChar(Msg_Title), mb_IconInformation);
           try
            QRel.Sql.Clear;
            QRel.Sql.Add('UPDATE ACESSO SET DT_ACESSO = :DT_ACESSO, HR_ACESSO = :HR_ACESSO');
            QRel.Sql.Add('WHERE');
            QRel.Sql.Add('(FUNCIONARIO_ID = :FUNCIONARIO_ID)');
            QRel.Sql.Add('AND (SENHA = :SENHA)');

            QRel.ParamByName('DT_ACESSO').AsDateTime     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
            QRel.ParamByName('HR_ACESSO').AsString       := Copy(TimeToStr(time), 1, 5);
            QRel.ParamByName('FUNCIONARIO_ID').AsInteger := QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
            QRel.ParamByName('SENHA').AsString           := EncryptMsg(Edit1.Text, 65);

            QRel.Prepare;
            QRel.ExecSql;


           Except

           end;
            FrmPrincipal.Habilita_Menu;
            ModalResult := mrOk;


          End
          Else
          Begin
          Application.MessageBox('As Conexões ao banco de Dados chegaram ao limite favor entrar em contato com o Suporte!', PChar(Msg_Title), mb_IconWarning);
          Application.Terminate;
          End;
       End
       Else
       Begin
        if Application.MessageBox('Por Contrato cliente não possui acesso a outra empresa. Deseja inserir nova licença?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
        Begin
         Application.CreateForm(TFrmRegistrolicenca, FrmRegistrolicenca);
        try
          FrmRegistrolicenca.ShowModal;
        finally
          FrmRegistrolicenca.Release;
        end;
         Application.Terminate;
        End
        Else
        Application.Terminate;
       End;
     End;
    end
    else
    begin
      Application.MessageBox('Senha inválida ou funcionário não cadastrado. Verifique se foi digitada corretamente', PChar(Msg_Title), mb_IconWarning);
      Edit1.Text := '';
      Edit1.SetFocus;
    end;
  finally
    Edit1Change(Sender);
   // btnRetorna.Enabled := True;
  end;
end;

procedure TFrmAcesso.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmData.QAcesso.Close;

  FrmData.QAcesso.ParamByName('FUNCIONARIO_ID').AsInteger := QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
  FrmData.QAcesso.ParamByName('SENHA').AsString           := EncryptMsg(Edit1.Text, 65);

  FrmData.QAcesso.Prepare;
  FrmData.QAcesso.Open;

  FrmPrincipal.StatusBar.Panels[4].Text := 'Operador: ' + QAcesso.FieldByName('NOME').AsString;
  Nome_Operador :=  QAcesso.FieldByName('NOME').AsString;
  ID_FUNCIONARIO :=  QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;


  if not FrmData.QAcesso.IsEmpty then
    CanClose := True
  else
    CanClose := False;

end;

procedure TFrmAcesso.FormCreate(Sender: TObject);
begin
DrawControl(ProgressBar1);
end;

procedure TFrmAcesso.FormDestroy(Sender: TObject);
begin

  try
    if QAcesso.Active then
    QAcesso.Close;
  except

  end;


end;

end.
