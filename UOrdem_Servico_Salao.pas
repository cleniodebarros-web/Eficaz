unit UOrdem_Servico_Salao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, DBCtrls, rxCurrEdit, rxToolEdit,
  IBUpdateSQL, Math, QRCtrls, QuickRpt, RDprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmOrdem_Servico_Salao = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Consulta: TTabSheet;
    Manutencao: TTabSheet;
    DBGrid1: TDBGrid;
    DataTabela: TDataSource;
    btnRetorna: TBitBtn;
    Panel2: TPanel;
    btnPrior: TBitBtn;
    btnNext: TBitBtn;
    btnInsert: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnDiscard: TBitBtn;
    DT_ORDEM: TDateEdit;
    EMPRESA_ID: TCurrencyEdit;
    CLIENTE_ID: TCurrencyEdit;
    DataEmpresa: TDataSource;
    DataCliente: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DT_MOVIMENTO: TDateEdit;
    Panel3: TPanel;
    Label21: TLabel;
    StatusBar1: TStatusBar;
    Itens: TDBGrid;
    btnEmpresa: TSpeedButton;
    btnCliente: TSpeedButton;
    VALOR_ITENS: TRxCalcEdit;
    DataSub_Detail: TDataSource;
    Label22: TLabel;
    VALOR: TRxCalcEdit;
    Label24: TLabel;
    DESCONTO: TRxCalcEdit;
    STATUS: TComboBox;
    Dias: TTabSet;
    Label27: TLabel;
    COMISSAO: TRxCalcEdit;
    DataVendedor: TDataSource;
    Label4: TLabel;
    NOME_CLIENTE: TEdit;
    Label5: TLabel;
    ENDERECO: TEdit;
    Label7: TLabel;
    BAIRRO: TEdit;
    Label9: TLabel;
    MUNICIPIO: TEdit;
    btnPesquisa: TBitBtn;
    btnOrdem: TBitBtn;
    HORAS: TMaskEdit;
    Label6: TLabel;
    Label11: TLabel;
    NO_ORDEM: TCurrencyEdit;
    Label12: TLabel;
    TELEFONE: TMaskEdit;
    HORA_ATEND: TMaskEdit;
    PREV_ATEND: TDateEdit;
    Label18: TLabel;
    btnAgenda: TSpeedButton;
    Ordem: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText16: TQRDBText;
    QRShape2: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    Cabec: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape4: TQRShape;
    QRLabel29: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText18: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand2: TQRBand;
    QRLabel19: TQRLabel;
    QRShape5: TQRShape;
    QRExpr1: TQRExpr;
    QRShape6: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText20: TQRDBText;
    Check_List: TQuickRep;
    QRBand3: TQRBand;
    QRShape7: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText33: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText34: TQRDBText;
    QRShape8: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel39: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel40: TQRLabel;
    QRDBText35: TQRDBText;
    QRShape9: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel153: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel157: TQRLabel;
    QRLabel158: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel160: TQRLabel;
    QRLabel161: TQRLabel;
    QRLabel162: TQRLabel;
    QRLabel163: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel165: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel167: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel169: TQRLabel;
    QRLabel170: TQRLabel;
    QRLabel171: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel173: TQRLabel;
    QRLabel174: TQRLabel;
    QRLabel175: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel177: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    QRLabel180: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel182: TQRLabel;
    QRLabel183: TQRLabel;
    QRLabel184: TQRLabel;
    QRLabel185: TQRLabel;
    QRLabel186: TQRLabel;
    QRLabel187: TQRLabel;
    QRLabel188: TQRLabel;
    QRLabel189: TQRLabel;
    QRLabel190: TQRLabel;
    QRLabel191: TQRLabel;
    QRLabel192: TQRLabel;
    QRShape10: TQRShape;
    QRLabel193: TQRLabel;
    QRShape11: TQRShape;
    QRMemo1: TQRMemo;
    QRBand4: TQRBand;
    QRLabel194: TQRLabel;
    QRLabel195: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel196: TQRLabel;
    QRDBText39: TQRDBText;
    StatusBar2: TStatusBar;
    QRLabel197: TQRLabel;
    QRLabel198: TQRLabel;
    QRLabel199: TQRLabel;
    QRLabel200: TQRLabel;
    QRLabel201: TQRLabel;
    QRLabel202: TQRLabel;
    QRLabel203: TQRLabel;
    QRLabel204: TQRLabel;
    QRLabel205: TQRLabel;
    QRLabel206: TQRLabel;
    QRLabel207: TQRLabel;
    QRLabel208: TQRLabel;
    QRLabel209: TQRLabel;
    QRLabel210: TQRLabel;
    QRLabel211: TQRLabel;
    QRLabel212: TQRLabel;
    QRLabel213: TQRLabel;
    QRLabel214: TQRLabel;
    QRLabel215: TQRLabel;
    QRLabel216: TQRLabel;
    QRLabel217: TQRLabel;
    QRLabel218: TQRLabel;
    QRLabel219: TQRLabel;
    QRLabel220: TQRLabel;
    QRLabel221: TQRLabel;
    QRLabel222: TQRLabel;
    QRLabel223: TQRLabel;
    QRLabel224: TQRLabel;
    QRLabel225: TQRLabel;
    QRLabel226: TQRLabel;
    QRLabel227: TQRLabel;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRLabel228: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel229: TQRLabel;
    NUMERO: TEdit;
    QRLabel230: TQRLabel;
    QRDBText47: TQRDBText;
    Label31: TLabel;
    DT_FECHAMENTO: TDateEdit;
    VALOR_SERVICOS: TRxCalcEdit;
    VALOR_PECAS: TRxCalcEdit;
    DataAtendente: TDataSource;
    QRLabel231: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel232: TQRLabel;
    QRDBText49: TQRDBText;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    DBText4: TDBText;
    Label32: TLabel;
    H_FECHAMENTO: TMaskEdit;
    Check_List_Informatica: TQuickRep;
    QRBand6: TQRBand;
    QRLabel430: TQRLabel;
    QRLabel431: TQRLabel;
    QRDBText67: TQRDBText;
    QRLabel432: TQRLabel;
    QRDBText68: TQRDBText;
    QRBand5: TQRBand;
    QRShape12: TQRShape;
    QRLabel233: TQRLabel;
    QRLabel234: TQRLabel;
    QRLabel235: TQRLabel;
    QRLabel236: TQRLabel;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRLabel237: TQRLabel;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRLabel238: TQRLabel;
    QRLabel239: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel240: TQRLabel;
    QRDBText57: TQRDBText;
    QRShape13: TQRShape;
    QRLabel242: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel243: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel244: TQRLabel;
    QRDBText58: TQRDBText;
    QRShape14: TQRShape;
    QRLabel245: TQRLabel;
    QRLabel246: TQRLabel;
    QRLabel248: TQRLabel;
    QRLabel249: TQRLabel;
    QRLabel250: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabel251: TQRLabel;
    QRDBText60: TQRDBText;
    QRLabel252: TQRLabel;
    QRLabel253: TQRLabel;
    QRLabel254: TQRLabel;
    QRLabel255: TQRLabel;
    QRLabel256: TQRLabel;
    QRLabel257: TQRLabel;
    QRLabel264: TQRLabel;
    QRLabel265: TQRLabel;
    QRLabel266: TQRLabel;
    QRLabel267: TQRLabel;
    QRLabel268: TQRLabel;
    QRLabel269: TQRLabel;
    QRLabel270: TQRLabel;
    QRLabel271: TQRLabel;
    QRLabel272: TQRLabel;
    QRLabel273: TQRLabel;
    QRLabel274: TQRLabel;
    QRLabel275: TQRLabel;
    QRLabel276: TQRLabel;
    QRLabel277: TQRLabel;
    QRLabel279: TQRLabel;
    QRLabel280: TQRLabel;
    QRLabel281: TQRLabel;
    QRLabel282: TQRLabel;
    QRLabel283: TQRLabel;
    QRLabel284: TQRLabel;
    QRLabel285: TQRLabel;
    QRLabel286: TQRLabel;
    QRLabel287: TQRLabel;
    QRLabel288: TQRLabel;
    QRLabel289: TQRLabel;
    QRLabel290: TQRLabel;
    QRLabel291: TQRLabel;
    QRLabel292: TQRLabel;
    QRLabel293: TQRLabel;
    QRLabel294: TQRLabel;
    QRLabel295: TQRLabel;
    QRLabel296: TQRLabel;
    QRLabel297: TQRLabel;
    QRLabel298: TQRLabel;
    QRLabel299: TQRLabel;
    QRLabel300: TQRLabel;
    QRLabel301: TQRLabel;
    QRLabel302: TQRLabel;
    QRLabel303: TQRLabel;
    QRLabel304: TQRLabel;
    QRLabel305: TQRLabel;
    QRLabel306: TQRLabel;
    QRLabel307: TQRLabel;
    QRLabel308: TQRLabel;
    QRLabel309: TQRLabel;
    QRLabel311: TQRLabel;
    QRLabel312: TQRLabel;
    QRLabel314: TQRLabel;
    QRLabel315: TQRLabel;
    QRLabel316: TQRLabel;
    QRLabel317: TQRLabel;
    QRLabel318: TQRLabel;
    QRLabel321: TQRLabel;
    QRLabel322: TQRLabel;
    QRLabel324: TQRLabel;
    QRLabel325: TQRLabel;
    QRShape15: TQRShape;
    QRLabel397: TQRLabel;
    QRShape16: TQRShape;
    QRMemo2: TQRMemo;
    QRLabel398: TQRLabel;
    QRLabel400: TQRLabel;
    QRLabel401: TQRLabel;
    QRLabel402: TQRLabel;
    QRLabel409: TQRLabel;
    QRLabel412: TQRLabel;
    QRLabel413: TQRLabel;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRLabel429: TQRLabel;
    QRLabel258: TQRLabel;
    QRLabel259: TQRLabel;
    QRLabel260: TQRLabel;
    QRLabel261: TQRLabel;
    QRLabel262: TQRLabel;
    QRLabel263: TQRLabel;
    QRLabel241: TQRLabel;
    QRLabel247: TQRLabel;
    QRLabel278: TQRLabel;
    QRLabel310: TQRLabel;
    QRLabel313: TQRLabel;
    QRLabel319: TQRLabel;
    QRLabel320: TQRLabel;
    QRLabel323: TQRLabel;
    QRLabel326: TQRLabel;
    QRLabel327: TQRLabel;
    QRLabel328: TQRLabel;
    QRDBText69: TQRDBText;
    QRLabel329: TQRLabel;
    QCliente: TFDQuery;
    QVendedor: TFDQuery;
    QEmpresa: TFDQuery;
    IQuery: TFDQuery;
    QTabela: TFDQuery;
    QSub_Detail: TFDQuery;
    QAtendente: TFDQuery;
    QCheckList_Moto: TFDQuery;
    QServico: TFDQuery;
    QTributo: TFDQuery;
    QProduto: TFDQuery;
    USql_OrcItens: TFDUpdateSQL;
    PageControl2: TPageControl;
    OrcDados: TTabSheet;
    Label19: TLabel;
    Label23: TLabel;
    OBSERVACAO: TMemo;
    DT_RETORNO: TDateEdit;
    Label20: TLabel;
    GARANTIA: TEdit;
    QOrdem_Lacre: TFDQuery;
    DataOrdemLacre: TDataSource;
    Label26: TLabel;
    FUNCIONARIO: TCurrencyEdit;
    btnVendedor: TSpeedButton;
    DBText6: TDBText;
    Label13: TLabel;
    COND_PAGTO: TComboBox;
    btnParcelas: TSpeedButton;
    QVencimento: TFDQuery;
    QRel: TFDQuery;
    QUpdate: TFDQuery;
    QSearch: TFDQuery;
    Label14: TLabel;
    Resumo_Ag: TEdit;
    Label29: TLabel;
    C_CUSTO_ID: TCurrencyEdit;
    btnCentro_Custo: TSpeedButton;
    Panel4: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornaClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDiscardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure ManutencaoShow(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure EMPRESA_IDExit(Sender: TObject);
    procedure CLIENTE_IDExit(Sender: TObject);
    procedure EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure QSub_DetailNewRecord(DataSet: TDataSet);
    procedure ItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ItensKeyPress(Sender: TObject; var Key: Char);
    procedure QSub_DetailBeforePost(DataSet: TDataSet);
    procedure ItensColEnter(Sender: TObject);
    procedure ItensColExit(Sender: TObject);
    procedure ItensEnter(Sender: TObject);
    procedure ItensExit(Sender: TObject);
    procedure QSub_DetailBeforeDelete(DataSet: TDataSet);
    procedure DiasClick(Sender: TObject);
    procedure btnVendedorClick(Sender: TObject);
    procedure FUNCIONARIOExit(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ConsultaShow(Sender: TObject);
    procedure DT_ORDEMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOrdemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QSub_DetailBeforeEdit(DataSet: TDataSet);
    procedure DT_ORDEMEnter(Sender: TObject);
    procedure btnAgendaClick(Sender: TObject);
    procedure btnCheck_ListClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure btnCentro_CustoClick(Sender: TObject);
    procedure ATENDENTEExit(Sender: TObject);
    procedure QSub_DetailBeforeInsert(DataSet: TDataSet);
    procedure RDprint1BeforeNewPage(Sender: TObject; Pagina: Integer);
    procedure STATUSChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TIPO_ATENDIMENTOChange(Sender: TObject);
    procedure NO_ORDEMExit(Sender: TObject);
    procedure QSub_DetailAfterOpen(DataSet: TDataSet);
    procedure QOrdem_LacreBeforeDelete(DataSet: TDataSet);
    procedure QOrdem_LacreBeforeEdit(DataSet: TDataSet);
    procedure QOrdem_LacreBeforeInsert(DataSet: TDataSet);
    procedure QOrdem_LacreNewRecord(DataSet: TDataSet);
    procedure Grid_OrdemLacreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure btnParcelasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CmdSelect: String;
    CmdOrderBy: String;
    CmdSelectNull: String;
    procedure Botoes_Disable;
    procedure Botoes_Editing;
    procedure Botoes_Normal;
    procedure DetailSearch(Tabela: String);
    procedure Habilitar(Status: Boolean);
    procedure Insert;
    procedure Set_Campos(Vazio: Boolean);
    procedure Edit;
    function Validacao: Boolean;
    procedure ProdutoSearch;
    procedure ServicoSearch;
    procedure TributoSearch;
  end;

var
  FrmOrdem_Servico_Salao: TFrmOrdem_Servico_Salao;
  Operacao: String;
  ID: Integer;

implementation

uses
  UPrincipal, UData, UConsulta, UPesquisa, UAgenda_Ordem_Servico, UCheck_List_Moto,URel_ProdutosRetidosOs,UGerente,UCheck_List_informatica,UParcelas,UTrans_Venda_Estoque;

{$R *.dfm}

procedure TFrmOrdem_Servico_Salao.CLIENTE_IDExit(Sender: TObject);
begin
  DetailSearch('Cliente');
end;

procedure TFrmOrdem_Servico_Salao.ConsultaShow(Sender: TObject);
begin
  Botoes_Normal;
end;

procedure TFrmOrdem_Servico_Salao.ATENDENTEExit(Sender: TObject);
begin
  DetailSearch('Atendente');
end;

procedure TFrmOrdem_Servico_Salao.BitBtn1Click(Sender: TObject);
begin
TFrmRel_ProdutosRetidosOS.Create(Application);
end;

procedure TFrmOrdem_Servico_Salao.Botoes_Disable;
begin
  btnPrior.Enabled        := False;
  btnNext.Enabled         := False;
  btnInsert.Enabled       := False;
  btnEdit.Enabled         := False;
  btnDelete.Enabled       := False;
  btnSave.Enabled         := False;
  btnDiscard.Enabled      := False;
  btnRetorna.Enabled      := False;
  btnEmpresa.Enabled      := False;
  btnCliente.Enabled      := False;
  btnVendedor.Enabled     := False;
  btnPesquisa.Enabled     := False;
  btnOrdem.Enabled        := False;
  btnAgenda.Enabled       := False;
  btnCentro_Custo.Enabled := False;

end;

procedure TFrmOrdem_Servico_Salao.Botoes_Editing;
begin
  btnPrior.Enabled        := False;
  btnNext.Enabled         := False;
  btnInsert.Enabled       := False;
  btnEdit.Enabled         := False;
  btnDelete.Enabled       := False;
  btnSave.Enabled         := True;
  btnDiscard.Enabled      := True;
  btnRetorna.Enabled      := False;
  btnEmpresa.Enabled      := True;
  btnCliente.Enabled      := True;
  btnVendedor.Enabled     := True;
  btnPesquisa.Enabled     := False;
  btnOrdem.Enabled        := False;
  btnAgenda.Enabled       := False;
  btnCentro_Custo.Enabled := True;

end;

procedure TFrmOrdem_Servico_Salao.Botoes_Normal;
begin
  if not QTabela.Bof then
    btnPrior.Enabled := True
  else
    btnPrior.Enabled := False;

  if not QTabela.Eof then
    btnNext.Enabled := True
  else
    btnNext.Enabled := False;

  btnInsert.Enabled := True;

  if QTabela.FieldByName('COND_PAGTO').AsString = 'A PRAZO' then
    btnParcelas.Enabled := True
  else
    btnParcelas.Enabled := False;

  if not QTabela.IsEmpty then
  begin
    btnEdit.Enabled       := True;
    btnDelete.Enabled     := True;
    btnOrdem.Enabled      := True;
    btnAgenda.Enabled     := True;
  end
  else
  begin
    btnEdit.Enabled       := False;
    btnDelete.Enabled     := False;
    btnOrdem.Enabled      := False;
    btnAgenda.Enabled     := False;
  end;

  btnSave.Enabled         := False;
  btnDiscard.Enabled      := False;
  btnRetorna.Enabled      := True;
  btnEmpresa.Enabled      := False;
  btnCliente.Enabled      := False;
  btnVendedor.Enabled     := False;
  btnPesquisa.Enabled     := True;
  btnCentro_Custo.Enabled := False;
end;

procedure TFrmOrdem_Servico_Salao.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Empresa')) and (EMPRESA_ID.Text <> '') then
  begin
    QEmpresa.Close;

    QEmpresa.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);

    QEmpresa.Prepare;
    QEmpresa.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Cliente')) and (CLIENTE_ID.Text <> '') then
  begin
    QCliente.Close;

    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE_ID.Text);

    QCliente.Prepare;
    QCliente.Open;

    if not QCliente.IsEmpty then
    begin
      NOME_CLIENTE.Text := QCliente.FieldByName('NOME').AsString;
      ENDERECO.Text     := QCliente.FieldByName('ENDERECO').AsString;
      NUMERO.Text       := QCliente.FieldByName('NUMERO').AsString;
      BAIRRO.Text       := QCliente.FieldByName('BAIRRO').AsString;
      MUNICIPIO.Text    := QCliente.FieldByName('MUNICIPIO').AsString;
      TELEFONE.Text     := QCliente.FieldByName('DDD').AsString + QCliente.FieldByName('TELEFONE_1').AsString;
    end;
  end;

  if ((Tabela = '') or (Tabela = 'Vendedor')) and (FUNCIONARIO.Text <> '') then
  begin
    QVendedor.Close;

    QVendedor.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(FUNCIONARIO.Text);

    QVendedor.Prepare;
    QVendedor.Open;
  end;

