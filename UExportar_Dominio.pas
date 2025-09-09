unit UExportar_Dominio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, ExtCtrls, Mask,
  rxToolEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrm_ExportarDominio = class(TForm)
    Label1: TLabel;
    Dtmen: TDateEdit;
    Dtmai: TDateEdit;
    Bevel1: TBevel;
    btnExecuta: TBitBtn;
    btnRetorna: TBitBtn;
    COD_EMPRESA: TEdit;
    Label2: TLabel;
    QRel: TFDQuery;
    procedure btnExecutaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ExportarDominio: TFrm_ExportarDominio;

implementation
uses
  UPrincipal;

{$R *.dfm}

procedure TFrm_ExportarDominio.btnExecutaClick(Sender: TObject);
var
MyFile: TextFile;
begin
GravaIni(Arq_Ini, 'Contabilidade', 'Codigo Empresa Dominio Sistemas', COD_EMPRESA.Text);





AssignFile(MyFile, ExtractFilePath(ParamStr(0)) + 'Conta.Txt');
Rewrite(MyFile);

Writeln(MyFile, '01' +  SemMascara(FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString) + DateToStr(Dtmen.Date) + DateToStr(Dtmai.Date) + 'N' +
       '05' + '00000' + '1' + '17' ) ;
Writeln(MyFile, '02'   ) ;


Writeln(MyFile, '      C O N F E R Ê N C I A DE PRODUTOS         ');

CloseFile(MyFile);



end;

procedure TFrm_ExportarDominio.btnRetornaClick(Sender: TObject);
begin
 Close;
end;

procedure TFrm_ExportarDominio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TFrm_ExportarDominio.FormShow(Sender: TObject);
begin 
Cod_empresa.Text :=  LeIni(Arq_Ini, 'Contabilidade', 'Codigo Empresa Dominio Sistemas');
end;

end.
