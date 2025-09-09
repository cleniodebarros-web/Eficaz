unit UConfig_Etiqueta_RDprint_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, rxToolEdit, rxCurrEdit, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, Buttons;

type
  TFrmConfig_Etiqueta_RDprint_Cliente = class(TForm)
    Label107: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label106: TLabel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    RDcliente_Linhas_de_Etiquetas: TCurrencyEdit;
    RDcliente_Quantidade_de_Linhas: TCurrencyEdit;
    RDcliente_Quantidade_Colunas: TCurrencyEdit;
    RDcliente_Margem_Superior: TCurrencyEdit;
    RDcliente_Margem_Inferior: TCurrencyEdit;
    RDcliente_Margem_Esquerda: TCurrencyEdit;
    RDcliente_Margem_Direita: TCurrencyEdit;
    RDcliente_Linha1: TCurrencyEdit;
    RDcliente_Nome_col1: TCurrencyEdit;
    RDcliente_Colunas: TCurrencyEdit;
    QRel: TIBQuery;
    btnRetorna: TBitBtn;
    btnExecuta: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    RDcliente_Nome_col3: TCurrencyEdit;
    RDcliente_Linha2: TCurrencyEdit;
    RDcliente_Endereco_col1: TCurrencyEdit;
    RDcliente_Endereco_col2: TCurrencyEdit;
    RDcliente_Endereco_col3: TCurrencyEdit;
    RDcliente_Numero_col1: TCurrencyEdit;
    RDcliente_Numero_col2: TCurrencyEdit;
    RDcliente_Numero_col3: TCurrencyEdit;
    RDcliente_Linha3: TCurrencyEdit;
    RDcliente_Nome_col2: TCurrencyEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    RDcliente_Bairro_col2: TCurrencyEdit;
    RDcliente_Bairro_col3: TCurrencyEdit;
    RDcliente_Linha4: TCurrencyEdit;
    RDcliente_Municiopio_col1: TCurrencyEdit;
    RDcliente_Municipio_col2: TCurrencyEdit;
    RDcliente_Estado_col1: TCurrencyEdit;
    RDcliente_col2: TCurrencyEdit;
    RDcliente_Estado_col3: TCurrencyEdit;
    RDcliente_Linha5: TCurrencyEdit;
    RDcliente_Bairro_col1: TCurrencyEdit;
    Label21: TLabel;
    RDcliente_Cep_col1: TCurrencyEdit;
    Label22: TLabel;
    RDcliente_Cep_col2: TCurrencyEdit;
    RDcliente_Municipio_col3: TCurrencyEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    RDcliente_Cep_col3: TCurrencyEdit;
    RDcliente_Salto_Linhas: TCurrencyEdit;
    RDcliente_Fonte: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure RDcliente_ColunasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GravaConfig(Linha, Coluna, Campo, Tamanho: String);
  end;

var
  FrmConfig_Etiqueta_RDprint_Cliente: TFrmConfig_Etiqueta_RDprint_Cliente;

implementation

uses
  UPrincipal, UData;

{$R *.dfm}

procedure TFrmConfig_Etiqueta_RDprint_Cliente.GravaConfig(Linha, Coluna, Campo, Tamanho: String);
begin
  QRel.Sql.Clear;
  QRel.Sql.Add('INSERT INTO CONFIG_DUPLICATA( ' +
               'LINHA,  COLUNA,    CAMPO,  TAMANHO) VALUES(' +
               ':LINHA, :COLUNA,   :CAMPO, :TAMANHO)');
  QRel.ParamByName('LINHA').AsInteger   := StrToInt(Linha);
  QRel.ParamByName('COLUNA').AsInteger  := StrToInt(Coluna);
  QRel.ParamByName('CAMPO').AsString    := Campo;
  QRel.ParamByName('TAMANHO').AsInteger := StrToInt(Tamanho);
  QRel.Prepare;
  QRel.ExecSql;

end;

