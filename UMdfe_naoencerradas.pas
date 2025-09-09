unit UMdfe_naoencerradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.DBCtrls,ACBrMDFe,pmdfeConversaoMDFe,ACBrMDFeDAMDFeClass,
  ACBrMDFeDAMDFeRLClass,pcnConversao;

type
  TFrmMdf_naoencerradas = class(TForm)
    DBGrid1: TDBGrid;
    btnRetorna: TBitBtn;
    Fdac_Temp: TFDMemTable;
    Data_mdfe: TDataSource;
    ListBox1: TListBox;
    IQuery: TFDQuery;
    btnGera: TButton;
    QCancelamento: TFDQuery;
    QRel: TFDQuery;
    IQuery1: TFDQuery;
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnGeraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMdf_naoencerradas: TFrmMdf_naoencerradas;

implementation

uses
UPrincipal,UData;

{$R *.dfm}

procedure TFrmMdf_naoencerradas.btnGeraClick(Sender: TObject);
var
id:Integer;
begin

   Fdac_Temp.First;

   while not Fdac_Temp.Eof do
   Begin

    if Fdac_Temp.FieldByName('ENCERRAR').AsString = 'X' then
    bEGIN

    QCancelamento.Sql.Clear;
    QCancelamento.Sql.Add('SELECT * FROM COMPL_MDEFISCAL');
    QCancelamento.Sql.Add('WHERE');
    QCancelamento.Sql.Add('(NO_DOC_FISCAL = :NO_DOC_FISCAL)');


    QCancelamento.ParamByName('NO_DOC_FISCAL').AsInteger := StrToInt(Copy(Fdac_Temp.FieldByName('CHAVE_MDFE').AsString,26,9));

    QCancelamento.Prepare;
    QCancelamento.Open;

     //if QCancelamento.IsEmpty then
     //  Application.MessageBox('Nota Fiscal não localizada no Banco de Dados', PChar(Msg_Title), mb_IconStop);

     begin

        ID   := QCancelamento.FieldByName('MDEFISCAL_ID').AsInteger;


       FrmPrincipal.ACBrMDFe1.EventoMDFe.Evento.Clear;

      with FrmPrincipal.ACBrMDFe1.EventoMDFe.Evento.Add do
      begin
       infEvento.chMDFe   := Fdac_Temp.FieldByName('CHAVE_MDFE').AsString;
       infEvento.CNPJCPF  := FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString;
       infEvento.dhEvento := now;
  //  TpcnTpEvento = (teCCe, teCancelamento, teManifDestConfirmacao, teManifDestCiencia,
  //                  teManifDestDesconhecimento, teManifDestOperNaoRealizada,
  //                  teEncerramento);
       infEvento.tpEvento   := teEncerramento;
       infEvento.nSeqEvento := 1;

       infEvento.detEvento.nProt := Fdac_Temp.FieldByName('PROTOCOLO').AsString;
       infEvento.detEvento.dtEnc := Date;
       infEvento.detEvento.cUF   := Fdac_Temp.FieldByName('CODIGO_UF').AsInteger;
       infEvento.detEvento.cMun  := Fdac_Temp.FieldByName('CODIGO_MUNICIPIO').AsInteger;
      end;

       if FrmPrincipal.ACBrMDFe1.EnviarEvento(1) then
       begin
          with FrmPrincipal.ACBrMDFe1.WebServices.EnvEvento do
          begin

              QRel.Sql.Clear;
              QRel.Sql.Add('UPDATE COMPL_MDEFISCAL SET STATUS =:STATUS');
              QRel.Sql.Add('WHERE');
              QRel.Sql.Add('(MDEFISCAL_ID = :MDEFISCAL_ID)');

              QRel.ParamByName('MDEFISCAL_ID').AsInteger := ID;
              QRel.ParamByName('STATUS').AsString        := 'ENCERRADO';

              QRel.Prepare;
              QRel.ExecSql;


           Application.MessageBox(PChar('Status: ' + IntToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.cStat)), PChar(Msg_Title), mb_IconInformation);
           Application.MessageBox(PChar('Nº do Protocolo: ' + EventoRetorno.retEvento.Items[0].RetInfEvento.nProt), PChar(Msg_Title), mb_IconInformation);

          end;
       end;

       if QCancelamento.IsEmpty then
       Application.MessageBox('Nota Fiscal não localizada no Banco de Dados', PChar(Msg_Title), mb_IconStop);

     end;
    end;
    Fdac_TEmp.next;
   End;
   Close;
end;

procedure TFrmMdf_naoencerradas.btnRetornaClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmMdf_naoencerradas.DBGrid1CellClick(Column: TColumn);
begin
  if (DBGrid1.SelectedField.FieldName = 'ENCERRAR') and
   (Fdac_Temp.FieldByName('UF_DESTINO').AsString <> '' ) and
   (Fdac_Temp.FieldByName('MUNICIPIO_DESTINO').AsString <> '' ) then
  bEGIN
   Fdac_Temp.Edit;

    if Fdac_Temp.FieldByName('ENCERRAR').AsString = 'X' then
    Fdac_Temp.FieldByName('ENCERRAR').AsString := ''
    else
    Fdac_Temp.FieldByName('ENCERRAR').AsString:= 'X';

    Fdac_Temp.Post;
  end;