end;

procedure TFrmOrdem_Servico_Salao.DiasClick(Sender: TObject);
begin
  if Dias.TabIndex <> (Dias.Tabs.Count - 1) then
  begin
    CmdSelectNull := 'WHERE (ORDEM_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy    := 'ORDER BY ORDEM_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := StrToDate(StrZero(IntToStr(Dias.TabIndex + 1), 2, 0) + '/' + Copy(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsString, 4, 7));
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end
  else
  begin
    CmdSelectNull := 'WHERE (ORDEM_ID IS NOT NULL) AND (DT_MOVIMENTO <= :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
    CmdOrderBy    := 'ORDER BY ORDEM_ID';

    QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

    QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
    QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  QTabela.Open;
  Botoes_Normal;
end;

procedure TFrmOrdem_Servico_Salao.DT_ORDEMEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmOrdem_Servico_Salao.DT_ORDEMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmOrdem_Servico_Salao.Habilitar(Status: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      TEdit(Temp).Enabled := Status;

    if Temp is TMaskEdit then
      TMaskEdit(Temp).Enabled := Status;

    if Temp is TDateEdit then
      TDateEdit(Temp).Enabled := Status;

    if Temp is TComboBox then
      TComboBox(Temp).Enabled := Status;

    if Temp is TCurrencyEdit then
      TCurrencyEdit(Temp).Enabled := Status;

    if Temp is TRxCalcEdit then
      TRxcalcEdit(Temp).Enabled := Status;

    if Temp is TMemo then
      TMemo(Temp).Enabled := Status;
  end;
end;

procedure TFrmOrdem_Servico_Salao.Insert;
var
I: Integer;
Temp: TComponent;
Sql, Par: String;
begin
  Sql := 'INSERT INTO ORDEM_SERVICO(';
  Par := '';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'INSERT INTO ORDEM_SERVICO(' then
        Sql := Sql + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TEdit(Temp).Name
      else
        Par := Par + ', :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'INSERT INTO ORDEM_SERVICO(' then
        Sql := Sql + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TMaskEdit(Temp).Name
      else
        Par := Par + ', :' + TMaskEdit(Temp).Name;
    end;

    if (Temp is TDateEdit) and (TDateEdit(Temp).Text <> '  /  /    ') then
    begin
      if Sql = 'INSERT INTO ORDEM_SERVICO(' then
        Sql := Sql + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name;
      if Par = ''  then
        Par := Par + ':' + TDateEdit(Temp).Name
      else
        Par := Par + ', :' + TDateEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'INSERT INTO ORDEM_SERVICO(' then
        Sql := Sql + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TComboBox(Temp).Name
      else
        Par := Par + ', :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'INSERT INTO ORDEM_SERVICO(' then
        Sql := Sql + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TCurrencyEdit(Temp).Name
      else
        Par := Par + ', :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'INSERT INTO ORDEM_SERVICO(' then
        Sql := Sql + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name;
      if Par = '' then
        Par := Par + ':' + TRxcalcEdit(Temp).Name
      else
        Par := Par + ', :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'INSERT INTO ORDEM_SERVICO(' then
        Sql := Sql + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + TMemo(Temp).Name;

      if (Par = '')  then
        Par := Par + ':' + TMemo(Temp).Name
      else
        Par := Par + ', :' + TMemo(Temp).Name;
    end;
  end;

  Sql := Sql + ') VALUES(' + Par + ')';

  

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

     if Temp is TDateEdit then
       Begin
         if TDateEdit(Temp).Text <> '  /  /    ' then
        //Query.ParamByName(TDateEdit(Temp).Name).AsDateTime := 01/01/01
        // Else
         IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;
       End;

    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat := TRxCalcEdit(Temp).Value;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr := TMemo(Temp).Lines.Text;
  end;

  IQuery.Prepare;
  IQuery.ExecSql;


  Habilitar(False);
end;

procedure TFrmOrdem_Servico_Salao.Edit;
var
I: Integer;
Temp: TComponent;
Sql: String;
begin
  Sql := 'UPDATE ORDEM_SERVICO SET ';

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
    begin
      if Sql = 'UPDATE ORDEM_SERVICO SET ' then
        Sql := Sql + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name
      else
        Sql := Sql + ', ' + TEdit(Temp).Name + ' = :' + TEdit(Temp).Name;
    end;

    if Temp is TMaskEdit then
    begin
      if Sql = 'UPDATE ORDEM_SERVICO SET ' then
        Sql := Sql + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name
      else
        Sql := Sql + ', ' + TMaskEdit(Temp).Name + ' = :' + TMaskEdit(Temp).Name;
    end;

    if (Temp is TDateEdit) and (TDateEdit(Temp).Text <> '  /  /    ') then
    begin
      if Sql = 'UPDATE ORDEM_SERVICO SET ' then
        Sql := Sql + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name
      else
        Sql := Sql + ', ' + TDateEdit(Temp).Name + ' = :' + TDateEdit(Temp).Name;
    end;

    if Temp is TComboBox then
    begin
      if Sql = 'UPDATE ORDEM_SERVICO SET ' then
        Sql := Sql + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name
      else
        Sql := Sql + ', ' + TComboBox(Temp).Name + ' = :' + TComboBox(Temp).Name;
    end;

    if Temp is TCurrencyEdit then
    begin
      if Sql = 'UPDATE ORDEM_SERVICO SET ' then
        Sql := Sql + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name
      else
        Sql := Sql + ', ' + TCurrencyEdit(Temp).Name + ' = :' + TCurrencyEdit(Temp).Name;
    end;

    if Temp is TRxCalcEdit then
    begin
      if Sql = 'UPDATE ORDEM_SERVICO SET ' then
        Sql := Sql + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name
      else
        Sql := Sql + ', ' + TRxCalcEdit(Temp).Name + ' = :' + TRxCalcEdit(Temp).Name;
    end;

    if Temp is TMemo then
    begin
      if Sql = 'UPDATE ORDEM_SERVICO SET ' then
        Sql := Sql + TMemo(Temp).Name + ' = :' + TMemo(Temp).Name
      else
        Sql := Sql + ', ' + Tmemo(Temp).Name + ' = :' + TMemo(Temp).Name;
    end;
  end;

  Sql := Sql + ' WHERE (ORDEM_ID = :ID)';

  

  IQuery.Sql.Clear;
  IQuery.Sql.Add(Sql);

  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Temp is TEdit then
      IQuery.ParamByName(TEdit(Temp).Name).AsString := TEdit(Temp).Text;

    if Temp is TMaskEdit then
      IQuery.ParamByName(TMaskEdit(Temp).Name).AsString := TMaskEdit(Temp).Text;

     if Temp is TDateEdit then
       Begin
         if TDateEdit(Temp).Text <> '  /  /    ' then
         //IQuery.ParamByName(TDateEdit(Temp).Name).Clear
         //Else
         IQuery.ParamByName(TDateEdit(Temp).Name).AsDateTime := TDateEdit(Temp).Date;
       End;


    if Temp is TComboBox then
      IQuery.ParamByName(TComboBox(Temp).Name).AsString    := TComboBox(Temp).Text;

    if Temp is TCurrencyEdit then
      IQuery.ParamByName(TCurrencyEdit(Temp).Name).AsFloat := TCurrencyEdit(Temp).Value;

    if Temp is TRxCalcEdit then
      IQuery.ParamByName(TRxCalcEdit(Temp).Name).AsFloat   := TRxCalcEdit(Temp).Value;

    if Temp is TMemo then
      IQuery.ParamByName(TMemo(Temp).Name).AsByteStr       := TMemo(Temp).Lines.Text;
  end;

  IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('ORDEM_ID').AsInteger;

  IQuery.Prepare;
  IQuery.ExecSql;



  QTabela.Close;
  QTabela.Open;
  QTabela.Locate('ORDEM_ID', ID, [loCaseInsensitive]);
  Habilitar(False);
end;

procedure TFrmOrdem_Servico_Salao.ProdutoSearch;
begin
  QProduto.Close;
  QProduto.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('CODIGO_ITEM').AsInteger;
  QProduto.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
  QProduto.Prepare;
  QProduto.Open;
end;

procedure TFrmOrdem_Servico_Salao.ServicoSearch;
begin
  QServico.Close;
  QServico.ParamByName('SERVICO_ID').AsInteger := QSub_Detail.FieldByName('CODIGO_ITEM').AsInteger;
  QServico.Prepare;
  QServico.Open;
end;

procedure TFrmOrdem_Servico_Salao.TIPO_ATENDIMENTOChange(Sender: TObject);
begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TABELAS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');

  IQuery.ParamByName('TIPO_TABELA').AsString := 'S';

  IQuery.Prepare;
  IQuery.Open;

  STATUS.Items.Clear;

  IQuery.First;
  while not IQuery.Eof do
  begin
    STATUS.Items.Add(Copy(IQuery.FieldByName('DESCRICAO').AsString, 1, 15));

    Application.ProcessMessages;
    IQuery.Next;
  end;
end;

procedure TFrmOrdem_Servico_Salao.TributoSearch;
begin
  QTributo.Close;
  QTributo.ParamByName('TRIBUTO_ID').AsInteger := QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger;
  QTributo.Prepare;
  QTributo.Open;
end;

procedure TFrmOrdem_Servico_Salao.EMPRESA_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa');
end;

procedure TFrmOrdem_Servico_Salao.EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = EMPRESA_ID) then
    btnEmpresaClick(Self);

  if (Key = Vk_F7) and (Sender = CLIENTE_ID) then
    btnClienteClick(Self);

  if (Key = Vk_F7) and (Sender = FUNCIONARIO) then
    btnVendedorClick(Self);

  if (Key = Vk_F7) and (Sender = C_CUSTO_ID) then
    btnCentro_CustoClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

function TFrmOrdem_Servico_Salao.Validacao: Boolean;
begin
  Result := False;

  CLIENTE_ID.Color       := clWindow;
  EMPRESA_ID.Color       := clWindow;
  STATUS.Color           := clWindow;
  FUNCIONARIO.Color      := clWindow;
  C_CUSTO_ID.Color       := clWindow;
  COND_PAGTO.Color  := clWindow;

  if COND_PAGTO.Text = 'A PRAZO' then
  begin
   if Cliente_id.Value > 0 then
   Begin
    if QCliente.IsEmpty then
    begin
      Application.MessageBox('Cliente inexistente', PChar(Msg_Title), mb_IconSTop);
      CLIENTE_ID.Color := clYellow;
      CLIENTE_ID.SetFocus;
      exit;
    end
    else
    begin
      if QCliente.FieldByName('BLOQUEADO').AsString = 'SIM' then
        begin
        Application.MessageBox('Cliente bloqueado', PChar(Msg_Title), mb_IconSTop);
        CLIENTE_ID.Color := clYellow;
        CLIENTE_ID.SetFocus;
        exit;
        end;
    end;

    if FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger > 0 then
    Begin
      QVencimento.Close;
      QVencimento.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE_ID.Text);
      QVencimento.ParamByName('DT_VENCIMENTO').AsDateTime := Date - FrmPrincipal.Config.FieldByName('CARENCIA').AsInteger;
      QVencimento.Prepare;
      QVencimento.Open;

      if not QVencimento.IsEmpty then
      Begin
       Application.MessageBox('Cliente Possui Débitos vencidos e não quitados favor verificar.', PChar(Msg_Title), mb_IconStop);
       CLIENTE_ID.Color := clYellow;
       CLIENTE_ID.SetFocus;
       exit;
      End;
    End;
   End;
  end;


  if CLIENTE_ID.Value > 0 then
  begin
    if QCliente.IsEmpty then
    begin
      Application.MessageBox('Cliente inexistente', PChar(Msg_Title), mb_IconStop);

      CLIENTE_ID.Color := clYellow;
      CLIENTE_ID.SetFocus;

      exit;
    end;
  end;

  if QEmpresa.IsEmpty then
  begin
    Application.MessageBox('Empresa inexistente', PChar(Msg_Title), mb_IconStop);

    EMPRESA_ID.Color := clYellow;
    EMPRESA_ID.SetFocus;

    exit;
  end;

  if FUNCIONARIO.Value > 0 then
  begin
    if QVendedor.IsEmpty then
    begin
      Application.MessageBox('Técnico inexistente', PChar(Msg_Title), mb_IconStop);

      FUNCIONARIO.Color := clYellow;
      FUNCIONARIO.SetFocus;

      exit;
    end;
  end;


  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TABELAS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');
  IQuery.Sql.Add('AND (DESCRICAO = :DESCRICAO)');

  IQuery.ParamByName('TIPO_TABELA').AsString := 'S';
  IQuery.ParamByName('DESCRICAO').AsString   := STATUS.Text;

  IQuery.Prepare;
  IQuery.Open;

  if IQuery.IsEmpty AND (STATUS.Text <> 'FATURADO') then
  begin
    Application.MessageBox('Cond. de Pagto. inválida', PChar(Msg_Title), mb_IconStop);

    STATUS.Color := clYellow;
    STATUS.SetFocus;

    exit;
  end;


  if (Status.Text = 'FATURADO')  then
    Begin
        if FrmGerente = Nil then
        begin
          Application.CreateForm(TFrmGerente, FrmGerente);
          try
            if FrmGerente.ShowModal = mrOK then
            begin
              if FrmGerente.QOperador.FieldByName('STATUS_OS').AsString <> 'True' then
              begin
               Application.MessageBox('Operador sem permissão para alterar status O.S.', 'Ordem de Serviço Salão', MB_IconStop + MB_OK);
               Status.Text := 'ABERTA';
               dt_fechamento.Text := '  /  /    ';
               H_fechamento.Text  := '  :  ';
               Status.SetFocus;
               Exit;
              end;
            Result := True;
            end
            else
              Begin
               Status.Text := 'ABERTA';
               dt_fechamento.Text := '  /  /    ';
               H_fechamento.Text  := '  :  ';
               Status.SetFocus;
               Exit;
              End;
          finally

          end;
        end
        else
        begin
          if FrmGerente.ShowModal = mrOK then
          begin
            if FrmGerente.QOperador.FieldByName('STATUS_OS').AsString <> 'True' then
            begin
               Application.MessageBox('Operador sem permissão para alterar status O.S.', 'Ordem de Serviço Salão', MB_IconStop + MB_OK);
               Status.Text := 'ABERTA';
              dt_fechamento.Text := '  /  /    ';
              H_fechamento.Text  := '  :  ';
               Status.SetFocus;
               Exit;
            end;
          Result := True;
          end
          else
           Begin
            Status.Text := 'ABERTA';
            dt_fechamento.Text := '  /  /    ';
            H_fechamento.Text  := '  :  ';
            Status.SetFocus;
            Exit;
           End;
        end;
    End;
  if No_ordem.Value = 0 then
  Begin
   Application.MessageBox('Favor definir prioridade para a Ordem de Serviço.', 'Ordem de Serviço', MB_IconStop + MB_OK);
   No_Ordem.SetFocus;
   No_Ordem.Color := clYellow;
   Exit;
  End;
  Result := True;
end;

procedure TFrmOrdem_Servico_Salao.FUNCIONARIOExit(Sender: TObject);
begin
  DetailSearch('Vendedor');
end;

procedure TFrmOrdem_Servico_Salao.Grid_OrdemLacreKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F4) and (QSub_Detail.State = dsBrowse) and (not QSub_Detail.IsEmpty) then
    QSub_Detail.Delete;

if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QSub_Detail.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmOrdem_Servico_Salao.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
 { if NO_ORDEM.value = 0 then
  Begin
    Label33.Visible := False;
    Label33.Caption := '';
  End;
  if NO_ORDEM.Value = 1 then
  Begin
    Label33.Visible := True;
    Label33.Caption := 'A';
  End;
  if NO_ORDEM.Value = 2 then
  Begin
    Label33.Visible := True;
    Label33.Caption := 'B';
  End;
  if NO_ORDEM.Value = 3 then
  Begin
    Label33.Visible := True;
    Label33.Caption := 'C';
  End; }
  //OrcDados.Show;

end;

procedure TFrmOrdem_Servico_Salao.NO_ORDEMExit(Sender: TObject);
begin
if No_ordem.Value > 3 Then
  Begin
  Application.MessageBox('Níveis válidos: 1,2,3.','Ordem de Serviço', MB_IconStop + MB_OK);
  No_ordem.Color := clYellow;
  No_ordem.SetFocus;
  End;

 { if NO_ORDEM.value = 0 then
  Begin
    Label33.Visible := False;
    Label33.Caption := '';
  End
  ELSE if NO_ORDEM.value = 1 then
  Begin
    Label33.Visible := True;
    Label33.Caption := 'A';
  End
  Else if NO_ORDEM.Value = 2 then
  Begin
    Label33.Visible := True;
    Label33.Caption := 'B';
  End
  Else if NO_ORDEM.Value = 3 then
  Begin
    Label33.Visible := True;
    Label33.Caption := 'C';
  End;
   }
end;

procedure TFrmOrdem_Servico_Salao.QOrdem_LacreBeforeDelete(DataSet: TDataSet);
begin
if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDNO then
    abort;
end;

procedure TFrmOrdem_Servico_Salao.QOrdem_LacreBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

end;

procedure TFrmOrdem_Servico_Salao.QOrdem_LacreBeforeInsert(DataSet: TDataSet);
begin
   if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;
end;

procedure TFrmOrdem_Servico_Salao.QOrdem_LacreNewRecord(DataSet: TDataSet);
begin
DataSet['ORDEM_ID']     := QTabela.FieldByName('ORDEM_ID').AsInteger;
end;

procedure TFrmOrdem_Servico_Salao.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
          if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Automóvel' then
             QRLabel23.Caption := 'Assinatura do Mecânico ______________________________________________';
end;

procedure TFrmOrdem_Servico_Salao.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if QCheckList_Moto.FieldByName('CHECK_LIST').AsInteger = 0 then
    QRLabel398.Left := 162
  else if QCheckList_Moto.FieldByName('CHECK_LIST').AsInteger = 1 then
    QRLabel398.Left := 234
  else if QCheckList_Moto.FieldByName('CHECK_LIST').AsInteger = 2 then
    QRLabel398.Left := 306
  else
    QRLabel197.Enabled := False;

  if QCheckList_Moto.FieldByName('ESTADO_PINTURA').AsInteger = 0 then
    QRLabel400.Left := 162
  else if QCheckList_Moto.FieldByName('ESTADO_PINTURA').AsInteger = 1 then
    QRLabel400.Left := 234
  else if QCheckList_Moto.FieldByName('ESTADO_PINTURA').AsInteger = 2 then
    QRLabel400.Left := 306
  else
    QRLabel400.Enabled := False;

  if QCheckList_Moto.FieldByName('TAMPA_LAT_ESQ').AsInteger = 0 then
    QRLabel401.Left := 162
  else if QCheckList_Moto.FieldByName('TAMPA_LAT_ESQ').AsInteger = 1 then
    QRLabel401.Left := 234
  else if QCheckList_Moto.FieldByName('TAMPA_LAT_ESQ').AsInteger = 2 then
    QRLabel401.Left := 306
  else
    QRLabel401.Enabled := False;

  if QCheckList_Moto.FieldByName('TAMPA_LAT_DIR').AsInteger = 0 then
    QRLabel402.Left := 162
  else if QCheckList_Moto.FieldByName('TAMPA_LAT_DIR').AsInteger = 1 then
    QRLabel402.Left := 234
  else if QCheckList_Moto.FieldByName('TAMPA_LAT_DIR').AsInteger = 2 then
    QRLabel402.Left := 306
  else
    QRLabel402.Enabled := False;

  if QCheckList_Moto.FieldByName('TANQUE_COMB').AsInteger = 0 then
    QRLabel278.Left := 514
  else if QCheckList_Moto.FieldByName('TANQUE_COMB').AsInteger = 1 then
    QRLabel278.Left := 587
  else if QCheckList_Moto.FieldByName('TANQUE_COMB').AsInteger = 2 then
    QRLabel278.Left := 659
  else
    QRLabel278.Enabled := False;

  if QCheckList_Moto.FieldByName('PARALAMA_DIANT').AsInteger = 0 then
    QRLabel310.Left := 514
  else if QCheckList_Moto.FieldByName('PARALAMA_DIANT').AsInteger = 1 then
    QRLabel310.Left := 587
  else if QCheckList_Moto.FieldByName('PARALAMA_DIANT').AsInteger = 2 then
    QRLabel310.Left := 659
  else
    QRLabel310.Enabled := False;

  if QCheckList_Moto.FieldByName('RETROVISOR_ESQ').AsInteger = 0 then
    QRLabel313.Left := 514
  else if QCheckList_Moto.FieldByName('RETROVISOR_ESQ').AsInteger = 1 then
    QRLabel313.Left := 587
  else if QCheckList_Moto.FieldByName('RETROVISOR_ESQ').AsInteger = 2 then
    QRLabel313.Left := 659
  else
    QRLabel313.Enabled := False;

  if QCheckList_Moto.FieldByName('RETROVISOR_DIR').AsInteger = 0 then
    QRLabel319.Left := 514
  else if QCheckList_Moto.FieldByName('RETROVISOR_DIR').AsInteger = 1 then
    QRLabel319.Left := 587
  else if QCheckList_Moto.FieldByName('RETROVISOR_DIR').AsInteger = 2 then
    QRLabel319.Left := 659
  else
    QRLabel319.Enabled := False;

  if QCheckList_Moto.FieldByName('PISCA_TRASEIRO').AsInteger = 0 then
    QRLabel320.Left := 514
  else if QCheckList_Moto.FieldByName('PISCA_TRASEIRO').AsInteger = 1 then
    QRLabel320.Left := 587
  else if QCheckList_Moto.FieldByName('PISCA_TRASEIRO').AsInteger = 2 then
    QRLabel320.Left := 659
  else
    QRLabel320.Enabled := False;

  if QCheckList_Moto.FieldByName('PISCA_DIANTEIRO').AsInteger = 0 then
    QRLabel323.Left := 514
  else if QCheckList_Moto.FieldByName('PISCA_DIANTEIRO').AsInteger = 1 then
    QRLabel323.Left := 587
  else if QCheckList_Moto.FieldByName('PISCA_DIANTEIRO').AsInteger = 2 then
    QRLabel323.Left := 669
  else
    QRLabel323.Enabled := False;

  if QCheckList_Moto.FieldByName('FAROLETE').AsInteger = 0 then
    QRLabel409.Left := 160
  else if QCheckList_Moto.FieldByName('FAROLETE').AsInteger = 1 then
    QRLabel409.Left := 292
  else if QCheckList_Moto.FieldByName('FAROLETE').AsInteger = 2 then
    QRLabel409.Left := 453
  else
    QRLabel409.Enabled := False;

  if QCheckList_Moto.FieldByName('MANETE').AsInteger = 0 then
    QRLabel326.Left := 514
  else if QCheckList_Moto.FieldByName('MANETE').AsInteger = 1 then
    QRLabel326.Left := 587
  else if QCheckList_Moto.FieldByName('MANETE').AsInteger = 2 then
    QRLabel326.Left := 659
  else
    QRLabel326.Enabled := False;

  if QCheckList_Moto.FieldByName('MANICOTO').AsInteger = 0 then
    QRLabel327.Left := 514
  else if QCheckList_Moto.FieldByName('MANICOTO').AsInteger = 1 then
    QRLabel327.Left := 587
  else if QCheckList_Moto.FieldByName('MANICOTO').AsInteger = 2 then
    QRLabel327.Left := 659
  else
    QRLabel327.Enabled := False;

  if QCheckList_Moto.FieldByName('JOGO_FERRAMENTA').AsInteger = 0 then
    QRLabel412.Left := 162
  else if QCheckList_Moto.FieldByName('JOGO_FERRAMENTA').AsInteger = 1 then
    QRLabel412.Left := 264
  else
    QRLabel412.Enabled := False;

  if QCheckList_Moto.FieldByName('ELASTICOS').AsInteger = 0 then
    QRLabel413.Left := 162
  else if QCheckList_Moto.FieldByName('ELASTICOS').AsInteger = 1 then
    QRLabel413.Left := 264
  else
    QRLabel413.Enabled := False;

  if QCheckList_Moto.FieldByName('REVISAO').AsInteger = 0 then
    QRLabel214.Left := 562
  else if QCheckList_Moto.FieldByName('REVISAO').AsInteger = 1 then
    QRLabel214.Left := 640
  else
    QRLabel214.Enabled := False;

  if QCheckList_Moto.FieldByName('LAVAGEM').AsInteger = 0 then
    QRLabel215.Left := 562
  else if QCheckList_Moto.FieldByName('LAVAGEM').AsInteger = 1 then
    QRLabel215.Left := 640
  else
    QRLabel215.Enabled := False;

  if QCheckList_Moto.FieldByName('TROCA_TRANSMISSAO').AsInteger = 0 then
    QRLabel216.Left := 562
  else if QCheckList_Moto.FieldByName('TROCA_TRANSMISSAO').AsInteger = 1 then
    QRLabel216.Left := 640
  else
    QRLabel216.Enabled := False;

  if QCheckList_Moto.FieldByName('TROCA_DIRECAO').AsInteger = 0 then
    QRLabel217.Left := 562
  else if QCheckList_Moto.FieldByName('TROCA_DIRECAO').AsInteger = 1 then
    QRLabel217.Left := 640
  else
    QRLabel217.Enabled := False;

  if QCheckList_Moto.FieldByName('TROCA_RET_BENGALA').AsInteger = 0 then
    QRLabel218.Left := 562
  else if QCheckList_Moto.FieldByName('TROCA_RET_BENGALA').AsInteger = 1 then
    QRLabel218.Left := 640
  else
    QRLabel218.Enabled := False;

  if QCheckList_Moto.FieldByName('TROCA_ROL_DIANT').AsInteger = 0 then
    QRLabel219.Left := 562
  else if QCheckList_Moto.FieldByName('TROCA_ROL_DIANT').AsInteger = 1 then
    QRLabel219.Left := 640
  else
    QRLabel219.Enabled := False;

  if QCheckList_Moto.FieldByName('TROCA_ROL_TRAS').AsInteger = 0 then
    QRLabel220.Left := 562
  else if QCheckList_Moto.FieldByName('TROCA_ROL_TRAS').AsInteger = 1 then
    QRLabel220.Left := 640
  else
    QRLabel220.Enabled := False;

  if QCheckList_Moto.FieldByName('TROCA_RET_EMBREAGEM').AsInteger = 0 then
    QRLabel221.Left := 562
  else if QCheckList_Moto.FieldByName('TROCA_RET_EMBREAGEM').AsInteger = 1 then
    QRLabel221.Left := 640
  else
    QRLabel221.Enabled := False;

  if QCheckList_Moto.FieldByName('MOTOR').AsInteger = 0 then
    QRLabel222.Left := 562
  else if QCheckList_Moto.FieldByName('MOTOR').AsInteger = 1 then
    QRLabel222.Left := 640
  else
    QRLabel222.Enabled := False;

  if QCheckList_Moto.FieldByName('TROCA_PATIM_DIANT').AsInteger = 0 then
    QRLabel223.Left := 562
  else if QCheckList_Moto.FieldByName('TROCA_PATIM_DIANT').AsInteger = 1 then
    QRLabel223.Left := 640
  else
    QRLabel223.Enabled := False;

  if QCheckList_Moto.FieldByName('TROCA_PATIM_TRAS').AsInteger = 0 then
    QRLabel224.Left := 562
  else if QCheckList_Moto.FieldByName('TROCA_PATIM_TRAS').AsInteger = 1 then
    QRLabel224.Left := 640
  else
    QRLabel224.Enabled := False;

  if QCheckList_Moto.FieldByName('TROCA_AGULHA_CARB').AsInteger = 0 then
    QRLabel225.Left := 562
  else if QCheckList_Moto.FieldByName('TROCA_AGULHA_CARB').AsInteger = 1 then
    QRLabel225.Left := 640
  else
    QRLabel225.Enabled := False;

  if QCheckList_Moto.FieldByName('TROCA_PECAS').AsInteger = 0 then
    QRLabel226.Left := 562
  else if QCheckList_Moto.FieldByName('TROCA_PECAS').AsInteger = 1 then
    QRLabel226.Left := 640
  else
    QRLabel226.Enabled := False;

  if QCheckList_Moto.FieldByName('TROCA_ACESSORIOS').AsInteger = 0 then
    QRLabel227.Left := 562
  else if QCheckList_Moto.FieldByName('TROCA_ACESSORIOS').AsInteger = 1 then
    QRLabel227.Left := 640
  else
    QRLabel227.Enabled := False;
end;

procedure TFrmOrdem_Servico_Salao.QSub_DetailAfterOpen(DataSet: TDataSet);
begin
TFloatField(QSub_Detail.FieldByName('VR_DESCONTO')).DisplayFormat := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('VR_TOTAL')).DisplayFormat    := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('QUANTIDADE')).DisplayFormat  := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('VR_UNITARIO')).DisplayFormat := '#,##0.00';
end;

