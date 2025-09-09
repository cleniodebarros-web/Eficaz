unit URel_Reducao_Z;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, rxToolEdit, QuickRpt, QRCtrls, DB,
  IBCustomDataSet, IBQuery, DBCtrls, RDprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRel_Reducao_z = class(TForm)
    Dt_movimento: TDateEdit;
    Label3: TLabel;
    Label1: TLabel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Bevel1: TBevel;
    RDprint1: TRDprint;
    DBLookupComboBox1: TDBLookupComboBox;
    DataImpressora: TDataSource;
    DBText4: TDBText;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    QRel: TFDQuery;
    IQuery: TFDQuery;
    QImpressora: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Dt_movimentoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Dt_movimentoEnter(Sender: TObject);
    procedure RegistroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Reducao_z: TFrmRel_Reducao_z;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmRel_Reducao_z.btnExecutaClick(Sender: TObject);
var
Linha: Integer;
begin
// 151, 325
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;




     Linha := 1;

    QRel.SQL.Clear;
    QRel.SQL.Add('SELECT * FROM REDUCOES_Z');
    QRel.SQL.Add('WHERE DT_MOVIMENTO = :DT_MOVIMENTO');
    QRel.SQL.Add('AND NUM_SERIE = :NUM_SERIE');
    QRel.ParamByName('DT_MOVIMENTO').AsDateTime := Dt_Movimento.Date;
    QRel.ParamByName('NUM_SERIE').AsString := QImpressora.FieldByName('SERIAL').AsString;
    QRel.Prepare;
    QRel.Open;

    if QRel.IsEmpty then
       Application.MessageBox('Não há dados para os parâmetros informados', PChar(Msg_Title), mb_IconInformation)
    Else
    Begin
        RDprint1.Abrir;
        RDprint1.Impressora              := Bobina;
        RDprint1.TamanhoQteLinhas        := 1;
        RDprint1.Acentuacao              := SemAcento;
        RDprint1.MostrarProgresso        := False;
        RDprint1.FonteTamanhoPadrao      := S10cpp;
        RDprint1.OpcoesPreview.Preview   := True;

        if CheckBox1.Checked = True then
        Begin
          RDprint1.Impressora         := HP;
          RDprint1.FonteTamanhoPadrao := S10cpp;
          RDprint1.Acentuacao         := Transliterate;
        End;

        RDprint1.ImpF(linha, 01, 'Data Impressora     : ',[comp12,negrito]);
        RDprint1.Imp(linha, 21, QRel.FieldByName('DT_IMPRESSORA').AsString);
        inc(linha);
        RDprint1.ImpF(linha, 01, 'Numero Série        :',[comp12,negrito]);
        RDprint1.Imp(linha, 21, QRel.FieldByName('NUM_SERIE').AsString);
        inc(linha);
        RDprint1.ImpF(linha, 01, 'Numero ECF',[comp12,negrito]);
        RDprint1.Imp(linha, 21, QRel.FieldByName('NUM_ECF').AsString);
        inc(linha);
        RDprint1.Imp(linha, 01, '----------------------------------------');
        inc(linha);
        RDprint1.ImpC( linha,20, 'REDUÇÃO Z',[comp12,negrito]);
        inc(linha);
        RDprint1.Imp(linha, 01, 'Numero COO Inicial  :');
        RDprint1.Imp(linha, 25, QRel.FieldByName('COO_INICIAL').AsString);
        inc(linha);
        RDprint1.Imp(linha, 01, 'Data Movimento      : ');
        RDprint1.Imp(linha, 25, QRel.FieldByName('DT_MOVIMENTO').AsString);
        inc(linha);
        Inc(Linha);
        RDprint1.ImpC(linha,20, 'CONTADORES',[comp12,negrito]);
        inc(linha);
        RDprint1.Imp(linha, 01, 'COO  : ');
        RDprint1.Imp(linha, 25, QRel.FieldByName('COO').AsString);
        inc(linha);
        RDprint1.Imp(linha, 01, 'GNF  : ');
        RDprint1.Imp(linha, 25, QRel.FieldByName('GNF').AsString);
        inc(linha);
        RDprint1.Imp(linha, 01, 'CRO  : ');
        RDprint1.Imp(linha, 25, QRel.FieldByName('CRO').AsString);
        inc(linha);
        RDprint1.Imp(linha, 01, 'CRZ  : ');
        RDprint1.Imp(linha, 25, QRel.FieldByName('CRZ').AsString);
        inc(linha);
        RDprint1.Imp(linha, 01, 'CCF  : ');
        RDprint1.Imp(linha, 25, QRel.FieldByName('CCF').AsString);
        inc(linha);
        RDprint1.Imp(linha, 01, 'CFD  : ');
        RDprint1.Imp(linha, 25, QRel.FieldByName('CFD').AsString);
        inc(linha);
        RDprint1.Imp(linha, 01, 'CDC  : ');
        RDprint1.Imp(linha, 25, QRel.FieldByName('CDC').AsString);
        inc(linha);
        RDprint1.Imp(linha, 01, 'GRG  : ');
        RDprint1.Imp(linha, 25, QRel.FieldByName('GRG').AsString);
        inc(linha);
        RDprint1.Imp(linha, 01, 'GNFC : ');
        RDprint1.Imp(linha, 25, QRel.FieldByName('GNFC').AsString);
        inc(linha);
        RDprint1.Imp(linha, 01, 'CFC  : ');
        RDprint1.Imp(linha, 25, QRel.FieldByName('CFC').AsString);
        inc(linha);
        RDprint1.ImpC(linha,20, 'TOTALIZADORES',[comp12,negrito]);
        inc(linha);
        RDprint1.Imp(linha, 01, 'Grande Total        : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('GRANDE_TOTAL').AsFloat,[]);
        inc(linha);
        RDprint1.Imp(linha, 01, 'Venda Bruta         : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('VENDA_BRUTA').AsFloat,[]);
        inc(linha);
        RDprint1.Imp(linha, 01, 'Cancelamento ICMS   : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('CANCELAMENTO_ICMS').AsFloat,[]);
        inc(linha);
        RDprint1.Imp(linha, 01, 'Desconto ICMS       : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('DESCONTO_ICMS').AsFloat,[]);
        inc(linha);
        RDprint1.Imp(linha, 01, 'Cancelamento ISSQN  : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('CANCELAMENTO_ISSQN').AsFloat,[]);
        inc(linha);
        RDprint1.Imp(linha, 01, 'Desconto ISSQN      : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('DESCONTO_ISSQN').AsFloat,[]);
        inc(linha);
        RDprint1.Imp(linha, 01, 'Venda Líquida       : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('VENDA_LIQUIDA').AsFloat,[]);
        inc(linha);
        RDprint1.Imp(linha, 01, 'Acréscimo ICMS      : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('ACRESCIMO_ICMS').AsFloat,[]);
        inc(linha);
        RDprint1.Imp(linha, 01, 'Acréscimo ISSQN     : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('ACRESCIMO_ISSQN').AsFloat,[]);
        inc(linha);
        Inc(Linha);
        RDprint1.ImpC(linha,20, 'ICMS',[comp12,negrito]);
        Inc(Linha);
        RDprint1.Imp(linha,01, 'Totalizador');
        RDprint1.Imp(linha,29, 'Base Cálc.');
        Inc(Linha);

          IQuery.Sql.Clear;
          IQuery.Sql.Add('SELECT * FROM REDUCOES_ICMS WHERE DT_MOVIMENTO = :DT_MOVIMENTO AND NUM_SERIE = :NUM_SERIE');
          IQuery.ParamByName('DT_MOVIMENTO').AsDateTime := Dt_Movimento.Date;
          IQuery.ParamByName('NUM_SERIE').AsString := QImpressora.FieldByName('SERIAL').AsString;
          IQuery.Prepare;
          IQuery.Open;

          while not IQuery.Eof do
          Begin
          RDprint1.Imp(linha, 01, IQuery.FieldByName('TIPO').AsString);
          RDprint1.ImpVal(linha,03,'##0.00',IQuery.FieldByName('ALIQUOTA').AsFloat,[]);
          RDprint1.ImpVal(linha,25,'#,###,##0.00',IQuery.FieldByName('TOTAL').AsFloat,[]);
          Inc(Linha);

          IQuery.Next;
          End;

        RDprint1.Imp(linha, 01, 'Total Icms          : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('TOTAL_ICMS').AsFloat,[]);
        Inc(Linha);
        RDprint1.Imp(linha, 01, 'Subst. Trib. ICMS   : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('SUBSTITUICAO_ICMS').AsFloat,[]);
        Inc(Linha);
        RDprint1.Imp(linha, 01, 'IsentoICMS          : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('ISENTO_ICMS').AsFloat,[]);
        Inc(Linha);
        RDprint1.Imp(linha, 01, 'Não Tributado Icms  : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('NAO_TRIBUTADO_ICMS').AsFloat,[]);
        Inc(Linha);

        Inc(Linha);
        RDprint1.ImpC(linha, 20, 'ISSQN',[comp12,negrito]);
        Inc(Linha);
        RDprint1.Imp(linha,01, 'Totalizador/Aliq.');
        RDprint1.Imp(linha,29, 'Base Cálc.');
        Inc(Linha);


          IQuery.Sql.Clear;
          IQuery.Sql.Add('SELECT * FROM REDUCOES_ISSQN WHERE DT_MOVIMENTO = :DT_MOVIMENTO AND NUM_SERIE = :NUM_SERIE');
          IQuery.ParamByName('DT_MOVIMENTO').AsDateTime := Dt_Movimento.Date;
          IQuery.ParamByName('NUM_SERIE').AsString := QImpressora.FieldByName('SERIAL').AsString;
          IQuery.Prepare;
          IQuery.Open;

          while not IQuery.Eof do
          Begin
          RDprint1.Imp(linha, 01, IQuery.FieldByName('TIPO').AsString);
          RDprint1.ImpVal(linha,03,'##0.00',IQuery.FieldByName('ALIQUOTA').AsFloat,[]);
          RDprint1.ImpVal(linha,25,'#,###,##0.00',IQuery.FieldByName('TOTAL').AsFloat,[]);
          Inc(Linha);
          End;

        RDprint1.Imp(linha, 01, 'Total ISSQN         : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('TOTAL_ISSQN').AsFloat,[]);
        Inc(Linha);
        RDprint1.Imp(linha, 01, 'Subst. Trib. ICMS   : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('SUBSTITUICAO_ISSQN').AsFloat,[]);
        Inc(Linha);
        RDprint1.Imp(linha, 01, 'Isento ISSQN        : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('ISENTO_ISSQN').AsFloat,[]);
        Inc(Linha);
        RDprint1.Imp(linha, 01, 'Não Trib. ISSQN     : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('NAO_TRIBUTADO_ISSQN').AsFloat,[]);
        Inc(Linha);

        Inc(Linha);
        RDprint1.ImpC(linha,20, 'TOTALIZADORES NÃO FISCAIS',[comp12,negrito]);
        Inc(Linha);
        RDprint1.Imp(linha,01, 'Nº');
        RDprint1.Imp(linha,05, 'Operação');
        RDprint1.Imp(linha,22, 'Valor Acumulado(R$)');
        Inc(Linha);

          IQuery.Sql.Clear;
          IQuery.Sql.Add('SELECT * FROM REDUCOES_NAO_FISCAL WHERE DT_MOVIMENTO = :DT_MOVIMENTO AND NUM_SERIE = :NUM_SERIE');
          IQuery.ParamByName('DT_MOVIMENTO').AsDateTime := Dt_Movimento.Date;
          IQuery.ParamByName('NUM_SERIE').AsString := QImpressora.FieldByName('SERIAL').AsString;
          IQuery.Prepare;
          IQuery.Open;

          while not IQuery.Eof do
          Begin
          RDprint1.Imp(linha, 01, IQuery.FieldByName('INDICE').AsString);
          RDprint1.Imp(linha, 05, IQuery.FieldByName('DESCRICAO').AsString);
          RDprint1.ImpVal(linha,25,'#,###,##0.00',IQuery.FieldByName('TOTAL').AsFloat,[]);
          Inc(Linha);
          IQuery.Next;
          End;

        RDprint1.Imp(linha, 01, 'Total Op. Não Fiscal: ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('OPERACAO_NAO_FISCAL').AsFloat,[]);
        Inc(Linha);

        Inc(Linha);
        RDprint1.ImpC(linha,20, 'RELATÓRIO GERENCIAL',[comp12,negrito]);
        Inc(Linha);
        RDprint1.Imp(linha,01, 'Nº');
        RDprint1.Imp(linha,05, 'Relatório');
        Inc(Linha);

         IQuery.Sql.Clear;
          IQuery.Sql.Add('SELECT * FROM REDUCOES_RELAT_GERENCIAL WHERE DT_MOVIMENTO = :DT_MOVIMENTO AND NUM_SERIE = :NUM_SERIE');
          IQuery.ParamByName('DT_MOVIMENTO').AsDateTime := Dt_Movimento.Date;
          IQuery.ParamByName('NUM_SERIE').AsString := QImpressora.FieldByName('SERIAL').AsString;
          IQuery.Prepare;
          IQuery.Open;

          while not IQuery.Eof do
          Begin
          RDprint1.Imp(linha, 01, IQuery.FieldByName('INDICE').AsString);
          RDprint1.Imp(linha, 05, IQuery.FieldByName('DESCRICAO').AsString);
          Inc(Linha);
          IQuery.Next;
          End;

        Inc(Linha);
        RDprint1.ImpC(linha, 20, 'MEIOS DE PAGAMENTO',[comp12,negrito]);
        Inc(Linha);
        RDprint1.Imp(linha,01, 'Nº');
        RDprint1.Imp(linha,05, 'Meio Pagamento');
        RDprint1.Imp(linha,22, 'Valor Acumulado(R$)');
        Inc(Linha);

          IQuery.Sql.Clear;
          IQuery.Sql.Add('SELECT * FROM REDUCOES_MEIOS_PAGTO WHERE DT_MOVIMENTO = :DT_MOVIMENTO AND NUM_SERIE = :NUM_SERIE');
          IQuery.ParamByName('DT_MOVIMENTO').AsDateTime := Dt_Movimento.Date;
          IQuery.ParamByName('NUM_SERIE').AsString := QImpressora.FieldByName('SERIAL').AsString;
          IQuery.Prepare;
          IQuery.Open;

          while not IQuery.Eof do
          Begin
          RDprint1.Imp(linha, 01, IQuery.FieldByName('INDICE').AsString);
          RDprint1.Imp(linha, 05, IQuery.FieldByName('DESCRICAO').AsString);
          RDprint1.ImpVal(linha,25,'#,###,##0.00',IQuery.FieldByName('TOTAL').AsFloat,[]);
          Inc(Linha);
          IQuery.Next;
          End;

        Inc(Linha);
        RDprint1.Imp(linha, 01, 'Total Troco         : ');
        RDprint1.ImpVal(linha,25,'#,###,##0.00',QRel.FieldByName('TOTAL_TROCO').AsFloat,[]);
        Inc(Linha);

        Application.ProcessMessages;

        RDprint1.TamanhoQteLinhas         := Linha;
        RDprint1.Fechar;

    End;


  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmRel_Reducao_z.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRel_Reducao_z.DBLookupComboBox1Click(Sender: TObject);
begin
Dbtext4.Visible := True;
end;

procedure TFrmRel_Reducao_z.Dt_movimentoEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmRel_Reducao_z.Dt_movimentoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmRel_Reducao_z.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRel_Reducao_z.FormCreate(Sender: TObject);
begin
  QImpressora.Open;
  Dt_Movimento.Date := date;

end;

procedure TFrmRel_Reducao_z.RegistroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

end.