end;

procedure TFrmMdf_naoencerradas.DBGrid1ColExit(Sender: TObject);
begin
  if Fdac_Temp.State in [dsInsert, dsEdit] then
  begin
   try
    if DBGrid1.SelectedField.FieldName = 'UF_DESTINO' then
    begin
     ListBox1.Clear;

     IQuery.Sql.Clear;
     IQuery.Sql.Add('SELECT DESCRICAO FROM IBGE WHERE UF_SIGLA = :UF_SIGLA ORDER BY DESCRICAO');
     IQuery.ParamByName('UF_SIGLA').AsString := Fdac_Temp.FieldByName('UF_DESTINO').AsString;
     IQuery.Prepare;

     IQuery.Open;

     IQuery.First;

     while not IQuery.Eof do
     Begin

      ListBox1.Items.Add(IQuery.FieldByName('DESCRICAO').AsString);
      IQuery.Next;
     End;
     DBGrid1.Columns[3].PickList:= ListBox1.Items;

    end;


    if DBGrid1.SelectedField.FieldName = 'MUNICIPIO_DESTINO' then
    begin

     IQuery.Sql.Clear;
     IQuery.Sql.Add('SELECT COD_UF FROM IBGE WHERE UF_SIGLA = :UF_SIGLA ORDER BY DESCRICAO');
     IQuery.ParamByName('UF_SIGLA').AsString := Fdac_Temp.FieldByName('UF_DESTINO').AsString;
     IQuery.Prepare;
     IQuery.Open;

     Fdac_Temp.Edit;
     Fdac_Temp.FieldByName('CODIGO_UF').AsInteger := StrToInt(IQuery.FieldByName('COD_UF').AsString);
     Fdac_Temp.Post;

     IQuery.Sql.Clear;
     IQuery.Sql.Add('SELECT CODIGO FROM IBGE WHERE UF_SIGLA = :UF_SIGLA AND DESCRICAO = :DESCRICAO ORDER BY DESCRICAO');
     IQuery.ParamByName('UF_SIGLA').AsString  := Fdac_Temp.FieldByName('UF_DESTINO').AsString;
     IQuery.ParamByName('DESCRICAO').AsString := Fdac_Temp.FieldByName('MUNICIPIO_DESTINO').AsString;
     IQuery.Prepare;
     IQuery.Open;

     Fdac_Temp.Edit;
     Fdac_Temp.FieldByName('CODIGO_MUNICIPIO').AsInteger := StrToInt(IQuery.FieldByName('CODIGO').AsString);
     Fdac_Temp.Post;


    end;


   finally

   end;
  end;

end;