procedure TFrmOrdem_Servico_Salao.QSub_DetailBeforeDelete(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDNO then
    abort;
end;

procedure TFrmOrdem_Servico_Salao.QSub_DetailBeforeEdit(DataSet: TDataSet);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;
end;

procedure TFrmOrdem_Servico_Salao.QSub_DetailBeforeInsert(DataSet: TDataSet);
begin
  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;
end;

procedure TFrmOrdem_Servico_Salao.QSub_DetailBeforePost(DataSet: TDataSet);
var
Cst: String;
Promocao: Boolean;
begin
  Promocao := False;

  ProdutoSearch;
  TributoSearch;

  if (QSub_Detail.FieldByName('TP_PROD_SERV').AsString <> 'P') and (QSub_Detail.FieldByName('TP_PROD_SERV').AsString <> 'S') then
  begin
    Application.MessageBox('Tipo Produto/Serviço inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 0;
    abort;
  end;

  if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
  begin
    if QProduto.IsEmpty then
    begin
      Application.MessageBox('Produto inexistente', PChar(Msg_Title), mb_IconStop);
      Itens.SelectedIndex := 1;
      abort;
    end;
  end;

  if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'S' then
  begin
    if QServico.IsEmpty then
    begin
      Application.MessageBox('Serviço inexistente', PChar(Msg_Title), mb_IconStop);
      Itens.SelectedIndex := 1;
      abort;
    end;
  end;

  if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
  begin
    if QTributo.IsEmpty then
    begin
      Application.MessageBox('Tributo inexistente', PChar(Msg_Title), mb_IconStop);
      Itens.SelectedIndex := 3;
      abort;
    end;
  end;

  if (QSub_Detail.FieldByName('QUANTIDADE').AsFloat <= 0) or (QSub_Detail.FieldByName('QUANTIDADE').AsFloat > 99999) then
  begin
    Application.MessageBox('Quantidade inválida', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 7;
    abort;
  end;

  if QSub_Detail.FieldByName('VR_UNITARIO').AsFloat <= 0 then
  begin
    Application.MessageBox('Vr. Unitário inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 8;
    abort;
  end;

  if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
  begin
    if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime >= QProduto.FieldByName('PROMO_INICIAL').AsDateTime) and (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime <= QProduto.FieldByName('PROMO_FINAL').AsDateTime) then
    begin
      Promocao := True;

      if (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat <> QProduto.FieldByName('PRECO_PROMOCAO').AsFloat) then
      begin
        Application.MessageBox('Preço inválido. Produto em promoção', PChar(Msg_Title), mb_IconStop);
        Itens.SelectedIndex := 8;
        abort;
      end;
    end;

    if (QProduto.FieldByName('PRECO_ATACADO').AsFloat > 0.01) and (QProduto.FieldByName('PRECO_ATACADO').AsFloat < QProduto.FieldByName('PRECO_VAREJO').AsFloat) and (LeIni(Arq_Ini, 'Sistema', 'Comparar Preço Atacado x Preço Varejo') = 'True') and (not Promocao) then
    begin
      if (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat < QProduto.FieldByName('PRECO_ATACADO').AsFloat) or (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat > QProduto.FieldByName('PRECO_VAREJO').AsFloat) then
      begin
        Application.MessageBox('Preço fora da faixa determinado pelo Sistema', PChar(Msg_Title), mb_IconStop);
        Itens.SelectedIndex := 8;
        abort;
      end;
    end;
  end;

  if (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat < 0) or (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat >= QSub_Detail.FieldByName('VR_UNITARIO').AsFloat) then
  begin
    Application.MessageBox('Vr. Desconto inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 9;
    abort;
  end;

  if (Promocao) and (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > 0) then
  begin
    Application.MessageBox('Vr. Desconto inválido. Produto em promoção', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 9;
    abort;
  end;

  if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
  begin
    if (QProduto.FieldByName('DESC_MAXIMO').AsFloat > 0) and (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > QProduto.FieldByName('DESC_MAXIMO').AsFloat) then
    begin
      Application.MessageBox('Vr. Desconto não pode ser maior do que o desconto máximo permitido para o item', PChar(Msg_Title), mb_IconStop);
      Itens.SelectedIndex := 9;
      abort;
    end;
  end;

  if QSub_Detail.FieldByName('VR_TOTAL').AsFloat <= 0 then
  begin
    Application.MessageBox('Vr. Total inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 10;
    abort;
  end;

 { if QSub_Detail.FieldByName('VR_IPI').AsFloat < 0 then
  begin
    Application.MessageBox('Vr. IPI inválido', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 6;
    abort;
  end;

  if (QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat < 0) or (QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat > 100) then
  begin
    Application.MessageBox('Alíquota de ICMS inválida', PChar(Msg_Title), mb_IconStop);
    Itens.SelectedIndex := 5;
    abort;
  end;

  if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
  begin
    if (Copy(QSub_Detail.FieldByName('CST').AsString, 1, 1) < '0') or (Copy(QSub_Detail.FieldByName('CST').AsString, 1, 1) > '2') then
    begin
      Application.MessageBox('Código CST inválido', PChar(Msg_Title), mb_IconStop);
      Itens.SelectedIndex := 4;
      abort;
    end;

    Cst := Copy(QSub_Detail.FieldByName('CST').AsString, 2, 2);

    if (Cst <> '00') and (Cst <> '10') and (Cst <> '20') and (Cst <> '30') and (Cst <> '40') and (Cst <> '41') and (Cst <> '50') and (Cst <> '51') and (Cst <> '60') then
    begin
      Application.MessageBox('Código CST inválido', PChar(Msg_Title), mb_IconStop);
      Itens.SelectedIndex := 4;
      abort;
    end;
  end; }

  QSub_Detail.FieldByName('VR_UNITARIO').AsFloat := RoundTo(((QSub_Detail.FieldByName('VR_TOTAL').AsFloat + (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat)) / QSub_Detail.FieldByName('QUANTIDADE').AsFloat), -2);
end;

procedure TFrmOrdem_Servico_Salao.QSub_DetailNewRecord(DataSet: TDataSet);
begin
  DataSet['ORDEM_ID']     := QTabela.FieldByName('ORDEM_ID').AsInteger;
  DataSet['TP_PROD_SERV'] := 'S';
end;

procedure TFrmOrdem_Servico_Salao.RDprint1BeforeNewPage(Sender: TObject;
  Pagina: Integer);
begin
  RDprint1.Imp(63, 01, '================================================================================');
  RDprint1.Imp(64, 01, 'Eficaz Automação e Sistemas Ltda');
  RDprint1.ImpDir(64, 33, 80, 'http://www.eficazautomacao.com.br', []);
  RDprint1.Imp(66,01,' ');
end;

procedure TFrmOrdem_Servico_Salao.Set_Campos(Vazio: Boolean);
var
I: Integer;
Temp: TComponent;
begin
  for I := 0 to (ComponentCount - 1) do
  begin
    Temp := Components[I];

    if Vazio then
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := '';

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := '';

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := '';

      if Temp is TComboBox then
        TComboBox(Temp).Text := '';

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := 0;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := 0;

      if Temp is TMemo then
        TMemo(Temp).Lines.Text := '';

      DBText4.Visible := False;

      QSub_Detail.Close;

      QSub_Detail.ParamByName('ORDEM_ID').AsInteger := 0;

      QSub_Detail.Prepare;
      QSub_Detail.Open;

      QOrdem_Lacre.Close;

      QOrdem_Lacre.ParamByName('ORDEM_ID').AsInteger := 0;

      QOrdem_Lacre.Prepare;
      QOrdem_Lacre.Open;

    end
    else
    begin
      if Temp is TEdit then
        TEdit(Temp).Text := QTabela.FieldByName(TEdit(Temp).Name).AsString;

      if Temp is TMaskEdit then
        TMaskEdit(Temp).Text := QTabela.FieldByName(TMaskEdit(Temp).Name).AsString;

      if Temp is TDateEdit then
        TDateEdit(Temp).Text := QTabela.FieldByName(TDateEdit(Temp).Name).AsString;

      if Temp is TComboBox then
        TComboBox(Temp).Text := QTabela.FieldByName(TComboBox(Temp).Name).AsString;

      if Temp is TCurrencyEdit then
        TCurrencyEdit(Temp).Value := QTabela.FieldByName(TCurrencyEdit(Temp).Name).AsFloat;

      if Temp is TRxCalcEdit then
        TRxCalcEdit(Temp).Value := QTabela.FieldByName(TRxCalcEdit(Temp).Name).AsFloat;

      if Temp is TMemo then
        TMemo(Temp).Lines.Text := QTabela.FieldByName(Tmemo(Temp).Name).AsString;

        DBText4.Visible := True;

      QSub_Detail.Close;

      QSub_Detail.ParamByName('ORDEM_ID').AsInteger := QTabela.FieldByName('ORDEM_ID').AsInteger;

      QSub_Detail.Prepare;
      QSub_Detail.Open;

      QOrdem_Lacre.Close;

      QOrdem_Lacre.ParamByName('ORDEM_ID').AsInteger := QTabela.FieldByName('ORDEM_ID').AsInteger;

      QOrdem_Lacre.Prepare;
      QOrdem_Lacre.Open;

    end;
  end;

  if QTabela.IsEmpty then
  Begin
    Itens.Enabled := False;

  End
  else
  Begin
    Itens.Enabled := True;

  End;


  DetailSearch('');
end;

procedure TFrmOrdem_Servico_Salao.STATUSChange(Sender: TObject);
begin

if (STATUS.Text = 'FATURADO') then
Begin
DT_FECHAMENTO.Date := DATE;
H_FECHAMENTO.Text := TimeToStr(Time);
End;

end;

procedure TFrmOrdem_Servico_Salao.btnDeleteClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('EXCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para exclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0 then
  begin
    Application.MessageBox(PChar('Ordem de serviço faturado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    abort;
  end;


  if Application.MessageBox('Deseja realmente excluir?', PChar(Msg_Title), mb_YesNo + mb_IconQuestion + mb_DefButton2) = IDYES then
  begin


    IQuery.Sql.Clear;
    IQuery.Sql.Add('DELETE FROM ORDEM_SERVICO');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(ORDEM_ID = :ID)');

    IQuery.ParamByName('ID').AsInteger := QTabela.FieldByName('ORDEM_ID').AsInteger;

    IQuery.Prepare;
    IQuery.ExecSql;



    QTabela.Close;
    QTabela.Open;
    Set_Campos(False);
    Botoes_Normal;
  end;

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QCliente.Close;
  end;
end;

procedure TFrmOrdem_Servico_Salao.btnDiscardClick(Sender: TObject);
begin
  Botoes_Normal;
  Set_Campos(False);

  if QTabela.IsEmpty then
  begin
    QEmpresa.Close;
    QCliente.Close;
  end;

  Habilitar(False);
  Operacao := '';

  Consulta.TabVisible := True;
end;

procedure TFrmOrdem_Servico_Salao.btnEditClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

   if QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0 then
  begin
    Application.MessageBox(PChar('Ordem de Serviço faturado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    abort;
  end;

  
  Operacao := 'Alterando';

  ID := QTabela.FieldByName('ORDEM_ID').AsInteger;

  Botoes_Editing;
  Habilitar(True);
  Itens.Enabled := False;


  Consulta.TabVisible := False;

  DT_ORDEM.SetFocus;
end;

procedure TFrmOrdem_Servico_Salao.btnEmpresaClick(Sender: TObject);
begin
  try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;
end;

procedure TFrmOrdem_Servico_Salao.btnAgendaClick(Sender: TObject);
begin
  Ver_Agenda_Ordem_Servico(QTabela.FieldByName('FUNCIONARIO').AsInteger);
end;

procedure TFrmOrdem_Servico_Salao.btnCentro_CustoClick(Sender: TObject);
begin
  try
    C_CUSTO_ID.Value := GetConsulta('CCUSTO', 0, 0, StrToInt(C_CUSTO_ID.Text));
  except
    C_CUSTO_ID.Value := GetConsulta('CCUSTO', 0, 0, 0);
  end;
end;

procedure TFrmOrdem_Servico_Salao.btnCheck_ListClick(Sender: TObject);
begin
  if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Moto' then
  begin
    Set_Campos(False);

    Botoes_Normal;

    if ((FrmData.QAcesso.FieldByName('ALTERACAO').AsString <> 'NÃO') or (FrmData.QAcesso.FieldByName('INCLUSAO').AsString <> 'NÃO')) and (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime >= FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
      CheckList_Moto(QTabela.FieldByName('ORDEM_ID').AsInteger);

    QCheckList_Moto.Sql.Clear;
    QCheckList_Moto.Sql.Add('SELECT * FROM CHECKLIST_MOTO');
    QCheckList_Moto.Sql.Add('WHERE');
    QCheckList_Moto.Sql.Add('(ORDEM_ID = :ORDEM_ID)');

    QCheckList_Moto.ParamByName('ORDEM_ID').AsInteger := QTabela.FieldByName('ORDEM_ID').AsInteger;

    QCheckList_Moto.Prepare;
    QCheckList_Moto.Open;

    Check_List.PreviewModal;
  end;

  if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Laboratório Info.' then
  begin
    Set_Campos(False);

    Botoes_Normal;

    if ((FrmData.QAcesso.FieldByName('ALTERACAO').AsString <> 'NÃO') or (FrmData.QAcesso.FieldByName('INCLUSAO').AsString <> 'NÃO')) and (QTabela.FieldByName('DT_MOVIMENTO').AsDateTime >= FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime) then
      CheckList_Informatica(QTabela.FieldByName('ORDEM_ID').AsInteger);

    QCheckList_Moto.Sql.Clear;
    QCheckList_Moto.Sql.Add('SELECT * FROM CHECKLIST_MOTO');
    QCheckList_Moto.Sql.Add('WHERE');
    QCheckList_Moto.Sql.Add('(ORDEM_ID = :ORDEM_ID)');

    QCheckList_Moto.ParamByName('ORDEM_ID').AsInteger := QTabela.FieldByName('ORDEM_ID').AsInteger;

    QCheckList_Moto.Prepare;
    QCheckList_Moto.Open;

    Check_List_Informatica.PreviewModal;
  end;

end;

procedure TFrmOrdem_Servico_Salao.btnClienteClick(Sender: TObject);
begin
  try
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(CLIENTE_ID.Text));
  except
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmOrdem_Servico_Salao.btnInsertClick(Sender: TObject);
begin
  if FrmData.QAcesso.FieldByName('INCLUSAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para inclusão', PChar(Msg_Title), mb_IconStop);
    exit;
  end;

  Operacao := 'Inserindo';
  Botoes_Editing;
  Set_Campos(True);
  Habilitar(True);
  Itens.Enabled := False;


  QEmpresa.Close;
  QCliente.Close;


  DT_ORDEM.Date     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  HORAS.Text        := Copy(TimeToStr(time), 1, 5);
  DT_MOVIMENTO.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  EMPRESA_ID.Value  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  FUNCIONARIO.Value := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
  STATUS.Text       := 'ABERTA';
  COND_PAGTO.Text   := 'A VISTA';

  Consulta.TabVisible := False;

  DT_ORDEM.SetFocus;
end;

procedure TFrmOrdem_Servico_Salao.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
    ManutencaoShow(Manutencao);
  end;
  Botoes_Normal;

end;

procedure TFrmOrdem_Servico_Salao.btnOrdemClick(Sender: TObject);
var
linha,pagina : integer;
begin
  Set_Campos(False);

  Botoes_Normal;
  Pagina := 0;

  if LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'RDPrint' then
  Begin
  if CheckBox1.Checked = True then
    Begin
      RDprint1.Impressora := HP;
      RDprint1.FonteTamanhoPadrao := S10cpp;
    End;

    RDprint1.OpcoesPreview.Preview     := True;
    RDprint1.MostrarProgresso          := True;
    RDprint1.Acentuacao                := SemAcento;
    RDprint1.TamanhoQteLinhas          := 1;
    RDprint1.FonteTamanhoPadrao        := S10cpp;
    RDprint1.Abrir;
    Pagina := Pagina + 1;


      RDprint1.Imp(02, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(02, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString) + 1), 80, 'Eficaz Automação e Sistemas Ltda - ME', []);
      RDprint1.Imp(03, 01, 'Data: ' + DateToStr(date) + ' - ' + TimeToStr(now));

      RDprint1.Imp(04, 01, Copy(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString,1,28));
      RDprint1.Imp(04, 30, 'N:' + Copy(FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString,1,5));
      RDprint1.Imp(04, 37, Copy (FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString,1,15));
      RDprint1.Imp(04, 55, Copy(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString,1,15));
      RDprint1.Imp(04, 72, FrmPrincipal.QEmpresa.FieldByName('CEP').AsString);
      RDprint1.Imp(05, 01, 'Cnpj.:' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);
      RDprint1.Imp(05, 30, 'I.E.: ' + FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString);
      RDprint1.Imp(05, 55, 'Fone: ' + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);
      RDprint1.Imp(06, 01, 'Data: ' + DateToStr(date) + ' - ' + TimeToStr(now));
     // RDprint1.impDir(06, 30, 80, 'Página: ' + IntToStr(Pagina), [normal]);
      RDprint1.Imp(07, 27, '*** ORDEM DE SERVIÇO ***');
      RDprint1.Imp(08, 01, '--------------------------------------------------------------------------------');
      RDprint1.Imp(09, 01, 'Data.:');
      RDprint1.Imp(09, 11, QTabela.FieldByName('DT_ORDEM').AsString);
      RDprint1.Imp(09, 27, 'Horas.:');
      RDprint1.Imp(09, 35, QTabela.FieldByName('HORAS').AsString);

      if QTabela.FieldByName('NO_ORDEM').AsInteger = 1  then
       RDprint1.ImpF(09, 46, 'Prioridade : A',[comp12,negrito])
      Else if QTabela.FieldByName('NO_ORDEM').AsInteger = 2  then
       RDprint1.ImpF(09, 46, 'Prioridade : B',[comp12,negrito])
      Else if QTabela.FieldByName('NO_ORDEM').AsInteger = 3  then
       RDprint1.ImpF(09, 46, 'Prioridade : C',[comp12,negrito]);

      RDprint1.Imp(09, 62, 'Num.Ordem:');
      RDprint1.Imp(09, 73, QTabela.FieldByName('ORDEM_ID').AsString);
      RDprint1.Imp(10, 01, 'Cliente:');
      RDprint1.Imp(10, 11, Copy(QTabela.FieldByName('NOME_CLIENTE').AsString, 1, 40));
      RDprint1.Imp(11, 01, 'Ins./Rg.:');
      RDprint1.Imp(11, 11, QTabela.FieldByName('INSCRICAO').AsString);
      RDprint1.Imp(11, 31, 'Cnpj/Cpf:');
      RDprint1.Imp(11, 41, QTabela.FieldByName('CNPJ').AsString);
      RDprint1.Imp(12, 01, 'Endereço:');
      RDprint1.Imp(12, 11, Copy(QTabela.FieldByName('ENDERECO').AsString, 1, 31));
      RDprint1.Imp(12, 46, 'Número:');
      RDprint1.Imp(12, 53, QTabela.FieldByName('NUMERO').AsString);
      RDprint1.Imp(12, 60, 'Bairro:');
      RDprint1.Imp(12, 68, Copy (QTabela.FieldByName('BAIRRO').AsString,1,13));
      RDprint1.Imp(13, 01, 'Cidade:');
      RDprint1.Imp(13, 11, Copy(QTabela.FieldByName('MUNICIPIO').AsString, 1, 31));
      RDprint1.Imp(13, 31, 'CEP:');
      RDprint1.Imp(13, 36, QTabela.FieldByName('CEP').AsString);
      RDprint1.Imp(13, 46, 'Telefone:');
      RDprint1.Imp(13, 56, QTabela.FieldByName('TELEFONE').AsString);
      RDprint1.Imp(14, 01, 'Contato:');
      RDprint1.Imp(14, 11, QCliente.FieldByName('CONTATO').AsString);
      RDprint1.Imp(15, 01, 'Atendente');
      RDprint1.Imp(15, 11, QAtendente.FieldByName('NOME').AsString);
      RDprint1.Imp(15, 39, 'E-mail:');
      RDprint1.Imp(15, 46, QCliente.FieldByName('EMAIL').AsString);
      RDprint1.Imp(16, 01, '--------------------------------------------------------------------------------');
      RDPrint1.Imp(17,01,'Aparelho/Peça:');
      RDPrint1.Imp(17,20,QTabela.FieldByName('APARELHO').AsString);
      RDPrint1.Imp(18,01,'Número de Serie:');
      RDPrint1.Imp(18,20,QTabela.FieldByName('NUM_SERIE').AsString);
      RDPrint1.Imp(19,01,'Defeito Reclamado:');
      RDPrint1.Imp(19,20,Copy(QTabela.FieldByName('DEFEITO').AsString,1,60));
      RDprint1.Imp(20,01,Copy(QTabela.FieldByName('DEFEITO').AsString,61,10));
      RDPrint1.Imp(21,01,'Previsão Atend.:');
      RDPrint1.Imp(21,20,DateToStr(QTabela.FieldByName('PREV_ATEND').AsDateTime));
      RDPrint1.Imp(21,46,'Tipo Atend.:');
      RDPrint1.Imp(21,60,QTabela.FieldByName('TIPO_ATENDIMENTO').AsString);
      RDPrint1.Imp(22,01,'Horas:');
      RDPrint1.Imp(22,20,QTabela.FieldByName('HORA_ATEND').AsString);
      RDprint1.Imp(23, 01, '--------------------------------------------------------------------------------');
      RDprint1.Imp(24, 01, 'Cód.    Descrição                     Quantidade    Pr. Unitário       Pr. Total');
      RDprint1.Imp(25, 01, '--------------------------------------------------------------------------------');
      Linha := 26;

    while not QSub_Detail.Eof do
    Begin
    RDprint1.Imp(linha,01,QSub_Detail.FieldByName('CODIGO_ITEM').AsString);
    RDprint1.Imp(linha,9,Copy(QSub_Detail.FieldByName('DESCRICAO').AsString ,1,24));
    RDprint1.Imp(linha,43,QSub_Detail.FieldByName('QUANTIDADE').AsString);
    RDprint1.ImpVal(linha,49,'###,###,##0.00',QSub_Detail.FieldByName('VR_UNITARIO').AsFloat,[]);
    RDprint1.ImpVal(linha,66,'###,###,##0.00',QSub_Detail.FieldByName('VR_TOTAL').AsFloat,[]);
    inc(linha);
    QSub_Detail.Next;
    End;
   RDprint1.Imp(linha,70,'__________');
   inc(linha);

    if not QOrdem_Lacre.IsEmpty then
    Begin
     QOrdem_Lacre.First;
      while not QOrdem_Lacre.Eof do
      Begin
       RDPrint1.Imp(linha,01,'Lacre Retirado   :');
       RDPrint1.Imp(linha,19,QOrdem_Lacre.FieldByName('L_RETIRADO').AsString);
       RDPrint1.Imp(linha,35,'Lacre Aplicado   :');
       RDPrint1.Imp(linha,53,QOrdem_Lacre.FieldByName('L_APLICADO').AsString);

       if QOrdem_Lacre.FieldByName('L_RETIRADO2').AsString <> '' then
       Begin
       inc(linha);
       RDPrint1.Imp(linha,01,'Lacre Retirado 2º:');
       RDPrint1.Imp(linha,19,QOrdem_Lacre.FieldByName('L_RETIRADO2').AsString);
       RDPrint1.Imp(linha,35,'Lacre Aplicado 2º:');
       RDPrint1.Imp(linha,53,QOrdem_Lacre.FieldByName('L_APLICADO2').AsString);
       End;

       inc(linha);
       RDPrint1.Imp(linha,01,'Etiqueta Retirada:');
       RDPrint1.Imp(linha,19,QOrdem_Lacre.FieldByName('E_RETIRADO').AsString);
       RDPrint1.Imp(linha,35,'Etiqueta Aplicada:');
       RDPrint1.Imp(linha,53,QOrdem_Lacre.FieldByName('E_APLICADO').AsString);
       QOrdem_lacre.Next;
      End;
       inc(linha);
       RDPrint1.Imp(linha,01,'Portaria         :');
       RDPrint1.Imp(linha,19,QTabela.FieldByName('PORTARIA').AsString);
       RDPrint1.Imp(linha,35,'Inmetro          :');
       RDPrint1.Imp(linha,53,QTabela.FieldByName('INMETRO').AsString);
      inc(linha);
      inc(linha);
    End;

  RDprint1.Imp(linha ,01, 'Observação:');
  RDprint1.Imp(linha,13,Copy(QTabela.FieldByName('OBSERVACAO').AsString,1,40));
  RDprint1.Imp(linha,54,'Sub-Total');
  RDprint1.ImpVal(linha,66,'###,###,##0.00',QTabela.FieldByName('VALOR_ITENS').AsFloat,[]);
  inc(linha);
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,41,40));
  RDprint1.Imp(linha,54,'Desconto');
  RDprint1.ImpVal(linha,66,'###,###,##0.00',QTabela.FieldByName('DESCONTO').AsFloat,[]);
  inc(linha);
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,81,40));
  RDprint1.Imp(linha,54,'Valor');
  RDprint1.ImpVal(linha,66,'###,###,##0.00',QTabela.FieldByName('VALOR').AsFloat,[]);
  inc(linha);
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,121,40));
  inc(linha);
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,161,40));
  inc(linha);
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,201,40));
  inc(linha);
  RDprint1.Imp(linha,01,'--------------------------------------------------------------------------------');
  inc(linha);
  RDprint1.Imp(linha,01,'Autorizo a Execucao Desta');
  inc(linha);
  RDprint1.Imp(linha,01,'Assinatura do Cliente:_____________________________________' );
  linha := linha + 3;

   if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Automóvel' then
      RDprint1.Imp(linha,01,'Assinatura do Mecânico:_____________________________________' )
   else
      RDprint1.Imp(linha,01,'Assinatura do Tecnico:_____________________________________' );


  inc(linha);
  RDprint1.Imp(linha,23,QVendedor.FieldByName('NOME').AsString);
  inc(linha);
  inc(linha);
  if (QTabela.FieldByName('STATUS').AsString = 'EXECUTADA') OR (QTabela.FieldByName('STATUS').AsString = 'ENTREGUE')  then
  Begin
  RDprint1.Imp(linha,01,'Fechamento:');
  RDprint1.Imp(linha,15,'Data: ' + QTabela.FieldByName('DT_FECHAMENTO').AsString +  ' Hora: ' + QTabela.FieldByName('H_FECHAMENTO').AsString);
  End
  Else
  Begin
  RDprint1.Imp(linha,01,'Fechamento:');
  RDprint1.Imp(linha,15,'Data: __/__/__ Hora: __:__');
  End;

   Application.ProcessMessages;

   RDprint1.TamanhoQteLinhas          := 66;
   RDprint1.Fechar;
  End
  Else
   if (LeIni(Arq_Ini, 'Sistema', 'Largura Papel') > '0') and (LeIni(Arq_Ini, 'Sistema', 'Altura Papel') > '0') then
  begin
    Ordem.Page.Width     := StrToFloat(LeIni(Arq_Ini, 'Sistema', 'Largura Papel'));
    Ordem.Page.Length    := StrToFloat(LeIni(Arq_Ini, 'Sistema', 'Altura Papel'));
    Ordem.PreviewModal;
  end
  else
   Application.MessageBox(PChar('Informe a largura e altura do papel.'), PChar(Msg_Title), mb_IconInformation);
end;

procedure TFrmOrdem_Servico_Salao.btnParcelasClick(Sender: TObject);
begin
 if QTabela.FieldByName('VALOR').AsFloat > 0 then
    Divisao_Parcelas(QTabela.FieldByName('ORDEM_ID').AsInteger,'D','', True, QTabela.FieldByName('DT_ORDEM').AsDateTime, QTabela.FieldByName('VALOR').AsFloat);

end;

procedure TFrmOrdem_Servico_Salao.btnPesquisaClick(Sender: TObject);
var
Condicao: String;
begin
  Condicao := GetPesquisa('ORDEM');

  if Condicao <> '' then
  begin
    CmdSelectNull := Condicao + ' AND (EMPRESA_ID = :EMPRESA_ID)';
    QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  end;

  CmdOrderBy := 'ORDER BY ORDEM_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.Prepare;
  QTabela.Open;
  
  Set_Campos(False);
  Botoes_Normal;
end;

procedure TFrmOrdem_Servico_Salao.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    QTabela.Prior;
    Set_Campos(False);
    ManutencaoShow(Manutencao);
  end;
  Botoes_Normal;

end;

procedure TFrmOrdem_Servico_Salao.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOrdem_Servico_Salao.btnSaveClick(Sender: TObject);
var
Id_Trans, I, Itens, Trans_Agrp: Integer;
Unidades, Valor_Produtos, Base_ICMS_Normal, Vr_ICMS_Normal, Base_ICMS_ST, Vr_ICMS_ST, Vr_Isento, Vr_Unit, Vr_Desc, Vr_Item, Base_ICMS_Normal_T, Vr_ICMS_Normal_T, Base_ICMS_ST_T, Vr_ICMS_ST_T, Aliquota_Inter_Estadual: Real;
Cst, CFOP, Condicao,List_cupom, InputSerial: String;
Verifica_transacao:Boolean;
begin
  DetailSearch('');

  if Validacao then
  begin

    VALOR.Value := VALOR_ITENS.Value - DESCONTO.Value;
    Verifica_Transacao := False;

    if Operacao = 'Inserindo' then
    begin

      Insert;

      CmdSelectNull := 'WHERE (ORDEM_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
      CmdOrderBy    := 'ORDER BY ORDEM_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QTabela.Open;
      QTabela.Last;
    end
    else
      Edit;

    Set_Campos(False);




    if QTabela.IsEmpty then
    begin
      QEmpresa.Close;
      QCliente.Close;
    end;

    Habilitar(False);
    Botoes_Normal;

    if COND_PAGTO.Text = 'A PRAZO' then
      btnParcelasClick(Self)
    else
    begin
      IQuery.Sql.Clear;
      IQuery.Sql.Add('DELETE FROM TRANSPARCELAS');
      IQuery.Sql.Add('WHERE');
      IQuery.Sql.Add('(TRANSACAO_ID = :ORDEM_ID)');
      IQuery.Sql.Add('AND (TIPO_TRANSACAO = :TIPO_TRANSACAO)');

      IQuery.ParamByName('ORDEM_ID').AsInteger  := QTabela.FieldByName('ORDEM_ID').AsInteger;
      IQuery.ParamByName('TIPO_TRANSACAO').AsString := 'D';

      IQuery.Prepare;
      IQuery.ExecSql;


    end;


    if ((QTabela.FieldByName('TRANSACAO_ID').AsInteger = 0)  or (QTabela.FieldByName('TRANSACAO_ID').IsNull))  AND (Status.Text = 'FATURADO') then
    Begin

     Panel4.Visible := True;
     Application.ProcessMessages;

     IQuery.SQL.Clear;
     IQuery.SQL.Add('SELECT NEXTVAL(:GEN_TRANSACOES) ID');
     IQuery.ParamByName('GEN_TRANSACOES').AsString :=  'GEN_TRANSACOES';

     IQuery.Prepare;
     IQuery.Open;

     Id_Trans := IQuery.FieldByName('ID').AsInteger;

     QRel.Sql.Clear;
      QRel.Sql.Add('INSERT INTO TRANSACOES( ' +
                   'TRANSACAO_ID,  DT_TRANS,    DT_MOVIMENTO,    CONDUTA, ' +
                   'DEPTO,         EMPRESA_ID,  CONTA_ID,        C_CUSTO_ID, ' +
                   'VALOR,         TPCTB,       AUTORIZ_ID,      HISTORICO, ' +
                   'CONTAAUX_ID,   NUM_DOC,     BANCO_ID,        BALANCO, ' +
                   'COND_PAGTO,    SERIE,       FLUXO_CAIXA_ID,  TIPO_VENDA, ' +
                   'CLIENTE_ID,    MODELO,      SUB_CODIGO,HORA,VALOR_PRODUTOS,VR_DESCONTO,VENDEDOR_ID,CFOP) VALUES(' +
                   ':TRANSACAO_ID, :DT_TRANS,   :DT_MOVIMENTO,   :CONDUTA, ' +
                   ':DEPTO,        :EMPRESA_ID, :CONTA_ID,       :C_CUSTO_ID, ' +
                   ':VALOR,        :TPCTB,      :AUTORIZ_ID,     :HISTORICO, ' +
                   ':CONTAAUX_ID,  :NUM_DOC,    :BANCO_ID,       :BALANCO, ' +
                   ':COND_PAGTO,   :SERIE,      :FLUXO_CAIXA_ID, :TIPO_VENDA, ' +
                   ':CLIENTE_ID,   :MODELO,     :SUB_CODIGO,:HORA,:VALOR_PRODUTOS,:VR_DESCONTO,:VENDEDOR_ID,:CFOP)');

      QRel.ParamByName('TRANSACAO_ID').AsInteger   := Id_Trans;
      QRel.ParamByName('DT_TRANS').AsDateTime      := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QRel.ParamByName('DT_MOVIMENTO').AsDateTime  := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
      QRel.ParamByName('CONDUTA').AsString         := '01';
      QRel.ParamByName('DEPTO').AsString           := '07';
      QRel.ParamByName('EMPRESA_ID').AsInteger     := FrmPrincipal.QEmpresa.FieldByName('EMPRESA_ID').AsInteger;;
      QRel.ParamByName('CONTA_ID').AsInteger       := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
      QRel.ParamByName('C_CUSTO_ID').AsInteger     := 1;
      QRel.ParamByName('VALOR_PRODUTOS').AsFloat   := VALOR_ITENS.VALUE;
      QRel.ParamByName('VR_DESCONTO').AsFloat      := DESCONTO.VALUE;
      QRel.ParamByName('VALOR').AsFloat            := VALOR.VALUE;
      QRel.ParamByName('TPCTB').AsString           := '2';
      QRel.ParamByName('AUTORIZ_ID').AsInteger     := 0;
      QRel.ParamByName('HISTORICO').AsString       := 'Venda importada Ordem Serviçõ Salão Nº: '  + StrZero(QTabela.FieldByName('ORDEM_ID').AsString,9,0);
      QRel.ParamByName('CONTAAUX_ID').AsInteger    := 0;
      QRel.ParamByName('NUM_DOC').AsString         := StrZero(IQuery.FieldByName('ID').AsString,9,0);
      QRel.ParamByName('VENDEDOR_ID').AsInteger    := StrToInt(Funcionario.Text);
      QRel.ParamByName('CFOP').AsString            :=  '5929' ;


      if Cond_Pagto.Text = 'A PRAZO' then
        QRel.ParamByName('BANCO_ID').AsInteger := 0
      else
        QRel.ParamByName('BANCO_ID').AsInteger := StrToInt(LeIni(Arq_Ini, 'Sistema', 'Caixa'));

      QRel.ParamByName('BALANCO').AsString := 'LIBERADO';
      QRel.ParamByName('COND_PAGTO').AsString := Cond_Pagto.Text;
      QRel.ParamByName('SERIE').AsString           := '001';
      QRel.ParamByName('FLUXO_CAIXA_ID').AsInteger := 2;
      QRel.ParamByName('TIPO_VENDA').AsString      := 'VENDA';

      QRel.ParamByName('CLIENTE_ID').AsInteger     := StrToInt(Cliente_id.Text);
      QRel.ParamByName('MODELO').AsString          := '01';
      QRel.ParamByName('SUB_CODIGO').AsString      := '1 - NORMAL';
      QRel.ParamByName('HORA').AsString            := TimeToStr(time);

      QRel.Prepare;
      QRel.ExecSql;

      Itens := 0;

      QSub_Detail.First;
      while not QSub_Detail.Eof do
      begin
        Panel4.Visible := True;

        QProduto.Sql.Clear;
        QProduto.Sql.Add('SELECT * FROM PRODUTOS');
        QProduto.Sql.Add('WHERE');
        QProduto.Sql.Add('(PRODUTO_ID = :PRODUTO_ID)');

        QProduto.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('CODIGO_ITEM').AsInteger;

        QProduto.Prepare;
        QProduto.Open;

        QTributo.Sql.Clear;
        QTributo.Sql.Add('SELECT * FROM TRIBUTOS');
        QTributo.Sql.Add('WHERE');
        QTributo.Sql.Add('(TRIBUTO_ID = :TRIBUTO_ID)');

        QTributo.ParamByName('TRIBUTO_ID').AsInteger := QProduto.FieldByName('TRIBUTO_ID').AsInteger;

        QTributo.Prepare;
        QTributo.Open;

        CFOP := QTributo.FieldByName('CFOP').AsString;

        Base_ICMS_Normal := 0;
        Vr_ICMS_Normal   := 0;
        Base_ICMS_ST     := 0;
        Vr_ICMS_ST       := 0;
        Vr_Unit          := QSub_Detail.FieldByName('VR_UNITARIO').AsFloat ;
        Vr_Desc          := QSub_Detail.FieldByName('VR_DESCONTO').AsFloat; //((Vr_Unit * Desconto) / 100);
        Vr_Item          := QSub_Detail.FieldByName('VR_TOTAL').AsFloat  ; //((Vr_Unit - Vr_Desc) * QRel.FieldByName('QUANTIDADE').AsFloat);


        if QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat > 0 then
        begin
          Base_ICMS_Normal := Vr_Item;
          Vr_ICMS_Normal   := 0;//((Base_ICMS_Normal * QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100);
        end
        else
        begin
          Base_ICMS_Normal := 0;
          Vr_ICMS_Normal   := 0;
        end;

        Cst := Copy(QTributo.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2);

        if (Cst = '010') or (Cst = '030') or (Cst = '060') or (Cst = '070') then
        begin
          Base_ICMS_ST := 0; //(Vr_Item + ((Vr_Item * QProduto.FieldByName('MVA').AsFloat) / 100));
          Vr_ICMS_ST   := 0; //(((Base_ICMS_ST * Aliquota_ICMS_Local) / 100) - RoundTo(((Vr_Item * Aliquota_Inter_Estadual) / 100), -2));
        end
        else
        begin
          Base_ICMS_ST := 0;
          Vr_ICMS_ST   := 0;
        end;

        if (Cst = '040') or (Cst = '041') or (Cst = '050') then
          Vr_Isento := Vr_Item
        else
          Vr_Isento := 0;

        QUpdate.Sql.Clear;
        QUpdate.Sql.Add('INSERT INTO TRANSITENS( ' +
                        'TRANSACAO_ID,   PRODUTO_ID,      TP_PROD_SERV,   CFOP, ' +
                        'DESCRICAO,      CONTA_ID,        TRIBUTO_ID,     CST, ' +
                        'MVA,            BASE_CALC_ICMS,  ALIQUOTA_ICMS,  VALOR_ICMS, ' +
                        'BASE_CALC_ST,   VALOR_ICMS_ST,   VALOR_ISENTO,   VALOR_OUTROS, ' +
                        'VR_IPI,         QUANTIDADE,      VR_UNITARIO,    VR_DESCONTO, ' +
                        'VR_TOTAL,CST_PIS,CST_COFINS,DESC_RODAPE,SEQUENCIA,FUNCIONARIO_ID) VALUES(' +
                        ':TRANSACAO_ID,  :PRODUTO_ID,     :TP_PROD_SERV,  :CFOP, ' +
                        ':DESCRICAO,     :CONTA_ID,       :TRIBUTO_ID,    :CST, ' +
                        ':MVA,           :BASE_CALC_ICMS, :ALIQUOTA_ICMS, :VALOR_ICMS, ' +
                        ':BASE_CALC_ST,  :VALOR_ICMS_ST,  :VALOR_ISENTO,  :VALOR_OUTROS, ' +
                        ':VR_IPI,        :QUANTIDADE,     :VR_UNITARIO,   :VR_DESCONTO, ' +
                        ':VR_TOTAL,      :CST_PIS,        :CST_COFINS,    :DESC_RODAPE,:SEQUENCIA,:FUNCIONARIO_ID )');

        QUpdate.ParamByName('TRANSACAO_ID').AsInteger  := Id_Trans;
        QUpdate.ParamByName('PRODUTO_ID').AsInteger    := QSub_Detail.FieldByName('CODIGO_ITEM').AsInteger;
        QUpdate.ParamByName('TP_PROD_SERV').AsString   := QSub_Detail.FieldByName('TP_PROD_SERV').AsString;
        QUpdate.ParamByName('CFOP').AsString           := '5929'; // QTributo.FieldByName('CFOP').AsString;
        QUpdate.ParamByName('DESCRICAO').AsString      := QSub_Detail.FieldByName('DESCRICAO').AsString;
        QUpdate.ParamByName('CONTA_ID').AsInteger      := FrmPrincipal.Config.FieldByName('CONTA_ESTOQUE').AsInteger;
        QUpdate.ParamByName('TRIBUTO_ID').AsInteger    := QProduto.FieldByName('TRIBUTO_ID').AsInteger;
        QUpdate.ParamByName('CST').AsString            := Copy(QTributo.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2);
        QUpdate.ParamByName('MVA').AsFloat             := QProduto.FieldByName('MVA').AsFloat;
        QUpdate.ParamByName('BASE_CALC_ICMS').AsFloat  := 0;//RoundTo(Base_ICMS_Normal, -2);
        QUpdate.ParamByName('ALIQUOTA_ICMS').AsFloat   := 0;//QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
        QUpdate.ParamByName('VALOR_ICMS').AsFloat      := 0;//RoundTo(Vr_ICMS_Normal, -2);
        QUpdate.ParamByName('BASE_CALC_ST').AsFloat    := RoundTo(Base_ICMS_ST, -2);
        QUpdate.ParamByName('VALOR_ICMS_ST').AsFloat   := RoundTo(Vr_ICMS_ST, -2);
        QUpdate.ParamByName('VALOR_ISENTO').AsFloat    := RoundTo(Vr_Isento, -2);
        QUpdate.ParamByName('VALOR_OUTROS').AsFloat    := 0;
        QUpdate.ParamByName('VR_IPI').AsFloat          := 0;
        QUpdate.ParamByName('QUANTIDADE').AsFloat      := RoundTo(QSub_Detail.FieldByName('QUANTIDADE').AsFloat, -2);
        QUpdate.ParamByName('VR_UNITARIO').AsFloat     := RoundTo(Vr_Unit, -2);
        QUpdate.ParamByName('VR_DESCONTO').AsFloat     := 0;
        QUpdate.ParamByName('VR_TOTAL').AsFloat        := RoundTo(Vr_Item, -2);
        QUpdate.ParamByName('CST_PIS').AsString        := '49';
        QUpdate.ParamByName('CST_COFINS').AsString     := '49';
        QUpdate.ParamByName('DESC_RODAPE').AsFloat     :=RoundTo(Vr_Desc, -2);
        QUpdate.ParamByName('SEQUENCIA').AsInteger     := Itens + 1 ;
        QUpdate.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(Funcionario.Text);

        QUpdate.Prepare;
        QUpdate.ExecSql;



        Itens              := (Itens + 1);
        Unidades           := (Unidades + QSub_Detail.FieldByName('QUANTIDADE').AsFloat);
        Valor_Produtos     := Valor_Produtos + Vr_Item;
        Base_ICMS_Normal_T := Base_ICMS_Normal_T + Base_ICMS_Normal;
        Vr_ICMS_Normal_T   := Vr_ICMS_Normal_T + Vr_ICMS_Normal;
        Base_ICMS_ST_T     := Base_ICMS_ST_T + Base_ICMS_ST;
        Vr_ICMS_ST_T       := Vr_ICMS_ST_T + Vr_ICMS_ST;


        Panel4.Caption :=  'Processando: ' + QSub_Detail.FieldByName('CODIGO_ITEM').AsString;

        Application.ProcessMessages;
        QSub_Detail.Next;
      end;

      if Cond_Pagto.Text = 'A PRAZO' then
      Begin
       QSearch.Sql.Clear;
       QSearch.Sql.Add('SELECT * FROM TRANSPARCELAS WHERE TIPO_TRANSACAO =:TIPO_TRANSACAO AND TRANSACAO_ID = :TRANSACAO_ID');
       QSearch.ParamByName('TIPO_TRANSACAO').AsString := 'D';
       QSearch.ParamByName('TRANSACAO_ID').AsInteger := QTabela.FieldByName('ORDEM_ID').AsInteger;
       QSearch.Prepare;
       QSearch.Open;

       If not QSearch.isEmpty Then
       Begin
         QSearch.First;
         While  not QSearch.eof do
         Begin
          QUpdate.Sql.Clear;
          QUpdate.Sql.Add('INSERT INTO TRANSPARCELAS( ' +
                          'TRANSACAO_ID,   PARCELA_ID,   TIPO_TRANSACAO,   DT_VENCIMENTO, ' +
                          'VALOR,          DUPLICATA, ESPECIE) VALUES(' +
                          ':TRANSACAO_ID,  :PARCELA_ID,  :TIPO_TRANSACAO,  :DT_VENCIMENTO, ' +
                          ':VALOR,         :DUPLICATA, :ESPECIE)');

          QUpdate.ParamByName('TRANSACAO_ID').AsInteger   := Id_Trans;
          QUpdate.ParamByName('PARCELA_ID').AsString      := QSearch.FieldByName('PARCELA_ID').AsString;
          QUpdate.ParamByName('TIPO_TRANSACAO').AsString  := 'T';
          QUpdate.ParamByName('DT_VENCIMENTO').AsDateTime := QSearch.FieldByName('DT_VENCIMENTO').AsDateTime;
          QUpdate.ParamByName('VALOR').AsFloat            := QSearch.FieldByName('VALOR').AsFloat;
          QUpdate.ParamByName('DUPLICATA').AsString       := QSearch.FieldByName('DUPLICATA').AsString;
          QUpdate.ParamByName('ESPECIE').AsString         := QSearch.FieldByName('ESPECIE').AsString;

          QUpdate.Prepare;
          QUpdate.ExecSql;

          Application.ProcessMessages;
          QSearch.Next;

         End;
       End;

      End;

      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE ORDEM_SERVICO SET TRANSACAO_ID = :TRANSACAO_ID WHERE ORDEM_ID = :ORDEM_ID');
      QUpdate.ParamByName('TRANSACAO_ID').AsInteger := id_trans;
      QUpdate.ParamByName('ORDEM_ID').AsInteger     := QTabela.FieldByName('ORDEM_ID').AsInteger;
      QUpdate.Prepare;
      Qupdate.ExecSQL;

      QUpdate.Sql.Clear;
      QUpdate.Sql.Add('UPDATE TRANSACOES SET DT_TRANS = DT_TRANS WHERE TRANSACAO_ID = :TRANSACAO_ID');
      QUpdate.ParamByName('TRANSACAO_ID').AsInteger := id_trans;
      QUpdate.Prepare;
      Qupdate.ExecSQL;


        Verifica_transacao := True;

        Application.MessageBox('Transação Gerada com Sucesso. Verifique as parcelas na janela seguinte.', PChar(Msg_Title), mb_IconInformation);

        Panel4.Visible := False;
    End;




    Operacao := '';
    Consulta.TabVisible := True;

    if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Moto' then
      btnCheck_ListClick(Sender);

     if Verifica_transacao Then
     Trans_Venda_Estoque(Id_Trans);

  end;
end;

procedure TFrmOrdem_Servico_Salao.btnVendedorClick(Sender: TObject);
begin
  try
    FUNCIONARIO.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(FUNCIONARIO.Text));
  except
    FUNCIONARIO.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmOrdem_Servico_Salao.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmOrdem_Servico_Salao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
