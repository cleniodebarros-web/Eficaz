unit UExportacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmExportacao = class(TForm)
    Entradas: TCheckBox;
    Saidas: TCheckBox;
    Posicao_Estoque: TCheckBox;
    Bevel1: TBevel;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    QEntSai: TFDQuery;
    QEntSaiItem: TFDQuery;
    procedure btnExecutaClick(Sender: TObject);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function Set_Data(Dt: String): String;
  end;

var
  FrmExportacao: TFrmExportacao;

implementation

uses
  UData, UPrincipal;

{$R *.dfm}

procedure TFrmExportacao.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmExportacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmExportacao.Set_Data(Dt: String): String;
begin
  if Dt = '' then
    Result := '00/00/00'
  else
    Result := Copy(Dt, 1, 3) + Copy(Dt, 4, 3) + Copy(Dt, 9, 2);
end;

procedure TFrmExportacao.btnExecutaClick(Sender: TObject);
var
F1, F2: TextFile;
Arq_Trans, Arq_Itens, Arq_Rec, Vr_Entrada, Dir: String;
Qtd_Atu, Qtd_Pen, Qt_Itens: Integer;
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;

    if Entradas.Checked then
    begin
      Arq_Trans := 'EN' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 1, 2) +
                          Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2) +
                          Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) + '.' +
                   LeIni(Arq_Ini, 'Integração', 'Loja');

      Arq_Itens := 'EI' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 1, 2) +
                          Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2) +
                          Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) + '.' +
                   LeIni(Arq_Ini, 'Integração', 'Loja');

      Dir := LeIni(Arq_Ini, 'Integração', 'Path Exportação');

      AssignFile(F1, Dir + Arq_Trans);
      Rewrite(F1);

      AssignFile(F2, Dir + Arq_Itens);
      Rewrite(F2);

      try
        QEntSai.Sql.Clear;
        QEntSai.Sql.Add('SELECT COUNT(*), SUM(VALOR)');
        QEntSai.Sql.Add('FROM TRANSACOES');
        QEntSai.Sql.Add('WHERE');
        QEntSai.Sql.Add('(DT_MOVIMENTO = :DT_MOVIMENTO)');
        QEntSai.Sql.Add('AND (CONDUTA = :CONDUTA)');
        QEntSai.Sql.Add('AND (DEPTO = :DEPTO)');

        QEntSai.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QEntSai.ParamByName('CONDUTA').AsString        := '02';
        QEntSai.ParamByName('DEPTO').AsString          := '07';

        QEntSai.Prepare;
        QEntSai.Open;

        WriteLn(F1, '0000000000000000000000/00/0000' +
                    Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) +
                    '00000000       00/00/000.' +
                    StrZero(Copy(LeIni(Arq_Ini, 'Integração', 'Loja'), 2, 2), 6, 0) +
                    ' ' +
                    Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 1, 3) +
                    Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 3) +
                    Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) +
                    '0' +
                    Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 1, 3) +
                    Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 3) +
                    Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) +
                    ' 00000 00/00/00000000000000000000 ' +
                    '                                                                                ' +
                    StrZero(QEntSai.Fields[0].AsString, 9, 0) +
                    '0000000,000000000,000000000,000000000,000000000,000000000,000000000,000000000,000000000,000000000,000000000,000000000,00' +
                    Copy(StrZero(QEntSai.Fields[1].AsString, 9, 2), 1, 7) + ',' +
                    Copy(StrZero(QEntSai.Fields[1].AsString, 9, 2), 8, 2) +
                    '0000000000000000000,0000000000,0000/00/000000000,0000/00/000000000,0000/00/000000000,0000/00/000000000,0000/00/000000000,0000/00/00');

          Vr_Entrada := Copy(StrZero(QEntSai.Fields[1].AsString, 9, 2), 1, 7) + ',' +
                        Copy(StrZero(QEntSai.Fields[1].AsString, 9, 2), 8, 2);

          QEntSaiItem.Sql.Clear;
          QEntSaiItem.Sql.Add('SELECT COUNT(*), SUM(TRANSITENS.VR_TOTAL)');
          QEntSaiItem.Sql.Add('FROM TRANSITENS');
          QEntSaiItem.Sql.Add('INNER JOIN TRANSACOES');
          QEntSaiItem.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
          QEntSaiItem.Sql.Add('WHERE');
          QEntSaiItem.Sql.Add('(TRANSACOES.DT_MOVIMENTO = :DT_MOVIMENTO)');
          QEntSaiItem.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
          QEntSaiItem.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');

          QEntSaiItem.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
          QEntSaiItem.ParamByName('CONDUTA').AsString        := '02';
          QEntSaiItem.ParamByName('DEPTO').AsString          := '07';

          QEntSaiItem.Prepare;
          QEntSaiItem.Open;

          WriteLn(F2, StrZero(QEntSaiItem.Fields[0].AsString, 17, 0) +
                      '00000000000,000000000,000000000,000000000,00' +
                      Vr_Entrada +
                      ' ');

        QEntSai.Sql.Clear;
        QEntSai.Sql.Add('SELECT * FROM TRANSACOES');
        QEntSai.Sql.Add('WHERE');
        QEntSai.Sql.Add('(DT_MOVIMENTO = :DT_MOVIMENTO)');
        QEntSai.Sql.Add('AND (CONDUTA = :CONDUTA)');
        QEntSai.Sql.Add('AND (DEPTO = :DEPTO)');

        QEntSai.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QEntSai.ParamByName('CONDUTA').AsString        := '02';
        QEntSai.ParamByName('DEPTO').AsString          := '07';

        QEntSai.Prepare;
        QEntSai.Open;

        QEntSai.First;
        while not QEntSai.Eof do
        begin
          WriteLn(F1, Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) +
                      Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2) +
                      Copy(LeIni(Arq_Ini, 'Integração', 'Loja'), 2, 2) +
                      StrZero(QEntSai.FieldByName('TRANSACAO_ID').AsString, 6, 0) +
                      '1' + // Especie
                      '11' + // Tipo
                      StrZero('2', 5, 0) + // Mod. Entrada
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 1, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 4, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 9, 2) +
                      StrZero('1', 2, 0) + // Turno
                      StrZero(Copy(TimeToStr(time), 1, 2), 2, 0) + // Hora
                      StrZero(Copy(TimeToStr(time), 4, 2), 2, 0) + // Minuto
                      StrZero(QEntSai.FieldByName('NUM_DOC').AsString, 8, 0) +
                      ForcaComprimento('U', 2, ' ') + // Mod. Doc. Fiscal
                      ForcaComprimento(QEntSai.FieldByName('SERIE').AsString, 3, ' ') +
                      ForcaComprimento(' ', 2, ' ') + // Sub-Série Doc. Fiscal
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 1, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 4, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 9, 2) +
                      Copy(QEntSai.FieldByName('CFOP').AsString, 1, 1) + '.' +
                      Copy(QEntSai.FieldByName('CFOP').AsString, 2, 3) +
                      StrZero(Copy(LeIni(Arq_Ini, 'Integração', 'Loja'), 2, 2), 3, 0) +
                      'N' + // Sts Entrada
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 1, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 4, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 9, 2) +
                      '0' + // Sts Atualização
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 1, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 4, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 9, 2) +
                      '?' + // Sts Controlados
                      StrZero('1', 5, 0) + // Funcionário ID
                      'X' + // Sts Saída
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 1, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 4, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 9, 2) +
                      StrZero('0', 12, 0) + // Saída ID
                      StrZero(QEntSai.FieldByName('FORNECEDOR_ID').AsString, 6, 0) +
                      ForcaComprimento(QEntSai.FieldByName('HISTORICO').AsString, 40, ' ') +
                      ForcaComprimento(QEntSai.FieldByName('HISTORICO').AsString, 40, ' ') +
                      StrZero(QEntSai.FieldByName('ITENS').AsString, 4, 0) +
                      StrZero(QEntSai.FieldByName('UNIDADES').AsString, 6, 0) +
                      Copy(StrZero(QEntSai.FieldByName('VALOR_PRODUTOS').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VALOR_PRODUTOS').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('VR_DESCONTO').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VR_DESCONTO').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('VR_IPI').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VR_IPI').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('VR_FRETE').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VR_FRETE').AsString, 9, 2), 8, 2) +
                      Copy(StrZero('0', 9, 2), 1, 7) + ',' + // VR_SEGURO
                      Copy(StrZero('0', 9, 2), 8, 2) + // VR_SEGURO
                      Copy(StrZero(QEntSai.FieldByName('VR_ACRESCIMO').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VR_ACRESCIMO').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('BASE_ICMS_NORMAL').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('BASE_ICMS_NORMAL').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('VR_ICMS_NORMAL').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VR_ICMS_NORMAL').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('BASE_ICMS_ST').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('BASE_ICMS_ST').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('VR_ICMS_ST').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VR_ICMS_ST').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 8, 2) +
                      StrZero('0', 12, 2) + // Saída Crédito
                      Copy(StrZero('0', 9, 2), 1, 7) + ',' + // Crédito Entrada
                      Copy(StrZero('0', 9, 2), 8, 2) + // Crédito Entrada
                      '1' +
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 8, 2) +
                      Copy(DateToStr((QEntSai.FieldByName('DT_TRANS').AsDateTime + 30)), 1, 3) +
                      Copy(DateToStr((QEntSai.FieldByName('DT_TRANS').AsDateTime + 30)), 4, 3) +
                      Copy(DateToStr((QEntSai.FieldByName('DT_TRANS').AsDateTime + 30)), 9, 2) +
                      '0000000,0000/00/000000000,0000/00/000000000,0000/00/000000000,0000/00/000000000,0000/00/00');

          QEntSaiItem.Sql.Clear;
          QEntSaiItem.Sql.Add('SELECT PRODUTO_ID, QUANTIDADE, VR_UNITARIO, VR_DESCONTO, VR_IPI, VR_TOTAL');
          QEntSaiItem.Sql.Add('FROM TRANSITENS');
          QEntSaiItem.Sql.Add('WHERE');
          QEntSaiItem.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');
          QEntSaiItem.ParamByName('TRANSACAO_ID').AsInteger := QEntSai.FieldByName('TRANSACAO_ID').AsInteger;
          QEntSaiItem.Prepare;
          QEntSaiItem.Open;

          QEntSaiItem.First;
          while not QEntSaiItem.Eof do
          begin
            WriteLn(F2, Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) +
                        Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2) +
                        Copy(LeIni(Arq_Ini, 'Integração', 'Loja'), 2, 2) +
                        StrZero(QEntSai.FieldByName('TRANSACAO_ID').AsString, 6, 0) +
                        StrZero(QEntSaiItem.FieldByName('PRODUTO_ID').AsString, 5, 0) +
                        StrZero(QEntSaiItem.FieldByName('QUANTIDADE').AsString, 4, 0) +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_UNITARIO').AsString, 9, 2), 1, 7) + ',' +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_UNITARIO').AsString, 9, 2), 8, 2) +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_DESCONTO').AsString, 9, 2), 1, 7) + ',' +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_DESCONTO').AsString, 9, 2), 8, 2) +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_IPI').AsString, 9, 2), 1, 7) + ',' +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_IPI').AsString, 9, 2), 8, 2) +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_UNITARIO').AsString, 9, 2), 1, 7) + ',' +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_UNITARIO').AsString, 9, 2), 8, 2) +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_TOTAL').AsString, 9, 2), 1, 7) + ',' +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_TOTAL').AsString, 9, 2), 8, 2) +
                        'N'); // Sts Item;

            Application.ProcessMessages;
            QEntSaiItem.Next;
          end;

          Application.ProcessMessages;
          QEntSai.Next;
        end;
      finally
        CloseFile(F1);
        CloseFile(F2);
      end;
    end;

    if Saidas.Checked then
    begin
      Arq_Trans := 'SA' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 1, 2) +
                          Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2) +
                          Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) + '.' +
                   LeIni(Arq_Ini, 'Integração', 'Loja');

      Arq_Itens := 'SI' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 1, 2) +
                          Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2) +
                          Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) + '.' +
                   LeIni(Arq_Ini, 'Integração', 'Loja');

      Arq_Rec := 'CR' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 1, 2) +
                        Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2) +
                        Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) + '.' +
                   LeIni(Arq_Ini, 'Integração', 'Loja');

      Dir := LeIni(Arq_Ini, 'Integração', 'Path Exportação');

      AssignFile(F1, Dir + Arq_Rec);
      Rewrite(F1);

      WriteLn(F1, '0000000000000000000000000   00000000 0000000000/00/00');
      CloseFile(F1);

      AssignFile(F1, Dir + Arq_Trans);
      Rewrite(F1);

      AssignFile(F2, Dir + Arq_Itens);
      Rewrite(F2);

      try
        QEntSai.Sql.Clear;
        QEntSai.Sql.Add('SELECT COUNT(*), SUM(VALOR)');
        QEntSai.Sql.Add('FROM TRANSACOES');
        QEntSai.Sql.Add('WHERE');
        QEntSai.Sql.Add('(DT_MOVIMENTO = :DT_MOVIMENTO)');
        QEntSai.Sql.Add('AND (CONDUTA = :CONDUTA)');
        QEntSai.Sql.Add('AND (DEPTO = :DEPTO)');
        QEntSai.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QEntSai.ParamByName('CONDUTA').AsString := '20';
        QEntSai.ParamByName('DEPTO').AsString := '07';
        QEntSai.Prepare;
        QEntSai.Open;

        WriteLn(F1, '000000000000000 ' +
                    Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 1, 3) +
                    Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 3) +
                    Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) +
                    '0' +
                    Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 1, 3) +
                    Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 3) +
                    Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) +
                    '000000000000000/00/0000' +
                    Copy(TimeToStr(time), 1, 2) + Copy(TimeToStr(time), 4, 2) +
                    ' ' +
                    StrZero(QEntSai.Fields[0].AsString, 10, 0) +
                    '0000000,000000000,000000000,000000000,000000000,000000000,000000000,00' +
                    Copy(StrZero(QEntSai.Fields[1].AsString, 9, 2), 1, 7) + ',' +
                    Copy(StrZero(QEntSai.Fields[1].AsString, 9, 2), 8, 2) +
                    '                                                                        ' +
                    ' 000000000000 ' +
                    StrZero(Copy(LeIni(Arq_Ini, 'Integração', 'Loja'), 2, 2), 15, 0) +
                    '00000000000000000000000,0000000,00000000-0000000000000000');

        Vr_Entrada := Copy(StrZero(QEntSai.Fields[1].AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.Fields[1].AsString, 9, 2), 8, 2);

        QEntSaiItem.Sql.Clear;
        QEntSaiItem.Sql.Add('SELECT COUNT(*), SUM(TRANSITENS.VR_TOTAL)');
        QEntSaiItem.Sql.Add('FROM TRANSITENS');
        QEntSaiItem.Sql.Add('INNER JOIN TRANSACOES');
        QEntSaiItem.Sql.Add('ON (TRANSITENS.TRANSACAO_ID = TRANSACOES.TRANSACAO_ID)');
        QEntSaiItem.Sql.Add('WHERE');
        QEntSaiItem.Sql.Add('(TRANSACOES.DT_MOVIMENTO = :DT_MOVIMENTO)');
        QEntSaiItem.Sql.Add('AND (TRANSACOES.CONDUTA = :CONDUTA)');
        QEntSaiItem.Sql.Add('AND (TRANSACOES.DEPTO = :DEPTO)');

        QEntSaiItem.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QEntSaiItem.ParamByName('CONDUTA').AsString        := '20';
        QEntSaiItem.ParamByName('DEPTO').AsString          := '07';

        QEntSaiItem.Prepare;
        QEntSaiItem.Open;

        WriteLn(F2, StrZero(QEntSaiItem.Fields[0].AsString, 17, 0) +
                    '00000000000,000000000,000000000,00' +
                    Vr_Entrada +
                    '     ');

        QEntSai.Sql.Clear;
        QEntSai.Sql.Add('SELECT * FROM TRANSACOES');
        QEntSai.Sql.Add('WHERE');
        QEntSai.Sql.Add('(DT_MOVIMENTO = :DT_MOVIMENTO)');
        QEntSai.Sql.Add('AND (CONDUTA = :CONDUTA)');
        QEntSai.Sql.Add('AND (DEPTO = :DEPTO)');
        QEntSai.Sql.Add('ORDER BY SAIDA_ID');

        QEntSai.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
        QEntSai.ParamByName('CONDUTA').AsString        := '20';
        QEntSai.ParamByName('DEPTO').AsString          := '07';

        QEntSai.Prepare;
        QEntSai.Open;

        QEntSai.First;
        while not QEntSai.Eof do
        begin
          WriteLn(F1, Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) +
                      Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2) +
                      Copy(LeIni(Arq_Ini, 'Integração', 'Loja'), 2, 2) +
                      StrZero(QEntSai.FieldByName('TRANSACAO_ID').AsString, 6, 0) +
                      '2' + // Espécie
                      '21' + // Tipo
                      'N' + // Sts Saída
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 1, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 4, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 9, 2) +
                      '0' + // Sts Atualização
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 1, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 4, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 9, 2) +
                      '7' + // Grupo Mod. Pagto.
                      '0' + // Sts Pagto. Saída
                      StrZero(QEntSai.FieldByName('NUM_DOC').AsString, 8, 0) +
                      ForcaComprimento(' ', 1, ' ') +
                      Copy(LeIni(Arq_Ini, 'Integração', 'Loja'), 2, 2) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 1, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 4, 3) +
                      Copy(QEntSai.FieldByName('DT_TRANS').AsString, 9, 2) +
                      StrZero('1', 2, 0) + // Turno
                      StrZero(Copy(TimeToStr(time), 1, 2), 2, 0) + // Hora
                      StrZero(Copy(TimeToStr(time), 4, 2), 2, 0) + // Minuto
                      'N' + // Sts Controlados
                      '1' + // Sts Atendimento
                      StrZero(QEntSai.FieldByName('ITENS').AsString, 4, 0) +
                      StrZero(QEntSai.FieldByName('UNIDADES').AsString, 5, 0) +
                      Copy(StrZero(QEntSai.FieldByName('VALOR_PRODUTOS').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VALOR_PRODUTOS').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('VR_DESCONTO').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VR_DESCONTO').AsString, 9, 2), 8, 2) +
                      Copy(StrZero('0', 9, 2), 1, 7) + ',' + // Desconto Manual
                      Copy(StrZero('0', 9, 2), 8, 2) + // Desconto Manual
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('VR_ACRESCIMO').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VR_ACRESCIMO').AsString, 9, 2), 8, 2) +
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 8, 2) +
                      Copy(StrZero('0', 9, 2), 1, 7) + ',' + // Valor Créditos
                      Copy(StrZero('0', 9, 2), 8, 2) + // Valor Créditos
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 1, 7) + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VALOR').AsString, 9, 2), 8, 2) +
                      ForcaComprimento(' ', 24, ' ') + // Nome
                      ForcaComprimento(' ', 16, ' ') + // Controle
                      ForcaComprimento(' ', 16, ' ') + // Requisição
                      ForcaComprimento(' ', 16, ' ') + // Complemento
                      '0' + // Sts Entrada
                      StrZero('0', 12, 0) + // Entrada ID
                      'X' + // Sts Autorização
                      StrZero('0', 12, 0) + // Autorização ID
                      StrZero(QEntSai.FieldByName('CLIENTE_ID').AsString, 3, 0) +
                      StrZero(QEntSai.FieldByName('CLIENTE_ID').AsString, 6, 0) + // Filial
                      StrZero('1', 5, 0) + // Funcionário
                      StrZero('27', 5, 0) + // Mod. Venda
                      Copy(StrZero('0', 9, 2), 1, 7) + ',' + // Desconto Global
                      Copy(StrZero('0', 9, 2), 8, 2) + // Desconto Global
                      Copy(StrZero('0', 7, 2), 1, 5) + ',' + // Bônus
                      Copy(StrZero('0', 7, 2), 6, 2) + // Bônus
                      '000000-000000' +
                      StrZero('0', 2, 0) + // Prazo Pagto.
                      StrZero('1', 2, 0) + // Parcelas
                      StrZero('0', 2, 0) + // Prazo Parcelas
                      '0000');

          QEntSaiItem.Sql.Clear;
          QEntSaiItem.Sql.Add('SELECT PRODUTO_ID, TRANSITENS.QUANTIDADE, TRANSITENS.VR_UNITARIO, TRANSITENS.VR_DESCONTO, TRANSITENS.VR_TOTAL');
          QEntSaiItem.Sql.Add('FROM TRANSITENS');
          QEntSaiItem.Sql.Add('WHERE');
          QEntSaiItem.Sql.Add('(TRANSACAO_ID = :TRANSACAO_ID)');

          QEntSaiItem.ParamByName('TRANSACAO_ID').AsInteger := QEntSai.FieldByName('TRANSACAO_ID').AsInteger;

          QEntSaiItem.Prepare;
          QEntSaiItem.Open;

          QEntSaiItem.First;
          while not QEntSaiItem.Eof do
          begin
            WriteLn(F2, Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) +
                        Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2) +
                        Copy(LeIni(Arq_Ini, 'Integração', 'Loja'), 2, 2) +
                        StrZero(QEntSai.FieldByName('TRANSACAO_ID').AsString, 6, 0) +
                        StrZero(QEntSaiItem.FieldByName('PRODUTO_ID').AsString, 5, 0) +
                        StrZero(QEntSaiItem.FieldByName('QUANTIDADE').AsString, 4, 0) +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_UNITARIO').AsString, 9, 2), 1, 7) + ',' +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_UNITARIO').AsString, 9, 2), 8, 2) +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_DESCONTO').AsString, 9, 2), 1, 7) + ',' +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_DESCONTO').AsString, 9, 2), 8, 2) +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_UNITARIO').AsString, 9, 2), 1, 7) + ',' +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_UNITARIO').AsString, 9, 2), 8, 2) +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_TOTAL').AsString, 9, 2), 1, 7) + ',' +
                        Copy(StrZero(QEntSaiItem.FieldByName('VR_TOTAL').AsString, 9, 2), 8, 2) +
                        '0' + // Sts Preço
                        ForcaComprimento('0', 1, ' ') + // Gr Venda
                        ForcaComprimento('0', 1, ' ') + // Gr Total
                        'N' + // Sts Item
                        'N');

            Application.ProcessMessages;
            QEntSaiItem.Next;
          end;

          Application.ProcessMessages;
          QEntSai.Next;
        end;
      finally
        CloseFile(F1);
        CloseFile(F2);
      end;
    end;

    if Posicao_Estoque.Checked then
    begin
      QEntSai.Sql.Clear;
      QEntSai.Sql.Add('SELECT COUNT(*) AS TOTAL FROM PRODUTOS');
      QEntSai.Sql.Add('WHERE');
      QEntSai.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');

      if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
      begin
        QEntSai.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

        QEntSai.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
      end;

      QEntSai.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QEntSai.Prepare;
      QEntSai.Open;

      Qt_Itens := QEntSai.FieldByName('TOTAL').AsInteger;

      QEntSai.Sql.Clear;
      QEntSai.Sql.Add('SELECT * FROM PRODUTOS');
      QEntSai.Sql.Add('WHERE');
      QEntSai.Sql.Add('(EMPRESA_ID = :EMPRESA_ID)');

      if StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização')) > 0 then
      begin
        QEntSai.Sql.Add('AND (PRODUTOS.LOCALIZACAO_ID = :LOCALIZACAO_ID)');

        QEntSai.ParamByName('LOCALIZACAO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Localização'));
      end;

      QEntSai.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QEntSai.Prepare;
      QEntSai.Open;

      Arq_Trans := 'ES' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 1, 2) +
                          Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2) +
                          Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) + '.' +
                   LeIni(Arq_Ini, 'Integração', 'Loja');

      Arq_Itens := 'PC' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 1, 2) +
                          Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 2) +
                          Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 9, 2) + '.' +
                   LeIni(Arq_Ini, 'Integração', 'Loja');

      Dir := LeIni(Arq_Ini, 'Integração', 'Path Exportação');

      AssignFile(F1, Dir + Arq_Trans);
      Rewrite(F1);

      AssignFile(F2, Dir + Arq_Itens);
      Rewrite(F2);

      try
        WriteLn(F1, '00.000' +
                    StrZero(IntToStr(Qt_Itens), 6, 0) +
                    '  00/00/00000,000000.000,0000.000,0000.000,0000.00000.00000.00000.00000.00000.00000.00000/00/00' +
                    '00.0000.00000.0000.00000.00000/00/0000.0000.00000.00000/00/0000.0000.00000.00000/00/0000.0000.00000.00000/00/00' +
                    '00.0000.00000.00000/00/0000.00000000000,000000000,0000.00000.000');

        WriteLn(F2, '00.000' +
                    StrZero(IntToStr(Qt_Itens), 6, 0) +
                    '0000000,0000/00/000000000,0000/00/0000/00/000000000,000000000,0000/00/000000000,000000000,000000000,000000000,00');

        QEntSai.First;
        while not QEntSai.Eof do
        begin
          if QEntSai.FieldByName('QUANTIDADE_G').AsInteger > 0 then
          begin
            Qtd_Atu := QEntSai.FieldByName('QUANTIDADE_G').AsInteger;
            Qtd_Pen := 0;
          end
          else
          begin
            Qtd_Atu := 0;
            Qtd_Pen := (QEntSai.FieldByName('QUANTIDADE_G').AsInteger * -1);
          end;

          WriteLn(F1, Copy(StrZero(QEntSai.FieldByName('COD_ORIGINAL').AsString, 5, 0), 1, 2) + '.' +
                      Copy(StrZero(QEntSai.FieldByName('COD_ORIGINAL').AsString, 5, 0), 3, 3) +
                      StrZero(Copy(LeIni(Arq_Ini, 'Integração', 'Loja'), 2, 2), 6, 0) +
                      'C' + // Classe Valor
                      '3' + // Classe Volume
                      Set_Data('') + // ULT_VENDA
                      Copy(StrZero('0', 7, 4), 1, 3)  + ',' + // Par Faturamento
                      Copy(StrZero('0', 7, 4), 4, 4) + // Par Faturamento
                      Copy(StrZero(QEntSai.FieldByName('VENDA_MEDIA_PON').AsString, 7, 2), 1, 2)  + '.' +
                      Copy(StrZero(QEntSai.FieldByName('VENDA_MEDIA_PON').AsString, 7, 2), 3, 3)  + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VENDA_MEDIA_PON').AsString, 7, 2), 6, 2) +
                      Copy(StrZero(QEntSai.FieldByName('VENDA_MEDIA_SEM').AsString, 7, 2), 1, 2)  + '.' +
                      Copy(StrZero(QEntSai.FieldByName('VENDA_MEDIA_SEM').AsString, 7, 2), 3, 3)  + ',' +
                      Copy(StrZero(QEntSai.FieldByName('VENDA_MEDIA_SEM').AsString, 7, 2), 6, 2) +
                      Copy(StrZero(QEntSai.FieldByName('DESV_PAD_SEM').AsString, 7, 2), 1, 2)  + '.' +
                      Copy(StrZero(QEntSai.FieldByName('DESV_PAD_SEM').AsString, 7, 2), 3, 3)  + ',' +
                      Copy(StrZero(QEntSai.FieldByName('DESV_PAD_SEM').AsString, 7, 2), 6, 2) +
                      Copy(StrZero(QEntSai.FieldByName('EST_TRABALHO').AsString, 5, 0), 1, 2)  + '.' +
                      Copy(StrZero(QEntSai.FieldByName('EST_TRABALHO').AsString, 5, 0), 3, 3) +
                      Copy(StrZero(QEntSai.FieldByName('EST_SEGURANCA').AsString, 5, 0), 1, 2)  + '.' +
                      Copy(StrZero(QEntSai.FieldByName('EST_SEGURANCA').AsString, 5, 0), 3, 3) +
                      Copy(StrZero(QEntSai.FieldByName('DEMANDA_MAX').AsString, 5, 0), 1, 2)  + '.' +
                      Copy(StrZero(QEntSai.FieldByName('DEMANDA_MAX').AsString, 5, 0), 3, 3) +
                      Copy(StrZero(QEntSai.FieldByName('PONTO_PEDIDO').AsString, 5, 0), 1, 2)  + '.' +
                      Copy(StrZero(QEntSai.FieldByName('PONTO_PEDIDO').AsString, 5, 0), 3, 3) +
                      Copy(StrZero(IntToStr(Qtd_Atu), 5, 0), 1, 2)  + '.' +
                      Copy(StrZero(IntToStr(Qtd_Atu), 5, 0), 3, 3) +
                      Copy(StrZero(IntToStr(Qtd_Pen), 5, 0), 1, 2)  + '.' +
                      Copy(StrZero(IntToStr(Qtd_Pen), 5, 0), 3, 3) +
                      Copy(StrZero(QEntSai.FieldByName('EMBALAGEM').AsString, 5, 0), 1, 2)  + '.' +
                      Copy(StrZero(QEntSai.FieldByName('EMBALAGEM').AsString, 5, 0), 3, 3) +
                      Set_Data(QEntSai.FieldByName('DT_COMPRA').AsString) +
                      Copy(StrZero(QEntSai.FieldByName('ULT_QUANTIDADE').AsString, 5, 0), 1, 2)  + '.' +
                      Copy(StrZero(QEntSai.FieldByName('ULT_QUANTIDADE').AsString, 5, 0), 3, 3) +
                      Copy(StrZero('0', 4, 0), 1, 1)  + '.' + // QTDE_PERIODO_COMPRA
                      Copy(StrZero('0', 4, 0), 2, 3) + // QTDE_PERIODO_COMPRA
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // TOTAL_PERIODO_COMPRA
                      Copy(StrZero('0', 5, 0), 3, 3) + // TOTAL_PERIODO_COMPRA
                      Copy(StrZero('0', 4, 0), 1, 1)  + '.' + // QTDE_PERIODO_VENDA
                      Copy(StrZero('0', 4, 0), 2, 3) + // QTDE_PERIODO_VENDA
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // TOTAL_PERIODO_VENDA
                      Copy(StrZero('0', 5, 0), 3, 3) + // TOTAL_PERIODO_VENDA
                      Set_Data('') + // ULT_DEV
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // UNID_DEV
                      Copy(StrZero('0', 5, 0), 3, 3) + // UNID_DEV
                      Copy(StrZero('0', 4, 0), 1, 1)  + '.' + // QTDE_PERIODO_DEV
                      Copy(StrZero('0', 4, 0), 2, 3) + // QTDE_PERIODO_DEV
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // TOTAL_PERIODO_DEV
                      Copy(StrZero('0', 5, 0), 3, 3) + // TOTAL_PERIODO_DEV
                      Set_Data('') + // ULT_TRANSF
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // UNID_TRANSF
                      Copy(StrZero('0', 5, 0), 3, 3) + // UNID_TRANSF
                      Copy(StrZero('0', 4, 0), 1, 1)  + '.' + // QTDE_PERIODO_TRANSF
                      Copy(StrZero('0', 4, 0), 2, 3) + // QTDE_PERIODO_TRANSF
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // TOTAL_PERIODO_TRANSF
                      Copy(StrZero('0', 5, 0), 3, 3) + // TOTAL_PERIODO_TRANSF
                      Set_Data('') + // ULT_OENTRADA
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // UNID_OENTRADA
                      Copy(StrZero('0', 5, 0), 3, 3) + // UNID_OENTRADA
                      Copy(StrZero('0', 4, 0), 1, 1)  + '.' + // QTDE_PERIODO_OENTRADA
                      Copy(StrZero('0', 4, 0), 2, 3) + // QTDE_PERIODO_OENTRADA
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // TOTAL_PERIODO_OENTRADA
                      Copy(StrZero('0', 5, 0), 3, 3) + // TOTAL_PERIODO_OENTRADA
                      Set_Data('') + // ULT_OSAIDA
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // UNID_OSAIDA
                      Copy(StrZero('0', 5, 0), 3, 3) + // UNID_OSAIDA
                      Copy(StrZero('0', 4, 0), 1, 1)  + '.' + // QTDE_PERIODO_OSAIDA
                      Copy(StrZero('0', 4, 0), 2, 3) + // QTDE_PERIODO_OSAIDA
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // TOTAL_PERIODO_OSAIDA
                      Copy(StrZero('0', 5, 0), 3, 3) + // TOTAL_PERIODO_OSAIDA
                      Set_Data(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString) + // ALT_PERIODO
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // ESTOQUE_INICIAL
                      Copy(StrZero('0', 5, 0), 3, 3) + // ESTOQUE_INICIAL
                      Copy(StrZero('0', 10, 2), 1, 8)  + ',' + // VALOR_UTILIZ
                      Copy(StrZero('0', 10, 2), 9, 2) + // VALOR_UTILIZ
                      Copy(StrZero('0', 9, 2), 1, 7)  + ',' + // PRECO_INDEXADO
                      Copy(StrZero('0', 9, 2), 8, 2) + // PRECO_INDEXADO
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // POSICAO_VOLUME
                      Copy(StrZero('0', 5, 0), 3, 3) + // POSICAO_VOLUME
                      Copy(StrZero('0', 5, 0), 1, 2)  + '.' + // POSICAO_VALOR
                      Copy(StrZero('0', 5, 0), 3, 3)); // POSICAO_VALOR

