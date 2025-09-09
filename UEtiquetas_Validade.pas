unit UEtiquetas_Validade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBTables, Spin, IBCustomDataSet,
  IBQuery, Mask, rxToolEdit, rxCurrEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFrmEtiquetas_Validade = class(TForm)
    Label6: TLabel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    Bevel1: TBevel;
    QEstoque: TFDQuery;
    Label9: TLabel;
    Modelo: TComboBox;
    Porta: TComboBox;
    Table_Etiquetas: TFDMemTable;
    DataContad: TDataSource;
    Table_EtiquetasDescricao: TStringField;
    Table_Etiquetasfabricacao: TDateTimeField;
    Table_EtiquetasValidade: TDateTimeField;
    Table_EtiquetasLote: TStringField;
    Button1: TButton;
    Table_EtiquetasQuantidade: TIntegerField;
    Impressora: TComboBox;
    Panel1: TPanel;
    StatusBar3: TStatusBar;
    Grid_Etiquetas: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Grid_Detalhes: TDBGrid;
    DataDetalhes: TDataSource;
    Table_Detalhes: TFDMemTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImpressoraKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DtmenKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Table_EtiquetasAfterOpen(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure Grid_EtiquetasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid_EtiquetasKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_EtiquetasEnter(Sender: TObject);
    procedure Grid_DetalhesEnter(Sender: TObject);
    procedure Grid_DetalhesKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_DetalhesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Seleciona_Produtos;
    procedure Imprime_Produtos;
    procedure Imprime_Detalhes;
  end;

var
  FrmEtiquetas_Validade: TFrmEtiquetas_Validade;
  Op_Sel: String;

  procedure Par_Etiquetas(Opcao: String);

implementation

uses
  UPrincipal, UData, UConsulta, UEtiquetas_Novos;

{$R *.dfm}

procedure Par_Etiquetas(Opcao: String);
begin
  {Op_Sel := Opcao;

  if not ThereIs('Etiquetas') then
    TFrmEtiquetas.Create(Application);

  if LeIni(Arq_Ini, 'Sistema', 'Organizar Janelas Automaticamente') = 'True' then
    FrmPrincipal.Cascade;

    }
end;

procedure TFrmEtiquetas_Validade.Seleciona_Produtos;
begin

end;

procedure TFrmEtiquetas_Validade.Table_EtiquetasAfterOpen(DataSet: TDataSet);
begin
 TFloatField(Table_EtiquetaS.FieldByName('FABRICACAO')).EditMask     :='!99/99/0000;1;_';
 TFloatField(Table_EtiquetaS.FieldByName('VALIDADE')).EditMask       :='!99/99/0000;1;_';
end;

procedure TFrmEtiquetas_Validade.btnExecutaClick(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
    Imprime_Produtos()
  else if PageControl1.ActivePageIndex = 1 then
    Imprime_Detalhes();
end;

procedure TFrmEtiquetas_Validade.Imprime_Produtos;
var
F, MyFile: TextFile;
InputString, LcLinha, D1, D2, D3, D4, B1, B2, B3, B4, P1, P2, P3, P4, ID1, ID2,ID3, Cod_Custo,D1b,D2B,D3B,L1,L2,L3: String;
C, W, X, Q, Tam_Custo, Linha, Etiquetas_Impressas: Integer;
begin
  try

    GravaIni(Arq_Ini, 'Impressora Código Barras','Impressora', Impressora.Text);
    GravaIni(Arq_Ini, 'Impressora Código Barras','Modelo', Modelo.Text);
    GravaIni(Arq_Ini, 'Impressora Código Barras','Porta', Porta.Text);


    if (Impressora.Text = 'Elgin')  then
    begin
    if (Modelo.Text = '3 Colunas') or (Modelo.Text = '3 Colunas (S/Barra)') then
      begin
        D1 := '';
        D2 := '';
        D3 := '';
        B1 := '';
        B2 := '';
        B3 := '';
        P1 := '';
        P2 := '';
        P3 := '';
        L1 := '';
        L2 := '';
        L3 := '';
        Q := 1;

        Table_Etiquetas.First;
        Begin
          while not Table_Etiquetas.Eof do
          begin


            for X := 1 to Table_Etiquetas.FieldByName('QUANTIDADE').AsInteger do
            begin
              if Q = 1 then
              begin
                D1 := Copy(Table_Etiquetas.FieldByName('DESCRICAO').AsString, 1, 20);
                B1 := 'Fabric.: ' + DateToStr(Table_Etiquetas.FieldByName('FABRICACAO').AsDateTime);
                P1 := 'Validade:' + DateToStr(Table_Etiquetas.FieldByName('VALIDADE').AsDateTime); //'R$ ' + FormatFloat('#,##0.00', Table_Etiquetas.FieldByName('PRECO_VAREJO').AsFloat);
                L1 := 'Lote:' + Table_Etiquetas.FieldByName('LOTE').AsString
              end;

              if Q = 2 then
              begin
                D2 := Copy(Table_Etiquetas.FieldByName('DESCRICAO').AsString, 1, 20);
                B2 := 'Fabric.: ' + DateToStr(Table_Etiquetas.FieldByName('FABRICACAO').AsDateTime);
                P2 := 'Validade:' + DateToStr(Table_Etiquetas.FieldByName('VALIDADE').AsDateTime); //'R$ ' + FormatFloat('#,##0.00', Table_Etiquetas.FieldByName('PRECO_VAREJO').AsFloat);
                L2 := 'Lote:' + Table_Etiquetas.FieldByName('LOTE').AsString
              end;

              if Q = 3 then
              begin
                D3 := Copy(Table_Etiquetas.FieldByName('DESCRICAO').AsString, 1, 20);
                B3 := 'Fabric.: ' + DateToStr(Table_Etiquetas.FieldByName('FABRICACAO').AsDateTime);
                P3 := 'Validade:' + DateToStr(Table_Etiquetas.FieldByName('VALIDADE').AsDateTime); //'R$ ' + FormatFloat('#,##0.00', Table_Etiquetas.FieldByName('PRECO_VAREJO').AsFloat);
                L3 := 'Lote:' + Table_Etiquetas.FieldByName('LOTE').AsString;

                AssignFile(F, Porta.Text);

                Rewrite(F);

                try
                  WriteLn(F, 'N');
                  WriteLn(F, 'D20');

                  if (Impressora.Text = 'Tanca')  Then
                  Begin
                  WriteLn(F, 'Q200,24');
                  WriteLn(F, 'q840');
                  End
                  Else
                  WriteLn(F, 'Q195,16');

                  WriteLn(F, 'A10,1,0,2,1,2,N,"' + D1 + '"');
                  WriteLn(F, 'A10,40,0,2,1,2,N,"' + B1 + '"');
                  WriteLn(F, 'A10,80,0,2,1,2,N,"' + P1 + '"');
                  WriteLn(F, 'A10,120,0,2,1,2,N,"' + L1 + '"');

                 { if Modelo.Text = '3 Colunas' then
                  Begin
                   if (Impressora.Text = 'Tanca')  Then
                      WriteLn(F, 'A35,2,0,1,1,2,N,"' + B1 + '"');//WriteLn(F, 'B35,50,0,E30,3,2,80,B,"' + B1 + '"')
                   Else
                      WriteLn(F, 'B35,50,0,E30,2,9,62,B,"' + B1 + '"');
                  End;
                  }

                  WriteLn(F, 'A300,1,0,2,1,2,N,"' + D2 + '"');
                  WriteLn(F, 'A300,40,0,2,1,2,N,"' + B2 + '"');
                  WriteLn(F, 'A300,80,0,2,1,2,N,"' + P2 + '"');
                  WriteLn(F, 'A300,120,0,2,1,2,N,"' + L2 + '"');

                  {if Modelo.Text = '3 Colunas' then
                  Begin
                   if (Impressora.Text = 'Tanca')  Then
                    WriteLn(F, 'B325,50,0,E30,3,2,80,B,"' + B2 + '"')
                   else
                    WriteLn(F, 'B325,50,0,E30,2,9,62,B,"' + B2 + '"');
                  End;
                 }
                  WriteLn(F, 'A580,1,0,2,1,2,N,"' + D3 + '"');
                  WriteLn(F, 'A580,40,0,2,1,2,N,"' + B3 + '"');
                  WriteLn(F, 'A580,80,0,2,1,2,N,"' + P3 + '"');
                  WriteLn(F, 'A580,120,0,2,1,2,N,"' + L3 + '"');
                  {
                  if Modelo.Text = '3 Colunas' then
                  Begin
                    if (Impressora.Text = 'Tanca')  Then
                    WriteLn(F, 'B605,50,0,E30,3,2,80,B,"' + B3 + '"')
                    Else
                    WriteLn(F, 'B605,50,0,E30,2,9,62,B,"' + B3 + '"');
                  End;
                  }
                  WriteLn(F, 'P1');
                finally
                  CloseFile(F);
                end;

                D1 := '';
                D2 := '';
                D3 := '';
                B1 := '';
                B2 := '';
                B3 := '';
                P1 := '';
                P2 := '';
                P3 := '';
                Q := 0;

                Sleep(2000);
              end;

              Inc(Q);
            end;

            Application.ProcessMessages;
            Table_Etiquetas.Next;
          end;

          if (Q >= 2)  then
          begin
            if LeIni(Arq_Ini, 'Sistema', 'Path Impressora') <> '' then
              AssignFile(F, LeIni(Arq_Ini, 'Sistema', 'Path Impressora'))
            else
              AssignFile(F, Porta.Text);

            Rewrite(F);

            try
              WriteLn(F, 'N');
              WriteLn(F, 'D20');

              if (Impressora.Text = 'Tanca')  Then
              Begin
              WriteLn(F, 'Q200,24');
              WriteLn(F, 'q840');
              End
              Else
              WriteLn(F, 'Q195,16');

              WriteLn(F, 'A10,1,0,2,1,2,N,"' + D1 + '"');
              WriteLn(F, 'A10,40,0,2,1,2,N,"' + B1 + '"');
              WriteLn(F, 'A10,80,0,2,1,2,N,"' + P1 + '"');
              WriteLn(F, 'A10,120,0,2,1,2,N,"' + L1 + '"');

              {
              if FrmEtiquetas_Novos.Modelo.Text = '3 Colunas' then
              Begin
               if (Impressora.Text = 'Tanca')  Then
                  WriteLn(F, 'B35,50,0,E30,3,2,80,B,"' + B1 + '"')
               Else
                  WriteLn(F, 'B35,50,0,E30,2,9,62,B,"' + B1 + '"');
              End;
              }

              WriteLn(F, 'A300,1,0,2,1,2,N,"' + D2 + '"');
              WriteLn(F, 'A300,40,0,2,1,2,N,"' + B2 + '"');
              WriteLn(F, 'A300,80,0,2,1,2,N,"' + P2 + '"');
              WriteLn(F, 'A300,120,0,2,1,2,N,"' + L2 + '"');

              {
              if Modelo.Text = '3 Colunas' then
              Begin
               if (Impressora.Text = 'Tanca')  Then
                WriteLn(F, 'B325,50,0,E30,3,2,80,B,"' + B2 + '"')
               else
                WriteLn(F, 'B325,50,0,E30,2,9,62,B,"' + B2 + '"');
              End;
              }

              WriteLn(F, 'A580,1,0,2,1,2,N,"' + D3 + '"');
              WriteLn(F, 'A580,40,0,2,1,2,N,"' + B3 + '"');
              WriteLn(F, 'A580,80,0,2,1,2,N,"' + P3 + '"');
              WriteLn(F, 'A580,120,0,2,1,2,N,"' + L3 + '"');
             {
              if Modelo.Text = '3 Colunas' then
              Begin
                if (Impressora.Text = 'Tanca')  Then
                WriteLn(F, 'B605,50,0,E30,3,2,80,B,"' + B3 + '"')
                Else
                WriteLn(F, 'B605,50,0,E30,2,9,62,B,"' + B3 + '"');
              End;
                }


              WriteLn(F, 'P1');
            finally
              CloseFile(F);
            end;
          end;
        End;
      end;
    end;
    //Código comentado está no backup
  finally

  end;
end;

procedure TFrmEtiquetas_Validade.Imprime_Detalhes;
var
F, MyFile: TextFile;
Fonte1, Fonte2, D1, D2, D3, B1, B2, B3: String;
X, Q, Tamanho1, Tamanho2: Integer;
begin
  try

    GravaIni(Arq_Ini, 'Impressora Código Barras','Impressora', Impressora.Text);
    GravaIni(Arq_Ini, 'Impressora Código Barras','Modelo', Modelo.Text);
    GravaIni(Arq_Ini, 'Impressora Código Barras','Porta', Porta.Text);


    if (Impressora.Text = 'Elgin')  then
    begin
    if (Modelo.Text = '3 Colunas') or (Modelo.Text = '3 Colunas (S/Barra)') then
      begin
        D1 := '';
        D2 := '';
        D3 := '';
        B1 := '';
        B2 := '';
        B3 := '';
        Q := 1;

        Table_Detalhes.First;
        Begin
          while not Table_Detalhes.Eof do
          begin

            if Length(Table_Detalhes.FieldByName('DETALHE1').AsString) > 20 then
            begin
              Fonte1 := '1';
              Tamanho1 := 23;
            end
            else
            begin
              Fonte1 := '2';
              Tamanho1 := 20;
            end;

            if Length(Table_Detalhes.FieldByName('DETALHE2').AsString) > 20 then
            begin
              Fonte2 := '1';
              Tamanho2 := 23;
            end
            else
            begin
              Fonte2 := '2';
              Tamanho2 := 20;
            end;

            for X := 1 to Table_Detalhes.FieldByName('QUANTIDADE').AsInteger do
            begin
              if Q = 1 then
              begin
                D1 := Copy(Table_Detalhes.FieldByName('DETALHE1').AsString,1,Tamanho1);
                B1 := Copy(Table_Detalhes.FieldByName('DETALHE2').AsString,1,Tamanho2);
              end;

              if Q = 2 then
              begin
                D2 := Copy(Table_Detalhes.FieldByName('DETALHE1').AsString,1,Tamanho1);
                B2 := Copy(Table_Detalhes.FieldByName('DETALHE2').AsString,1,Tamanho2);
              end;

              if Q = 3 then
              begin
                D3 := Copy(Table_Detalhes.FieldByName('DETALHE1').AsString,1,Tamanho1);
                B3 := Copy(Table_Detalhes.FieldByName('DETALHE2').AsString,1,Tamanho2);

                AssignFile(F, Porta.Text);

                Rewrite(F);

                try
                  WriteLn(F, 'N');
                  WriteLn(F, 'D15');

                  if (Impressora.Text = 'Tanca')  Then
                  Begin
                  WriteLn(F, 'Q200,24');
                  WriteLn(F, 'q840');
                  End
                  Else
                  WriteLn(F, 'Q195,16');

                  WriteLn(F, 'A10,20,0,'+Fonte1+',1,2,N,"' + Copy(D1,1,Tamanho1) + '"');
                  WriteLn(F, 'A10,90,0,'+Fonte2+',1,2,N,"' + Copy(B1,1,Tamanho2) + '"');

                  WriteLn(F, 'A300,20,0,'+Fonte1+',1,2,N,"' + Copy(D2,1,Tamanho1) + '"');
                  WriteLn(F, 'A300,90,0,'+Fonte2+',1,2,N,"' + Copy(B2,1,Tamanho2) + '"');

                  WriteLn(F, 'A580,20,0,'+Fonte1+',1,2,N,"' + Copy(D3,1,Tamanho1) + '"');
                  WriteLn(F, 'A580,90,0,'+Fonte2+',1,2,N,"' + Copy(B3,1,Tamanho2) + '"');

                  WriteLn(F, 'P1');
                finally
                  CloseFile(F);
                end;

                D1 := '';
                D2 := '';
                D3 := '';
                B1 := '';
                B2 := '';
                B3 := '';
                Q := 0;

                Sleep(2000);
              end;

              Inc(Q);
            end;

            Application.ProcessMessages;
            Table_Detalhes.Next;
          end;

          if (Q >= 2)  then
          begin
            if LeIni(Arq_Ini, 'Sistema', 'Path Impressora') <> '' then
              AssignFile(F, LeIni(Arq_Ini, 'Sistema', 'Path Impressora'))
            else
              AssignFile(F, Porta.Text);

            Rewrite(F);

            try
              WriteLn(F, 'N');
              WriteLn(F, 'D15');

              if (Impressora.Text = 'Tanca')  Then
              Begin
              WriteLn(F, 'Q200,24');
              WriteLn(F, 'q840');
              End
              Else
              WriteLn(F, 'Q195,16');

              WriteLn(F, 'A10,20,0,'+Fonte1+',1,2,N,"' + Copy(D1,1,Tamanho1) + '"');
              WriteLn(F, 'A10,90,0,'+Fonte2+',1,2,N,"' + Copy(B1,1,Tamanho2) + '"');

              WriteLn(F, 'A300,20,0,'+Fonte1+',1,2,N,"' + Copy(D2,1,Tamanho1) + '"');
              WriteLn(F, 'A300,90,0,'+Fonte2+',1,2,N,"' + Copy(B2,1,Tamanho2) + '"');

              WriteLn(F, 'A580,20,0,'+Fonte1+',1,2,N,"' + Copy(D3,1,Tamanho1) + '"');
              WriteLn(F, 'A580,90,0,'+Fonte2+',1,2,N,"' + Copy(B3,1,Tamanho2) + '"');

              WriteLn(F, 'P1');
            finally
              CloseFile(F);
            end;
          end;
        End;
      end;
    end;
  finally

  end;
end;

procedure TFrmEtiquetas_Validade.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEtiquetas_Validade.Button1Click(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
    Grid_EtiquetasEnter(Self)
  else if PageControl1.ActivePageIndex = 1 then
    Grid_DetalhesEnter(Self);
end;

procedure TFrmEtiquetas_Validade.Button2Click(Sender: TObject);
begin
  Table_Etiquetas.Post;
  Table_Detalhes.Post;
end;

procedure TFrmEtiquetas_Validade.DtmenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    //(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmEtiquetas_Validade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEtiquetas_Validade.FormCreate(Sender: TObject);
begin
  if LeIni(Arq_Ini, 'Impressora Código Barras','Impressora') <> '' then
  Begin
  Impressora.Text      := LeIni(Arq_Ini, 'Impressora Código Barras','Impressora');
  Modelo.Text          := LeIni(Arq_Ini, 'Impressora Código Barras','Modelo');
  Porta.Text           := LeIni(Arq_Ini, 'Impressora Código Barras','Porta');
  End;
  Table_Etiquetas.Open;
  Table_Etiquetas.Append;
  Table_Detalhes.Open;
  Table_Detalhes.Append;
end;

procedure TFrmEtiquetas_Validade.Grid_DetalhesEnter(Sender: TObject);
begin
  Grid_Detalhes.SetFocus;
end;

procedure TFrmEtiquetas_Validade.Grid_EtiquetasEnter(Sender: TObject);
begin
  Grid_Etiquetas.SetFocus;
end;

procedure TFrmEtiquetas_Validade.Grid_EtiquetasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F9 then
  Begin
    BtnExecuta.Show;
    Perform(Wm_NextDlgCtl, 0, 0);
  End;
end;

procedure TFrmEtiquetas_Validade.Grid_DetalhesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F9 then
  Begin
    BtnExecuta.Show;
    Perform(Wm_NextDlgCtl, 0, 0);
  End;
end;

procedure TFrmEtiquetas_Validade.Grid_EtiquetasKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key:= AnsiUpperCase(Key)[1];
end;

procedure TFrmEtiquetas_Validade.Grid_DetalhesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Grid_Detalhes.SelectedField.FieldNo = 1 then
    Key:= AnsiUpperCase(Key)[1];
end;

procedure TFrmEtiquetas_Validade.ImpressoraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