OldBkMode: Integer;
begin
{
  ShowScrollBar(DBGrid1.Handle, SB_HORZ, False);
  ShowScrollBar(DBGrid1.Handle, SB_VERT, False);

  if QTabela.FieldByName('STATUS').AsString = 'EXECUTADA' then
  begin
    DBGrid1.Canvas.Font.Color  := clGreen;
    DBGrid1.Canvas.Brush.Color := clInfoBk;
  end
  else
  begin
    DBGrid1.Canvas.Font.Color  := clRed;
    DBGrid1.Canvas.Brush.Color := clInfoBk;
  end;

  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
}

  DBGrid1.Canvas.Brush.Color := clInfoBk;

  if QTabela.FieldByName('STATUS').AsString = 'EXECUTADA' then
    TDBGrid(Sender).Canvas.Font.Color := clNavy

  else if  QTabela.FieldByName('STATUS').AsString = 'FATURADO' then
    TDBGrid(Sender).Canvas.Font.Color := clGreen
  Else
    TDBGrid(Sender).Canvas.Font.Color := clRed;

  if gdSelected in State then
  begin
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clYellow;

      FillRect(Rect);

      Brush.Color := clYellow;
      OldBkMode   := SetBkMode(Handle, TRANSPARENT);

      SetBkMode(Handle, OldBkMode);

      Font.Style := [fsBold];
    end;
  end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).Columns[DataCol].Field, State);