procedure TFrmMdf_naoencerradas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
Check: Integer;
R: TRect;
begin
  //Desenha um checkbox no dbgrid
  if Column.FieldName = 'ENCERRAR' then
  begin
  DBGrid1.Canvas.FillRect(Rect);
  Check := 0;

  if Fdac_Temp.FieldByName('ENCERRAR').AsString = 'X' then
  Check := DFCS_CHECKED
  else
  Check := 0;

  R:=Rect;
  InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
  DrawFrameControl(DBGrid1.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmMdf_naoencerradas.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
Key := UpCase(Key);
end;

procedure TFrmMdf_naoencerradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TFrmMdf_naoencerradas.FormCreate(Sender: TObject);
var
i :Integer;
begin
  TRY
    with Fdac_Temp.FieldDefs do
    begin
      Clear;
      Add('ACESSO', ftAutoInc, 0, False);
      Add('CHAVE_MDFE', ftString, 44, False);
      Add('PROTOCOLO', ftString, 15, False);
      Add('UF_DESTINO', ftString, 2, False);
      Add('MUNICIPIO_DESTINO', ftString, 30, False);
      Add('ENCERRAR', ftString, 1, False);
      Add('CODIGO_UF', ftInteger, 0, False);
      Add('CODIGO_MUNICIPIO', ftInteger, 0, False);

    end;

    with Fdac_Temp.IndexDefs do
    begin
      Clear;
      Add('', 'ACESSO', [ixPrimary, ixUnique]);
      Add('TEMP', 'CHAVE_MDFE;PROTOCOLO', [ixCaseInsensitive]);
    end;
    Fdac_Temp.IndexName := 'TEMP';
    Fdac_Temp.Open;

  except on E: Exception do
     ShowMessage( E.Message );
  end;


  for I := 0 to FrmPrincipal.XMLDOM.DocumentElement.ChildNodes.Count - 1 do
  begin

     if FrmPrincipal.XMLDOM.DocumentElement.ChildNodes[I].ChildNodes['chMDFe'].Text <> '' then
     begin
       iQuery.sql.clear;
       IQuery.Sql.Add('SELECT * FROM COMPL_MDEFISCAL WHERE CHAVE_MDF = :CHAVE');
       IQuery.ParamByName('CHAVE').AsString := FrmPrincipal.XMLDOM.DocumentElement.ChildNodes[I].ChildNodes['chMDFe'].Text;
       IQuery.Prepare;
       IQuery.Open;


      Fdac_Temp.Append;
      Fdac_Temp.FieldByName('CHAVE_MDFE').AsString :=  FrmPrincipal.XMLDOM.DocumentElement.ChildNodes[I].ChildNodes['chMDFe'].Text;
      Fdac_Temp.FieldByName('PROTOCOLO').AsString  :=  FrmPrincipal.XMLDOM.DocumentElement.ChildNodes[I].ChildNodes['nProt'].Text;

       if not IQuery.IsEmpty Then
       Begin

         Fdac_Temp.FieldByName('UF_DESTINO').ASsTRING := IQuery.FieldByName('UF_DESCARREGA').AsString;

         QRel.Sql.Clear;
         QRel.Sql.Add('SELECT COD_UF FROM IBGE WHERE UF_SIGLA = :UF_SIGLA ORDER BY DESCRICAO');
         QRel.ParamByName('UF_SIGLA').AsString := IQuery.FieldByName('UF_DESCARREGA').AsString;
         QRel.Prepare;
         QRel.Open;

         Fdac_Temp.FieldByName('CODIGO_UF').AsInteger := StrToInt(QRel.FieldByName('COD_UF').AsString);


         IQuery1.Sql.Clear;
         IQuery1.Sql.Add('SELECT * FROM COMPL_MDEFISCAL_NOTAS WHERE MDEFISCAL_ID = :MDEFISCAL_ID');
         IQuery1.Sql.Add('ORDER BY MDEFISCAL_ID');
         IQuery1.ParamByName('MDEFISCAL_ID').AsInteger := IQuery.FieldByName('MDEFISCAL_ID').AsInteger;
         IQuery1.Prepare;
         IQuery1.Open;
         IQuery1.Last;


         QRel.Sql.Clear;
         QRel.Sql.Add('SELECT CODIGO FROM IBGE WHERE UF_SIGLA = :UF_SIGLA AND DESCRICAO = :DESCRICAO ORDER BY DESCRICAO');
         QRel.ParamByName('UF_SIGLA').AsString  := IQuery.FieldByName('UF_DESCARREGA').AsString;
         QRel.ParamByName('DESCRICAO').AsString := IQuery1.FieldByName('MUNICIPIO_DESCARREGA').AsString;
         QRel.Prepare;
         QRel.Open;


         Fdac_Temp.FieldByName('MUNICIPIO_DESTINO').AssTRING := IQuery1.FieldByName('MUNICIPIO_DESCARREGA').AsString;

         Fdac_Temp.FieldByName('CODIGO_MUNICIPIO').AsInteger  := StrToInt(QRel.FieldByName('CODIGO').AsString);

       End;
       Fdac_temp.Post;
     end;
  end;

    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
    DBGrid1.Columns.Add;
   // DBGrid1.Columns.Add;

    DBGrid1.Columns[0].FieldName := 'CHAVE_MDFE';
    DBGrid1.Columns[1].FieldName := 'PROTOCOLO';
    DBGrid1.Columns[2].FieldName := 'UF_DESTINO';
    DBGrid1.Columns[3].FieldName := 'MUNICIPIO_DESTINO';
    DBGrid1.Columns[4].FieldName := 'ENCERRAR';
    //DBGrid1.Columns[5].FieldName := 'CODIGO_MUNICIPIO';

    DBGrid1.Columns[0].Title.Caption := 'Chave Mdf-e';
    DBGrid1.Columns[1].Title.Caption := 'Protocolo';
    DBGrid1.Columns[2].Title.Caption := 'Uf Dest.';
    DBGrid1.Columns[3].Title.Caption := 'Municipio Destino';
    DBGrid1.Columns[4].Title.Caption := '';

    DBGrid1.Columns[0].Width := 270;
    DBGrid1.Columns[1].Width := 100;
    DBGrid1.Columns[2].Width := 50;
    DBGrid1.Columns[3].Width := 180;
    DBGrid1.Columns[4].Width := 20;

    DBGrid1.Columns[0].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[1].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[2].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[3].Title.Alignment := taLeftJustify;
    DBGrid1.Columns[4].Title.Alignment := taCenter;

    DBGrid1.Columns[0].ReadOnly := True;
    DBGrid1.Columns[1].ReadOnly := True;
    DBGrid1.Columns[4].ReadOnly := True;

    DbGrid1.Columns[4].Color    := clblue ;


  Data_mdfe.DataSet := Fdac_temp;
  Fdac_temp.Open;
  ListBox1.Clear;

     IQuery.Sql.Clear;
     IQuery.Sql.Add('SELECT DISTINCT UF_SIGLA FROM IBGE ORDER BY UF_SIGLA ');
     IQuery.Prepare;

     IQuery.Open;

     IQuery.First;

     while not IQuery.Eof do
     Begin

      ListBox1.Items.Add(IQuery.FieldByName('UF_SIGLA').AsString);
      IQuery.Next;
     End;
     DBGrid1.Columns[2].PickList:= ListBox1.Items;


end;



end.