procedure TFrmConfig_Etiqueta_RDprint_Cliente.RDcliente_ColunasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmConfig_Etiqueta_RDprint_Cliente.btnExecutaClick(Sender: TObject);
begin
  try
    btnExecuta.Enabled := False;
    btnRetorna.Enabled := False;



  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Colunas', RDcliente_Colunas.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linhas de Etiquetas', RDcliente_Linhas_de_Etiquetas.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Quantidade de Linhas', RDcliente_Quantidade_de_Linhas.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Quantidade de Colunas', RDcliente_Quantidade_Colunas.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Margem Superior', RDcliente_Margem_Superior.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Margem Inferior', RDcliente_Margem_Inferior.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Margem Esquerda', RDcliente_Margem_Esquerda.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Margem Direita', RDcliente_Margem_Direita.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 1', RDcliente_Linha1.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Nome (Coluna 1)', RDcliente_Nome_col1.Text );
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Nome (Coluna 2)', RDcliente_Nome_col2.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Nome (Coluna 3)', RDcliente_Nome_col3.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 2', RDcliente_Linha2.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Endereço (Coluna 1)', RDcliente_Endereco_col1.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Endereço (Coluna 2)', RDcliente_Endereco_col2.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Endereço (Coluna 3)', RDcliente_Endereco_col3.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Número (Coluna 1)', RDcliente_Numero_col1.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Número (Coluna 2)', RDcliente_Numero_col2.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Número (Coluna 3)', RDcliente_Numero_col3.Text );
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'linha 3', RDcliente_Linha3.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Bairro (Coluna 1)', RDcliente_Bairro_col1.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Bairro (Coluna 2)', RDcliente_Bairro_col2.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Bairro (Coluna 3)', RDcliente_Bairro_col3.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'linha 4', RDcliente_Linha4.Text );
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Municipio (Coluna 1)', RDcliente_Municiopio_col1.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Municipio (Coluna 2)', RDcliente_Municipio_col2.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Municipio (Coluna 3)', RDcliente_Municipio_col3.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Estado (Coluna 1)', RDcliente_Estado_col1.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Estado (Coluna 2)', RDcliente_col2.Text );
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Estado (Coluna 3)', RDcliente_Estado_col3.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'linha 5', RDcliente_Linha5.Text );
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Cep (Coluna 1)', RDcliente_Cep_col1.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Cep (Coluna 2)', RDcliente_Cep_col2.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Cep (Coluna 3)', RDcliente_Cep_col3.Text);
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Salto de linhas', RDcliente_Salto_Linhas.Text );
  GravaIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Fonte', RDcliente_Fonte.Text);


    Application.MessageBox('Operação realizada com sucesso', PChar(Msg_Title), mb_IconInformation);
    Close;
  finally
    btnExecuta.Enabled := True;
    btnRetorna.Enabled := True;
  end;
end;

procedure TFrmConfig_Etiqueta_RDprint_Cliente.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig_Etiqueta_RDprint_Cliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConfig_Etiqueta_RDprint_Cliente.FormShow(Sender: TObject);
begin


  RDcliente_Colunas.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Colunas');
  RDcliente_Linhas_de_Etiquetas.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linhas de Etiquetas');
  RDcliente_Quantidade_de_Linhas.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Quantidade de Linhas');
  RDcliente_Quantidade_Colunas.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Quantidade de Colunas');
  RDcliente_Margem_Superior.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Margem Superior');
  RDcliente_Margem_Inferior.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Margem Inferior');
  RDcliente_Margem_Esquerda.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Margem Esquerda');
  RDcliente_Margem_Direita.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Margem Direita');
  RDcliente_Linha1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 1');
  RDcliente_Nome_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Nome (Coluna 1)');
  RDcliente_Nome_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Nome (Coluna 2)');
  RDcliente_Nome_col3.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Nome (Coluna 3)');
  RDcliente_Linha2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Linha 2');
  RDcliente_Endereco_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Endereço (Coluna 1)');
  RDcliente_Endereco_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Endereço (Coluna 2)');
  RDcliente_Endereco_col3.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Endereço (Coluna 3)');
  RDcliente_Numero_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Número (Coluna 1)');
  RDcliente_Numero_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Número (Coluna 2)');
  RDcliente_Numero_col3.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Número (Coluna 3)');
  RDcliente_Linha3.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'linha 3');
  RDcliente_Bairro_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Bairro (Coluna 1)');
  RDcliente_Bairro_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Bairro (Coluna 2)');
  RDcliente_Bairro_col3.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Bairro (Coluna 3)');
  RDcliente_Linha4.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'linha 4');
  RDcliente_Municiopio_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Municipio (Coluna 1)');
  RDcliente_Municipio_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Municipio (Coluna 2)');
  RDcliente_Municipio_col3.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Municipio (Coluna 3)');
  RDcliente_Estado_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Estado (Coluna 1)');
  RDcliente_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Estado (Coluna 2)');
  RDcliente_Estado_col3.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Estado (Coluna 3)');
  RDcliente_Linha5.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'linha 5');
  RDcliente_Cep_col1.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Cep (Coluna 1)');
  RDcliente_Cep_col2.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Cep (Coluna 2)');
  RDcliente_Cep_col3.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Cep (Coluna 3)');
  RDcliente_Salto_Linhas.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Salto de linhas');
  RDcliente_Fonte.Text := LeIni(Arq_Ini, 'Etiqueta RDPrint Cliente', 'Fonte');





end;

end.