end;

procedure TFrmOrdem_Servico_Salao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
InputString: String;  
begin
  if Key = VK_F5 then
  begin
    InputString := InputBox('Localizar', 'Número da OS:', '');

    if InputString <> '' then
    begin
      CmdSelectNull := 'WHERE (ORDEM_ID = :ORDEM_ID) AND (EMPRESA_ID = :EMPRESA_ID)';
      CmdOrderBy    := 'ORDER BY ORDEM_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      try
        QTabela.ParamByName('ORDEM_ID').AsInteger := StrToInt(InputString);
      except
        QTabela.ParamByName('ORDEM_ID').AsInteger := 0;
      end;

      QTabela.ParamByName('EMPRESA_ID').AsInteger := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.Prepare;
      QTabela.Open;
    end;
  end;

  if Key = VK_F7 then
  begin
    InputString := InputBox('Localizar', 'Nome do Cliente:', '');

    if InputString <> '' then
    begin
      CmdSelectNull := 'WHERE (NOME_CLIENTE LIKE :NOME_CLIENTE) AND (EMPRESA_ID = :EMPRESA_ID)';
      CmdOrderBy    := 'ORDER BY ORDEM_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('NOME_CLIENTE').AsString :=  '%' + InputString + '%';
      QTabela.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.Prepare;
      QTabela.Open;
    end;
  end;
  if Key = VK_F4 then
  begin

    if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Automóvel' then
    begin
       InputString := InputBox('Localizar', 'Número da Placa:', '');
    end
    else
     InputString := InputBox('Localizar', 'Número de Serie:', '');

    if InputString <> '' then
    begin
      CmdSelectNull := 'WHERE (NUM_SERIE LIKE :NUM_SERIE) AND (EMPRESA_ID = :EMPRESA_ID)';
      CmdOrderBy    := 'ORDER BY ORDEM_ID';

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.ParamByName('NUM_SERIE').AsString := '%' + InputString + '%';
      QTabela.ParamByName('EMPRESA_ID').AsInteger  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

      QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

      QTabela.Prepare;
      QTabela.Open;
    end;
  end;