// preco de custo
          WriteLn(F2, Copy(StrZero(QEntSai.FieldByName('COD_ORIGINAL').AsString, 5, 0), 1, 2) + '.' +
                      Copy(StrZero(QEntSai.FieldByName('COD_ORIGINAL').AsString, 5, 0), 3, 3) +
                      StrZero(Copy(LeIni(Arq_Ini, 'Integração', 'Loja'), 2, 2), 6, 0) +
                      Copy(StrZero(QEntSai.FieldByName('CUSTO_COMPRA').AsString, 9, 2), 1, 7)  + ',' + // PRECO_CUSTO
                      Copy(StrZero(QEntSai.FieldByName('CUSTO_COMPRA').AsString, 9, 2), 8, 2) + // PRECO_CUSTO
                      Set_Data(QEntSai.FieldByName('DT_COMPRA').AsString) + // ALT_CUSTO
                      Copy(StrZero(QEntSai.FieldByName('PRECO_VAREJO').AsString, 9, 2), 1, 7)  + ',' + // PRECO_VENDA_FIL
                      Copy(StrZero(QEntSai.FieldByName('PRECO_VAREJO').AsString, 9, 2), 8, 2) + // PRECO_VENDA_FIL
                      Set_Data(QEntSai.FieldByName('DT_PRECO').AsString) + // ALT_VENDA_FIL
                      Set_Data(QEntSai.FieldByName('DT_PRECO').AsString) + // ALT_PEN_CUSTO_ENTRADA
                      Copy(StrZero(QEntSai.FieldByName('CUSTO_COMPRA').AsString, 9, 2), 1, 7)  + ',' + // PEN_CUSTO_ENTRADA
                      Copy(StrZero(QEntSai.FieldByName('CUSTO_COMPRA').AsString, 9, 2), 8, 2) + // PEN_CUSTO_ENTRADA
                      Copy(StrZero(QEntSai.FieldByName('CUSTO_COMPRA').AsString, 9, 2), 1, 7)  + ',' + // PEN_CUSTO_LIQUIDO
                      Copy(StrZero(QEntSai.FieldByName('CUSTO_COMPRA').AsString, 9, 2), 8, 2) + // PEN_CUSTO_LIQUIDO
                      Set_Data(QEntSai.FieldByName('DT_PRECO').AsString) + // ALT_ULT_CUSTO_ENTRADA
                      Copy(StrZero(QEntSai.FieldByName('CUSTO_COMPRA').AsString, 9, 2), 1, 7)  + ',' + // ULT_CUSTO_ENTRADA
                      Copy(StrZero(QEntSai.FieldByName('CUSTO_COMPRA').AsString, 9, 2), 8, 2) + // ULT_CUSTO_ENTRADA
                      Copy(StrZero(QEntSai.FieldByName('CUSTO_COMPRA').AsString, 9, 2), 1, 7)  + ',' + // ULT_CUSTO_LIQUIDO
                      Copy(StrZero(QEntSai.FieldByName('CUSTO_COMPRA').AsString, 9, 2), 8, 2) + // ULT_CUSTO_LIQUIDO
                      Copy(StrZero(QEntSai.FieldByName('CUSTOMEDIO').AsString, 9, 2), 1, 7)  + ',' + // VMP_CUSTO_LIQUIDO
                      Copy(StrZero(QEntSai.FieldByName('CUSTOMEDIO').AsString, 9, 2), 8, 2) + // VMP_CUSTO_LIQUIDO
                      Copy(StrZero(QEntSai.FieldByName('CUSTOMEDIO').AsString, 9, 2), 1, 7)  + ',' + // VMP_CUSTO_ENTRADA
                      Copy(StrZero(QEntSai.FieldByName('CUSTOMEDIO').AsString, 9, 2), 8, 2)); // VMP_CUSTO_ENTRADA

          Application.ProcessMessages;
          QEntSai.Next;
        end;
      finally
        CloseFile(F1);
        CloseFile(F2);
      end;
    end;

    Application.MessageBox('Exportação executada com sucesso', PChar(Msg_Title), mb_IconInformation);

  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

end.