end;

procedure TFrmOrdem_Servico_Salao.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmOrdem_Servico_Salao.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmOrdem_Servico_Salao.ItensColEnter(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    ProdutoSearch;
    TributoSearch;

    if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
    begin
      if (Itens.SelectedField.FieldName = 'tributo_id') and (QProduto.IsEmpty) then
        Itens.SelectedIndex := 1;
    end;

    if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'S' then
    begin
      if (Itens.SelectedField.FieldName = 'tributo_id') and (QServico.IsEmpty) then
        Itens.SelectedIndex := 1;
    end;

    if (Itens.SelectedField.FieldName = 'CST') and (QTributo.IsEmpty) then
      Itens.SelectedIndex := 4;

    if (Itens.SelectedField.FieldName = 'vr_unitario') and (QSub_Detail.FieldByName('QUANTIDADE').AsFloat = 0) then
      Itens.SelectedIndex := 7;

    if (Itens.SelectedField.FieldName = 'vr_desconto') and (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat = 0) then
      Itens.SelectedIndex := 8;
  end;
end;

procedure TFrmOrdem_Servico_Salao.ItensColExit(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    if Itens.SelectedField.FieldName = 'tp_prod_serv' then
    begin
      if (QSub_Detail.FieldByName('TP_PROD_SERV').AsString <> 'P') and (QSub_Detail.FieldByName('TP_PROD_SERV').AsString <> 'S') then
        QSub_Detail.FieldByName('TP_PROD_SERV').AsString := 'P';
    end;

    if Itens.SelectedField.FieldName = 'codigo_item' then
    begin
      if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
      begin
        ProdutoSearch;

        if QProduto.IsEmpty then
        begin
          QSub_Detail.FieldByName('DESCRICAO').AsString    := '';
          QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger  := 0;
          QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat := 0;
          QSub_Detail.FieldByName('VR_UNITARIO').AsFloat   := 0;

          Application.MessageBox('Produto inexistente', PChar(Msg_Title), mb_IconStop);

          Itens.SelectedIndex := 1;
        end
        else
        begin
          QSub_Detail.FieldByName('DESCRICAO').AsString    := QProduto.FieldByName('DESCRICAO').AsString;
          QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger  := QProduto.FieldByName('TRIBUTO_ID').AsInteger;
          QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat := QProduto.FieldByName('ALIQUOTA_ICMS').AsFloat;
          QSub_Detail.FieldByName('VR_UNITARIO').AsFloat   := QProduto.FieldByName('PRECO_VAREJO').AsFloat;

          if (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime >= QProduto.FieldByName('PROMO_INICIAL').AsDateTime) and (FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime <= QProduto.FieldByName('PROMO_FINAL').AsDateTime) then
            QSub_Detail.FieldByName('VR_UNITARIO').AsFloat := RoundTo(QProduto.FieldByName('PRECO_PROMOCAO').AsFloat, -2);
        end;
      end;

      if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'S' then
      begin
        ServicoSearch;

        if QServico.IsEmpty then
        begin
          QSub_Detail.FieldByName('DESCRICAO').AsString    := '';
          QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger  := 0;
          QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat := 0;
          QSub_Detail.FieldByName('VR_UNITARIO').AsFloat   := 0;

          Application.MessageBox('Serviço inexistente', PChar(Msg_Title), mb_IconStop);

          Itens.SelectedIndex := 1;
        end
        else
        begin
          QSub_Detail.FieldByName('DESCRICAO').AsString    := QServico.FieldByName('DESCRICAO').AsString;
          QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger  := 1;
          QSub_Detail.FieldByName('ALIQUOTA_ICMS').AsFloat := QServico.FieldByName('ISS').AsFloat;
          QSub_Detail.FieldByName('VR_UNITARIO').AsFloat   := QServico.FieldByName('PRECO').AsFloat;
        end;
      end;

    end;

    if Itens.SelectedField.FieldName = 'tributo_id' then
    begin
      TributoSearch;

      if QTributo.IsEmpty then
      begin
        QSub_Detail.FieldByName('CST').AsString := '';

        Application.MessageBox('Tributo inexistente', PChar(Msg_Title), mb_IconStop);

        Itens.SelectedIndex := 3;
      end
      else
        QSub_Detail.FieldByName('CST').AsString := Copy(QTributo.FieldByName('ORIGEM').AsString, 1, 1) + Copy(QTributo.FieldByName('TRIBUTACAO').AsString, 1, 2);
    end;

    if (Itens.SelectedField.FieldName = 'vr_unitario') or (Itens.SelectedField.FieldName = 'quantidade') or (Itens.SelectedField.FieldName = 'vr_desconto') then
    begin
      if Itens.SelectedField.FieldName = 'quantidade' then
      begin
        ProdutoSearch;

        if QProduto.FieldbyName('FRACAO_VENDA').AsFloat > 0 then
          QSub_Detail.FieldByName('QUANTIDADE').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * QProduto.FieldByName('FRACAO_VENDA').AsFloat);
      end;

      QSub_Detail.FieldByName('VR_TOTAL').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat));
    end;
  end;
end;

procedure TFrmOrdem_Servico_Salao.ItensEnter(Sender: TObject);
begin
  Botoes_Disable;
  Consulta.TabVisible := False;
end;

procedure TFrmOrdem_Servico_Salao.ItensExit(Sender: TObject);
begin
  if QSub_Detail.State in [dsInsert, dsEdit] then
  begin
    QSub_Detail.Cancel;

  end;

  if FrmData.QAcesso.FieldByName('ALTERACAO').AsString = 'NÃO' then
  begin
    Application.MessageBox('Usuário sem permissão para alteração', PChar(Msg_Title), mb_IconStop);
    Botoes_Normal;
    Consulta.TabVisible := True;
    exit;
  end;


  VALOR_ITENS.Value    := 0;
  VALOR_PECAS.Value    := 0;
  VALOR_SERVICOS.Value := 0;

  QSub_Detail.First;
  while not QSub_Detail.Eof do
  begin
    if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
      VALOR_PECAS.Value := VALOR_PECAS.Value + QSub_Detail.FieldByName('VR_TOTAL').AsFloat;

    if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'S' then
      VALOR_SERVICOS.Value := VALOR_SERVICOS.Value + QSub_Detail.FieldByName('VR_TOTAL').AsFloat;

    VALOR_ITENS.Value := VALOR_ITENS.Value + QSub_Detail.FieldByName('VR_TOTAL').AsFloat;

    Application.ProcessMessages;

    QSub_Detail.Next;
  end;

 // btnSaveClick(Self);
  btnEditClick(Self);

  if DT_RETORNO.CanFocus then
    DT_RETORNO.SetFocus
  else
    Botoes_Normal;
end;

procedure TFrmOrdem_Servico_Salao.ItensKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F4) and (QSub_Detail.State = dsBrowse) and (not QSub_Detail.IsEmpty) then
    QSub_Detail.Delete;

  if (Key = Vk_F7) and ((Itens.SelectedField.FieldName = 'codigo_item') or (Itens.SelectedField.FieldName = 'tributo_id')) and (QSub_Detail.State in [dsInsert, dsEdit]) then
  begin
    if QSub_Detail.FieldByName('tp_prod_serv').AsString = 'P' then
    begin
      if Itens.SelectedField.FieldName = 'codigo_item' then
        QSub_Detail.FieldByName('CODIGO_ITEM').AsInteger := GetConsulta('ESTOQUE', StrToInt(EMPRESA_ID.Text), StrToInt(CLIENTE_ID.Text), QSub_Detail.FieldByName('CODIGO_ITEM').AsInteger);

      if Itens.SelectedField.FieldName = 'tributo_id' then
        QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger := GetConsulta('TRIBUTOS', 0, 0, QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger);
    end;

    if QSub_Detail.FieldByName('tp_prod_serv').AsString = 'S' then
    begin
      if Itens.SelectedField.FieldName = 'codigo_item' then
        QSub_Detail.FieldByName('CODIGO_ITEM').AsInteger := GetConsulta('SERVIÇOS', 0, 0, QSub_Detail.FieldByName('CODIGO_ITEM').AsInteger);
    end;
  end;

  if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);
    
  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QSub_Detail.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmOrdem_Servico_Salao.ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];
end;

procedure TFrmOrdem_Servico_Salao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmOrdem_Servico_Salao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') or (QSub_Detail.State in [dsInsert, dsEdit]) then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;
end;

procedure TFrmOrdem_Servico_Salao.FormCreate(Sender: TObject);
var
X, Ult_Dia: Integer;
begin

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TABELAS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');

  IQuery.ParamByName('TIPO_TABELA').AsString := 'S';

  IQuery.Prepare;
  IQuery.Open;

  STATUS.Items.Clear;

  IQuery.First;
  while not IQuery.Eof do
  begin
    STATUS.Items.Add(Copy(IQuery.FieldByName('DESCRICAO').AsString, 1, 15));

    Application.ProcessMessages;
    IQuery.Next;
  end;

  DBGrid1.Columns[0].Width := 50;
  DBGrid1.Columns[1].Width := 79;
  DBGrid1.Columns[2].Width := 79;
  DBGrid1.Columns[3].Width := 227;
  DBGrid1.Columns[4].Width := 109;
  DBGrid1.Columns[5].Width := 144;

  Ult_Dia := StrToInt(Copy(DateToStr(Ult_Dia_Mes(FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime)), 1, 2));
  Dias.Tabs.Clear;

  for X := 1 to Ult_Dia do
    Dias.Tabs.Add(IntToStr(X));

  Dias.Tabs.Add('Todos');

  DT_MOVIMENTO.MinDate := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  DT_MOVIMENTO.MaxDate := StrToDate('31/12/2026');

  Itens.Columns[0].Width  := 30;
  Itens.Columns[1].Width  := 40;
  Itens.Columns[2].Width  := 320;
  Itens.Columns[3].Width  := 54;
  Itens.Columns[4].Width  := 54;
  Itens.Columns[5].Width  := 64;

  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (ORDEM_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
  CmdOrderBy    := 'ORDER BY ORDEM_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

  QTabela.Prepare;
  QTabela.Open;

  Botoes_Normal;
  Consulta.Show;


end;

procedure TFrmOrdem_Servico_Salao.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
  
end;

end.
