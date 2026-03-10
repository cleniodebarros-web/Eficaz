unit UOrdem_Servico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Tabs, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, Mask, Buttons, DBCtrls, rxCurrEdit, rxToolEdit,
  IBUpdateSQL, Math, QRCtrls, QuickRpt, QRPrntr, RDprint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.jpeg;

type
  TFrmOrdem_Servico = class(TForm)
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
    Label26: TLabel;
    FUNCIONARIO: TCurrencyEdit;
    btnVendedor: TSpeedButton;
    DBText6: TDBText;
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
    Label8: TLabel;
    UF: TComboBox;
    Label10: TLabel;
    CEP: TMaskEdit;
    btnPesquisa: TBitBtn;
    btnOrdem: TBitBtn;
    HORAS: TMaskEdit;
    Label6: TLabel;
    Label11: TLabel;
    NO_ORDEM: TCurrencyEdit;
    Label12: TLabel;
    TELEFONE: TMaskEdit;
    Label13: TLabel;
    APARELHO: TEdit;
    Label14: TLabel;
    NUM_SERIE: TEdit;
    Label17: TLabel;
    DEFEITO: TEdit;
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
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText26: TQRDBText;
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
    QRLabel1: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText20: TQRDBText;
    btnCheck_List: TBitBtn;
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
    TIPO_ATENDIMENTO: TComboBox;
    Label25: TLabel;
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
    INSCRICAO: TEdit;
    Label28: TLabel;
    CNPJ: TMaskEdit;
    QRLabel230: TQRLabel;
    QRDBText47: TQRDBText;
    Label29: TLabel;
    btnCentro_Custo: TSpeedButton;
    C_CUSTO_ID: TCurrencyEdit;
    Label30: TLabel;
    ATENDENTE: TCurrencyEdit;
    btnAtendente: TSpeedButton;
    Label31: TLabel;
    DT_FECHAMENTO: TDateEdit;
    VALOR_SERVICOS: TRxCalcEdit;
    VALOR_PECAS: TRxCalcEdit;
    DataAtendente: TDataSource;
    DBText3: TDBText;
    QRLabel231: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel232: TQRLabel;
    QRDBText49: TQRDBText;
    RDprint1: TRDprint;
    CheckBox1: TCheckBox;
    DBText4: TDBText;
    Label32: TLabel;
    H_FECHAMENTO: TMaskEdit;
    BitBtn1: TBitBtn;
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
    Label33: TLabel;
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
    Lacres: TTabSheet;
    Grid_OrdemLacre: TDBGrid;
    QOrdem_Lacre: TFDQuery;
    DataOrdemLacre: TDataSource;
    StatusBar3: TStatusBar;
    TabSheet1: TTabSheet;
    Label34: TLabel;
    Inmetro: TEdit;
    Label35: TLabel;
    Portaria: TEdit;
    Label36: TLabel;
    COND_PAGTO: TComboBox;
    BitBtn2: TBitBtn;
    TabSheet2: TTabSheet;
    Label37: TLabel;
    DT_NSERVICO: TDateEdit;
    NNOTA_SERVICO: TEdit;
    Label38: TLabel;
    QRLabel331: TQRLabel;
    QRDBText70: TQRDBText;
    Memo_obs: TQRMemo;
    Label39: TLabel;
    CONTA_ID: TCurrencyEdit;
    btnConta: TSpeedButton;
    DBText5: TDBText;
    Qconta: TFDQuery;
    DataConta: TDataSource;
    QrLogo: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel332: TQRLabel;
    QRDBText71: TQRDBText;
    QRLabel333: TQRLabel;
    QRDBText72: TQRDBText;
    QRLabel334: TQRLabel;
    QRDBText73: TQRDBText;
    QRLabel335: TQRLabel;
    QRDBText74: TQRDBText;
    QRLabel336: TQRLabel;
    QRLabel337: TQRLabel;
    QRLabel338: TQRLabel;
    QRLabel339: TQRLabel;
    QRLabel340: TQRLabel;
    QRLabel329: TQRLabel;
    QRLabel330: TQRLabel;
    QRLabel341: TQRLabel;
    QRLabel342: TQRLabel;
    QRLabel343: TQRLabel;
    QRDBText1: TQRDBText;
    QMsg_Adicional: TQRMemo;
    QRDBText63: TQRDBText;
    Memo_Lacre1: TQRMemo;
    Memo_Lacre2: TQRMemo;
    LB_PRIORIDADE: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel344: TQRLabel;
    QRDBText8: TQRDBText;
    Label40: TLabel;
    Empresa_id_rateio: TCurrencyEdit;
    btnempresarateio: TSpeedButton;
    DBText7: TDBText;
    DataEmpresaRateio: TDataSource;
    QEmpresa_Rateio: TFDQuery;
    ValorP_Rateio2: TRxCalcEdit;
    Valors_Rateio2: TRxCalcEdit;
    TabSheet3: TTabSheet;
    Valors_Rateio1: TRxCalcEdit;
    ValorP_Rateio1: TRxCalcEdit;
    Label41: TLabel;
    Label42: TLabel;
    QControle_Registro: TFDQuery;
    QUpdate: TFDQuery;
    QRCompositeReport1: TQRCompositeReport;
    Espaco: TQuickRep;
    MeiaPagina: TCheckBox;
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
    procedure btnAtendenteClick(Sender: TObject);
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
    procedure BitBtn2Click(Sender: TObject);
    procedure OrdemBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure btnContaClick(Sender: TObject);
    procedure CONTA_IDExit(Sender: TObject);
    procedure btnempresarateioClick(Sender: TObject);
    procedure Empresa_id_rateioExit(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
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
    procedure controle_registro(tabela:STRING;chave_id,TP:Integer);
    procedure VerificaNovaPagina;
  end;

var
  FrmOrdem_Servico: TFrmOrdem_Servico;
  Operacao: String;
  ID, ID_TRANSACAO, linha, pagina: Integer;
  Desc_por:Real;
const

  Pagamento: Array[1..11] of String = ('BOLETO 7 DIAS','BOLETO 7/14 DIAS','BOLETO 14 DIAS','BOLETO 14/21 DIAS','BOLETO 14/21/28 DIAS','CARTÃO 1X','CARTÃO 2 X','CARTÃO 3 X','DINHEIRO','CARTÃO DEBITO','PIX');

implementation

uses
  UPrincipal, UData, UConsulta, UPesquisa, UAgenda_Ordem_Servico, UCheck_List_Moto,URel_ProdutosRetidosOs,UGerente,UCheck_List_informatica;

{$R *.dfm}

procedure  TFrmOrdem_Servico.controle_registro(tabela:STRING;chave_id,TP:Integer);
Begin
 // SHOWMESSAGE(INTTOSTR(TP));
 // SHOWMESSAGE(INTTOSTR(chave_id));
 // SHOWMESSAGE(tabela);

  IF TP  = 0 Then
  Begin
  QControle_Registro.Sql.Clear;
  QControle_Registro.Sql.Text := 'SELECT * FROM CONTROLE_REGISTRO ' +
                                 'LEFT JOIN FUNCIONARIOS ON FUNCIONARIOS.FUNCIONARIO_ID = CONTROLE_REGISTRO.USUARIO_ID ' +
                                 'WHERE TABELA = :TABELA AND CHAVE_ID = :CHAVE_ID';

  QControle_Registro.ParamByName('TABELA').AsString    := tabela;
  QControle_Registro.ParamByName('CHAVE_ID').AsInteger := chave_id;
  QControle_Registro.Prepare;
  QControle_Registro.Open;



    if (not QControle_Registro.IsEmpty) AND (QControle_Registro.FieldByName('CONEXAO_ID').AsInteger  <> id_conexao_banco)    then
    Begin
      Itens.Enabled        := False;
      btnEdit.Enabled      := False;
      btnDelete.Enabled    := False;
      btnOrdem.Enabled     := False;
      CheckBox1.Enabled    := False;
      Application.MessageBox(PChar('Ordem Serviço: ' + IntToStr(chave_id) + #13 +'Aberto por: ' + QControle_Registro.FieldByName('NOME').AsString + #13 + 'Favor aguardar liberação do registro.'), PChar(Msg_Title), MB_ICONINFORMATION);

    End
    Else
    Begin

     if QControle_Registro.IsEmpty Then
     Begin

     QUpdate.Sql.Clear;
     QUpdate.Sql.Text := 'INSERT INTO CONTROLE_REGISTRO(CHAVE_ID,TABELA,DT_CHAVE,HR_CHAVE,USUARIO_ID,CONEXAO_ID) ' +
                         'VALUES(:CHAVE_ID,''ORDEM SERVICO'',:DT_CHAVE,:HR_CHAVE,:USUARIO_ID,:CONEXAO_ID)';
     QUpdate.ParamByName('CHAVE_ID').AsInteger := chave_id;
     QUpdate.ParamByName('DT_CHAVE').AsDate := Date;
     QUpdate.ParamByName('HR_CHAVE').AsTime := time;
     QUpdate.ParamByName('USUARIO_ID').AsInteger :=  FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
     QUpdate.ParamByName('CONEXAO_ID').AsInteger :=  id_conexao_banco;

     QUpdate.Prepare;
     QUpdate.ExecSQL;

     End;

    End;
  End
  Else
  Begin

   QUpdate.Sql.Clear;
   QUpdate.Sql.Text := 'DELETE FROM CONTROLE_REGISTRO WHERE CONEXAO_ID = :CONEXAO_ID ' +
                       'AND TABELA = ''ORDEM SERVICO'' ';
   //QUpdate.ParamByName('CHAVE_ID').AsInteger   := chave_id;
   //QUpdate.ParamByName('USUARIO_ID').AsInteger := QTabela.FieldByName('VENDEDOR_ID').AsInteger;
   QUpdate.ParamByName('CONEXAO_ID').AsInteger := id_conexao_banco;
   QUpdate.Prepare;
   QUpdate.ExecSQL;

  End;



End;

procedure TFrmOrdem_Servico.CLIENTE_IDExit(Sender: TObject);
begin
  DetailSearch('Cliente');

  if NOME_CLIENTE.Text <> '' then
    TIPO_ATENDIMENTO.SetFocus;
end;

procedure TFrmOrdem_Servico.ConsultaShow(Sender: TObject);
begin
  Botoes_Normal;
end;

procedure TFrmOrdem_Servico.CONTA_IDExit(Sender: TObject);
begin
DetailSearch('Conta');

end;

procedure TFrmOrdem_Servico.ATENDENTEExit(Sender: TObject);
begin
  DetailSearch('Atendente');
end;

procedure TFrmOrdem_Servico.BitBtn1Click(Sender: TObject);
begin
TFrmRel_ProdutosRetidosOS.Create(Application);
end;

procedure TFrmOrdem_Servico.BitBtn2Click(Sender: TObject);
begin
QTabela.Refresh;
Set_Campos(FALSE);
end;

procedure TFrmOrdem_Servico.Botoes_Disable;
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
  btnCheck_List.Enabled   := False;
  btnAgenda.Enabled       := False;
  btnCentro_Custo.Enabled := False;
  btnAtendente.Enabled    := False;
  btnConta.Enabled        := False;
end;

procedure TFrmOrdem_Servico.Botoes_Editing;
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
  btnCheck_List.Enabled   := False;
  btnAgenda.Enabled       := False;
  btnCentro_Custo.Enabled := True;
  btnAtendente.Enabled    := True;
  btnConta.Enabled        := True;
end;

procedure TFrmOrdem_Servico.Botoes_Normal;
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

  if not QTabela.IsEmpty then
  begin
    btnEdit.Enabled       := True;
    btnDelete.Enabled     := True;
    btnOrdem.Enabled      := True;
    btnCheck_List.Enabled := True;
    btnAgenda.Enabled     := True;
  end
  else
  begin
    btnEdit.Enabled       := False;
    btnDelete.Enabled     := False;
    btnOrdem.Enabled      := False;
    btnCheck_List.Enabled := False;
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
  btnAtendente.Enabled    := False;
  btnConta.Enabled        := False;
end;

procedure TFrmOrdem_Servico.DetailSearch(Tabela: String);
begin
  if ((Tabela = '') or (Tabela = 'Empresa')) and (EMPRESA_ID.Text <> '') then
  begin
    QEmpresa.Close;

    QEmpresa.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);

    QEmpresa.Prepare;
    QEmpresa.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Empresa_Rateio')) and (EMPRESA_ID_Rateio.Text <> '') then
  begin
    QEmpresa_Rateio.Close;

    QEmpresa_Rateio.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID_Rateio.Text);

    QEmpresa_Rateio.Prepare;
    QEmpresa_Rateio.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Cliente')) and (CLIENTE_ID.Text <> '') then
  begin
    QCliente.Close;

    QCliente.ParamByName('CLIENTE_ID').AsInteger := StrToInt(CLIENTE_ID.Text);

    QCliente.Prepare;
    QCliente.Open;

    if not QCliente.IsEmpty then
    begin
      INSCRICAO.Text    := QCliente.FieldByName('INSCRICAO').AsString;
      CNPJ.Text         := QCliente.FieldByName('CNPJ').AsString;
      NOME_CLIENTE.Text := QCliente.FieldByName('NOME').AsString;
      ENDERECO.Text     := QCliente.FieldByName('ENDERECO').AsString;
      NUMERO.Text       := QCliente.FieldByName('NUMERO').AsString;
      BAIRRO.Text       := QCliente.FieldByName('BAIRRO').AsString;
      MUNICIPIO.Text    := QCliente.FieldByName('MUNICIPIO').AsString;
      UF.Text           := QCliente.FieldByName('ESTADO').AsString;
      CEP.Text          := QCliente.FieldByName('CEP').AsString;
      TELEFONE.Text     := QCliente.FieldByName('DDD').AsString + Copy(QCliente.FieldByName('TELEFONE_1').AsString,1,10);
    end;
  end;

  if ((Tabela = '') or (Tabela = 'Vendedor')) and (FUNCIONARIO.Text <> '') then
  begin
    QVendedor.Close;

    QVendedor.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(FUNCIONARIO.Text);

    QVendedor.Prepare;
    QVendedor.Open;
  end;

  if ((Tabela = '') or (Tabela = 'Conta')) and (CONTA_ID.Text <> '') then
  begin
    QConta.Close;
    QConta.ParamByName('TABELA_ID').AsInteger := StrToInt(CONTA_ID.Text);
    QConta.Prepare;
    QConta.Open;
  end;


  if ((Tabela = '') or (Tabela = 'Atendente')) and (ATENDENTE.Text <> '') then
  begin
    QAtendente.Close;

    QAtendente.ParamByName('FUNCIONARIO_ID').AsInteger := StrToInt(ATENDENTE.Text);

    QAtendente.Prepare;
    QAtendente.Open;
  end;

end;

procedure TFrmOrdem_Servico.DiasClick(Sender: TObject);
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

procedure TFrmOrdem_Servico.DT_ORDEMEnter(Sender: TObject);
begin
  Keybd_Event(VK_LEFT, 0, 0, 0);
end;

procedure TFrmOrdem_Servico.DT_ORDEMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) or (Key = Vk_Down) then
    Perform(Wm_NextDlgctl, 0, 0);

  if Key = Vk_Up then
    Perform(Wm_NextDlgctl, 1, 0);
end;

procedure TFrmOrdem_Servico.Habilitar(Status: Boolean);
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

procedure TFrmOrdem_Servico.Insert;
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

procedure TFrmOrdem_Servico.Edit;
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

procedure TFrmOrdem_Servico.ProdutoSearch;
begin
  QProduto.Close;
  QProduto.ParamByName('PRODUTO_ID').AsInteger := QSub_Detail.FieldByName('CODIGO_ITEM').AsInteger;
  QProduto.ParamByName('EMPRESA_ID').AsInteger := StrToInt(EMPRESA_ID.Text);
  QProduto.Prepare;
  QProduto.Open;
end;

procedure TFrmOrdem_Servico.ServicoSearch;
begin
  QServico.Close;
  QServico.ParamByName('SERVICO_ID').AsInteger := QSub_Detail.FieldByName('CODIGO_ITEM').AsInteger;
  QServico.Prepare;
  QServico.Open;
end;

procedure TFrmOrdem_Servico.TIPO_ATENDIMENTOChange(Sender: TObject);
begin
 //if (Tipo_Atendimento.Text = 'CONTRATO') then
 // Status.Items.Add('FATURADO')
 // Else

 Begin
  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TABELAS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');

  if FrmData.QAcesso.FieldByName('LIBERA').AsString <> 'SIM' then
  Begin
  IQuery.Sql.Add('AND (DESCRICAO <> :DESCRICAO)');
  IQuery.ParamByName('DESCRICAO').AsString := 'FATURADO';
  End;

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
 End;


end;

procedure TFrmOrdem_Servico.TributoSearch;
begin
  QTributo.Close;
  QTributo.ParamByName('TRIBUTO_ID').AsInteger := QSub_Detail.FieldByName('TRIBUTO_ID').AsInteger;
  QTributo.Prepare;
  QTributo.Open;
end;

procedure TFrmOrdem_Servico.EMPRESA_IDExit(Sender: TObject);
begin
  DetailSearch('Empresa');
end;

procedure TFrmOrdem_Servico.EMPRESA_IDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F7) and (Sender = EMPRESA_ID) then
    btnEmpresaClick(Self);

  if (Key = Vk_F7) and (Sender = CLIENTE_ID) then
    btnClienteClick(Self);

  if (Key = Vk_F7) and (Sender = FUNCIONARIO) then
    btnVendedorClick(Self);

  if (Key = Vk_F7) and (Sender = CONTA_ID) then
    btnContaClick(Self);

  if (Key = Vk_F7) and (Sender = C_CUSTO_ID) then
    btnCentro_CustoClick(Self);

  if (Key = Vk_F7) and (Sender = ATENDENTE) then
    btnAtendenteClick(Self);

  if (Key = Vk_F7) and (Sender = EMPRESA_ID_RATEIO) then
    btnempresarateioClick(Self);

  if Key = Vk_Return then
    Perform(Wm_NextDlgctl, 0, 0);
end;

procedure TFrmOrdem_Servico.Empresa_id_rateioExit(Sender: TObject);
begin
  DetailSearch('Empresa_Rateio');
end;

function TFrmOrdem_Servico.Validacao: Boolean;
var
pgto : string;
Cad_pagto :Boolean;
begin


  Result := False;

  CLIENTE_ID.Color       := clWindow;
  EMPRESA_ID.Color       := clWindow;
  STATUS.Color           := clWindow;
  FUNCIONARIO.Color      := clWindow;
  UF.Color               := clWindow;
  TIPO_ATENDIMENTO.Color := clWindow;
  ATENDENTE.Color        := clWindow;
  C_CUSTO_ID.Color       := clWindow;
  Conta_ID.Color         := clWindow;
  COND_PAGTO.Color  := clWindow;

  if CLIENTE_ID.Value > 0 then
  begin
    if QCliente.IsEmpty then
    begin
      Application.MessageBox('Cliente inexistente.', PChar(Msg_Title), mb_IconStop);

      CLIENTE_ID.Color := clYellow;
      CLIENTE_ID.SetFocus;

      exit;
    end;
  end;

  if QEmpresa.IsEmpty then
  begin
    Application.MessageBox('Empresa inexistente.', PChar(Msg_Title), mb_IconStop);

    EMPRESA_ID.Color := clYellow;
    EMPRESA_ID.SetFocus;

    exit;
  end;

  if ATENDENTE.Value >= 0 then
  begin
    if QAtendente.IsEmpty then
    begin
      Application.MessageBox('Atendente inexistente.', PChar(Msg_Title), mb_IconStop);

      ATENDENTE.Color := clYellow;
      ATENDENTE.SetFocus;

      exit;
    end;
  end;

  if FUNCIONARIO.Value > 0 then
  begin
    if QVendedor.IsEmpty then
    begin
      Application.MessageBox('Técnico inexistente.', PChar(Msg_Title), mb_IconStop);

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

  IQuery.ParamByName('TIPO_TABELA').AsString := 'T';
  IQuery.ParamByName('DESCRICAO').AsString   := TIPO_ATENDIMENTO.Text;

  IQuery.Prepare;
  IQuery.Open;

  if IQuery.IsEmpty then
  begin
    Application.MessageBox('Tipo de Atendimento inválido.', PChar(Msg_Title), mb_IconStop);

    TIPO_ATENDIMENTO.Color := clYellow;
    TIPO_ATENDIMENTO.SetFocus;

    exit;
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
    Application.MessageBox('Status inválido.', PChar(Msg_Title), mb_IconStop);

    STATUS.Color := clYellow;
    STATUS.SetFocus;

    exit;
  end;

  if not ChecaEstado(UF.Text) then
  begin
    Application.MessageBox('Estado inválido.', PChar(Msg_Title), mb_IconStop);

    UF.Color := clYellow;
    UF.SetFocus;

    exit;
  end;

  if C_CUSTO_ID.Value > 0 then
  begin
    IQuery.Sql.Clear;
    IQuery.Sql.Add('SELECT * FROM TABELAS');
    IQuery.Sql.Add('WHERE');
    IQuery.Sql.Add('(TABELA_ID = :TABELA_ID)');
    IQuery.Sql.Add('AND (TIPO_TABELA = :TIPO_TABELA)');
    IQuery.Sql.Add('AND (STATUS = :STATUS)');

    IQuery.ParamByName('TABELA_ID').AsInteger  := StrToInt(C_CUSTO_ID.Text);
    IQuery.ParamByName('TIPO_TABELA').AsString := '2';
    IQuery.ParamByName('STATUS').AsString      := 'A';

    IQuery.Prepare;
    IQuery.Open;

    if IQuery.IsEmpty then
    begin
      Application.MessageBox('Centro de Custo inexistente', PChar(Msg_Title), mb_IconStop);

      C_CUSTO_ID.Color := clYellow;
      C_CUSTO_ID.SetFocus;

      exit;
    end;
  end;

  if Tipo_Atendimento.Text = 'SERVIÇO APROVADO' Then
  Begin
    cad_pagto := False;
    for pgto in Pagamento do
   //if (COND_PAGTO.Text <> 'A VISTA') AND (COND_PAGTO.Text <> 'A PRAZO') AND (COND_PAGTO.Text <> 'CHEQUE') AND (COND_PAGTO.Text <> 'CARTAO') AND (COND_PAGTO.Text <> 'PIX')
    begin
      IF COND_PAGTO.TEXT = pgto tHEN
      Cad_Pagto := True;
    end;

    if not Cad_pagto Then
    Begin
      Application.MessageBox('Cond. de Pagto. inválida', PChar(Msg_Title), mb_IconStop);
      COND_PAGTO.Color := clYellow;
      COND_PAGTO.SetFocus;
      exit;
    End;

  End;



  if (Status.Text = 'EXECUTADA') AND ((Tipo_Atendimento.Text = 'SISTEMA CONTRATO') OR (Tipo_Atendimento.Text = 'SERVIÇO CONTRATO')) then
    Begin
        if FrmGerente = Nil then
        begin
          Application.CreateForm(TFrmGerente, FrmGerente);
          try
            if FrmGerente.ShowModal = mrOK then
            begin
              if FrmGerente.QOperador.FieldByName('STATUS_OS').AsString <> 'True' then
              begin
               Application.MessageBox('Operador sem permissão para alterar status O.S.', 'Ordem de Serviço', MB_IconStop + MB_OK);
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
               Application.MessageBox('Operador sem permissão para alterar status O.S.', 'Ordem de Serviço', MB_IconStop + MB_OK);
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

  if (Conta_ID.Value > 0) and (QConta.IsEmpty) and (Status.Text = 'FATURADO')   then
  begin
    Application.MessageBox('Conta Estoque inexistente', PChar(Msg_Title), mb_IconStop);
    Conta_ID.Color := clYellow;
    Conta_ID.SetFocus;
    exit;
  end;

  if No_ordem.Value = 0 then
  Begin
   Application.MessageBox('Favor definir prioridade para a Ordem de Serviço.', 'Ordem de Serviço', MB_IconStop + MB_OK);
   No_Ordem.SetFocus;
   No_Ordem.Color := clYellow;
   Exit;
  End;

  if FrmPrincipal.Config.FieldByName('DESC_ORC_USU').AsString = 'True' then
  Begin
  Desc_por := 0;

    if Desconto.Value > 0 then
       Desc_Por := RoundTo(((Desconto.Value * 100) / (Valor_itens.Value)), -2)
    else
       Desc_Por  := 0;

        IQuery.SQL.Clear;
        IQuery.SQL.Add('SELECT * FROM OPERADORES WHERE NOME LIKE :NOME');
        IQuery.ParamByName('NOME').AsString :=  COPY(QAtendente.FieldByName('NOME').AsString,1,19) + '%';
        IQuery.Prepare;
        IQuery.Open;

   { if (IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat = 0) and (Vr_Desconto.Value > 0) then
    begin
        Application.MessageBox(Pchar('Vr. Desconto máximo permitido para ' +  IQuery.FieldByName('NOME').AsString + ' ' + ': '+ IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsString +'%') , PChar(Msg_Title), mb_IconStop);
        VR_DESCONTO.Color := clYellow;
        VR_DESCONTO.SetFocus;
        abort;
    end; }

      if IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat >= 0 then
      begin
        if Desconto.Value > (((Valor_itens.Value) * IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat) / 100) then
        begin
          Application.MessageBox(Pchar('Vr. Desconto máximo permitido para ' +  IQuery.FieldByName('NOME').AsString + ' ' + ': '+ IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsString +'%') , PChar(Msg_Title), mb_IconStop);

          if FrmGerente = Nil then
          begin
            Application.CreateForm(TFrmGerente, FrmGerente);
            try
              if FrmGerente.ShowModal = mrOK then
               begin
                if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat then
                begin
                 Application.MessageBox('Desconto acima do máximo permitido', 'Ordem de Serviço', MB_IconStop + MB_OK);
                 DESCONTO.Color := clYellow;
                 DESCONTO.SetFocus;
                 Exit;
                end;
                Result := True;
              end
              else
                DESCONTO.Color := clYellow;
                DESCONTO.SetFocus;
                Exit;
            finally

            end;
          end
          else
          begin
            if FrmGerente.ShowModal = mrOK then
            begin
              if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat then
              begin
                Application.MessageBox('Desconto acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                DESCONTO.Color := clYellow;
                DESCONTO.SetFocus;
                Exit;
              end;
              Result :=  True;
            end
            else
              DESCONTO.Color := clYellow;
              DESCONTO.SetFocus;
              Exit;
          end;
        end;
      end;
  End;


  Result := True;
end;

procedure TFrmOrdem_Servico.FUNCIONARIOExit(Sender: TObject);
begin
  DetailSearch('Vendedor');
end;

procedure TFrmOrdem_Servico.Grid_OrdemLacreKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (Key = Vk_F4) and (QSub_Detail.State = dsBrowse) and (not QSub_Detail.IsEmpty) then
    QSub_Detail.Delete;

if Key = VK_F9 then
    Perform(Wm_NextDlgCtl, 0, 0);

  if ((Key = Vk_Up) or (Key = Vk_Down)) and (QSub_Detail.State in [dsInsert, dsEdit]) then
    Key := 0;
end;

procedure TFrmOrdem_Servico.ManutencaoShow(Sender: TObject);
begin
  Set_Campos(False);
  Botoes_Normal;
  if NO_ORDEM.value = 0 then
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
  End;

  //OrcDados.Show;

  CONTROLE_REGISTRO('ORDEM SERVICO',QTabela.FieldByName('ORDEM_ID').AsInteger,0);

end;

procedure TFrmOrdem_Servico.NO_ORDEMExit(Sender: TObject);
begin
if No_ordem.Value > 10 Then
  Begin
  Application.MessageBox('Níveis válidos: 1,2,3.','Ordem de Serviço', MB_IconStop + MB_OK);
  No_ordem.Color := clYellow;
  No_ordem.SetFocus;
  End;
  if NO_ORDEM.value = 0 then
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

end;

procedure TFrmOrdem_Servico.OrdemBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  //if FileExists(FrmPrincipal.QEmpresa.FieldByName('LOGO_EMPRESA').AsString ) then
  //  QrLogo.Picture.LoadFromFile(FrmPrincipal.QEmpresa.FieldByName('LOGO_EMPRESA').AsString);
  FrmPrincipal.QEmpresa.Refresh;
  if FrmPrincipal.QEmpresa.CreateBlobStream(FrmPrincipal.QEmpresa.FieldByName('LOGO_STREAM'),bmRead).Size > 0 then
    QrLogo.Picture.Graphic.LoadFromStream(FrmPrincipal.QEmpresa.CreateBlobStream(FrmPrincipal.QEmpresa.FieldByName('LOGO_STREAM'),bmRead));

  memo_Obs.Lines.Clear;
  memo_Obs.Lines.Text := QTabela.FieldByName('OBSERVACAO').AsString;

  if Memo_Lacre1.Lines.Text = '' then
  begin
    Memo_obs.Top := Memo_Lacre1.Top;
    Memo_Lacre1.Transparent := True;
    Memo_Lacre2.Transparent := True;
    QRBand2.Height := 64;
  end
  else
  begin
    Memo_obs.Top := 48;
    Memo_Lacre1.Transparent := False;
    Memo_Lacre2.Transparent := False;
    QRBand2.Height := 101;
  end;

end;

procedure TFrmOrdem_Servico.QOrdem_LacreBeforeDelete(DataSet: TDataSet);
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

procedure TFrmOrdem_Servico.QOrdem_LacreBeforeEdit(DataSet: TDataSet);
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

procedure TFrmOrdem_Servico.QOrdem_LacreBeforeInsert(DataSet: TDataSet);
begin
   if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;
end;

procedure TFrmOrdem_Servico.QOrdem_LacreNewRecord(DataSet: TDataSet);
begin
DataSet['ORDEM_ID']     := QTabela.FieldByName('ORDEM_ID').AsInteger;
end;

procedure TFrmOrdem_Servico.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
          if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Automóvel' then
             QRLabel23.Caption := 'Assinatura do Mecânico ______________________________________________';
end;

procedure TFrmOrdem_Servico.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  if QCliente.IsEmpty then
  begin
  QRLabel25.Caption :=  'Cliente: '+ NOME_CLIENTE.Text;
  QRLabel26.Caption :=  'Inscr. Est.: '+ INSCRICAO.Text;
  QRLabel31.Caption :=  'Endereço: '+ ENDERECO.Text + ',' + NUMERO.Text;
  QRLabel32.Caption :=  'Cidade: '+ MUNICIPIO.Text;
  QRLabel33.Caption :=  'Cnpj/Cpf: '+ CNPJ.Text;
  QRLabel34.Caption :=  'Bairro: '+ BAIRRO.Text;
  QRLabel35.Caption :=  'Cep: '+ CEP.Text;
  QRLabel36.Caption :=  'Telefone: '+ TELEFONE.Text;
  end;

  if QCheckList_Moto.FieldByName('CHECK_LIST').AsInteger = 0 then
    QRLabel197.Left := 162
  else if QCheckList_Moto.FieldByName('CHECK_LIST').AsInteger = 1 then
    QRLabel197.Left := 234
  else if QCheckList_Moto.FieldByName('CHECK_LIST').AsInteger = 2 then
    QRLabel197.Left := 306
  else
    QRLabel197.Enabled := False;

  if QCheckList_Moto.FieldByName('ESTADO_PINTURA').AsInteger = 0 then
    QRLabel199.Left := 162
  else if QCheckList_Moto.FieldByName('ESTADO_PINTURA').AsInteger = 1 then
    QRLabel199.Left := 234
  else if QCheckList_Moto.FieldByName('ESTADO_PINTURA').AsInteger = 2 then
    QRLabel199.Left := 306
  else
    QRLabel199.Enabled := False;

  if QCheckList_Moto.FieldByName('TAMPA_LAT_ESQ').AsInteger = 0 then
    QRLabel200.Left := 162
  else if QCheckList_Moto.FieldByName('TAMPA_LAT_ESQ').AsInteger = 1 then
    QRLabel200.Left := 234
  else if QCheckList_Moto.FieldByName('TAMPA_LAT_ESQ').AsInteger = 2 then
    QRLabel200.Left := 306
  else
    QRLabel200.Enabled := False;

  if QCheckList_Moto.FieldByName('TAMPA_LAT_DIR').AsInteger = 0 then
    QRLabel201.Left := 162
  else if QCheckList_Moto.FieldByName('TAMPA_LAT_DIR').AsInteger = 1 then
    QRLabel201.Left := 234
  else if QCheckList_Moto.FieldByName('TAMPA_LAT_DIR').AsInteger = 2 then
    QRLabel201.Left := 306
  else
    QRLabel201.Enabled := False;

  if QCheckList_Moto.FieldByName('TANQUE_COMB').AsInteger = 0 then
    QRLabel202.Left := 162
  else if QCheckList_Moto.FieldByName('TANQUE_COMB').AsInteger = 1 then
    QRLabel202.Left := 234
  else if QCheckList_Moto.FieldByName('TANQUE_COMB').AsInteger = 2 then
    QRLabel202.Left := 306
  else
    QRLabel202.Enabled := False;

  if QCheckList_Moto.FieldByName('PARALAMA_DIANT').AsInteger = 0 then
    QRLabel203.Left := 162
  else if QCheckList_Moto.FieldByName('PARALAMA_DIANT').AsInteger = 1 then
    QRLabel203.Left := 234
  else if QCheckList_Moto.FieldByName('PARALAMA_DIANT').AsInteger = 2 then
    QRLabel203.Left := 306
  else
    QRLabel203.Enabled := False;

  if QCheckList_Moto.FieldByName('RETROVISOR_ESQ').AsInteger = 0 then
    QRLabel204.Left := 162
  else if QCheckList_Moto.FieldByName('RETROVISOR_ESQ').AsInteger = 1 then
    QRLabel204.Left := 234
  else if QCheckList_Moto.FieldByName('RETROVISOR_ESQ').AsInteger = 2 then
    QRLabel204.Left := 306
  else
    QRLabel204.Enabled := False;

  if QCheckList_Moto.FieldByName('RETROVISOR_DIR').AsInteger = 0 then
    QRLabel205.Left := 162
  else if QCheckList_Moto.FieldByName('RETROVISOR_DIR').AsInteger = 1 then
    QRLabel205.Left := 234
  else if QCheckList_Moto.FieldByName('RETROVISOR_DIR').AsInteger = 2 then
    QRLabel205.Left := 306
  else
    QRLabel205.Enabled := False;

  if QCheckList_Moto.FieldByName('PISCA_TRASEIRO').AsInteger = 0 then
    QRLabel206.Left := 162
  else if QCheckList_Moto.FieldByName('PISCA_TRASEIRO').AsInteger = 1 then
    QRLabel206.Left := 234
  else if QCheckList_Moto.FieldByName('PISCA_TRASEIRO').AsInteger = 2 then
    QRLabel206.Left := 306
  else
    QRLabel206.Enabled := False;

  if QCheckList_Moto.FieldByName('PISCA_DIANTEIRO').AsInteger = 0 then
    QRLabel207.Left := 162
  else if QCheckList_Moto.FieldByName('PISCA_DIANTEIRO').AsInteger = 1 then
    QRLabel207.Left := 234
  else if QCheckList_Moto.FieldByName('PISCA_DIANTEIRO').AsInteger = 2 then
    QRLabel207.Left := 306
  else
    QRLabel207.Enabled := False;

  if QCheckList_Moto.FieldByName('FAROLETE').AsInteger = 0 then
    QRLabel208.Left := 162
  else if QCheckList_Moto.FieldByName('FAROLETE').AsInteger = 1 then
    QRLabel208.Left := 234
  else if QCheckList_Moto.FieldByName('FAROLETE').AsInteger = 2 then
    QRLabel208.Left := 306
  else
    QRLabel208.Enabled := False;

  if QCheckList_Moto.FieldByName('MANETE').AsInteger = 0 then
    QRLabel209.Left := 162
  else if QCheckList_Moto.FieldByName('MANETE').AsInteger = 1 then
    QRLabel209.Left := 234
  else if QCheckList_Moto.FieldByName('MANETE').AsInteger = 2 then
    QRLabel209.Left := 306
  else
    QRLabel209.Enabled := False;

  if QCheckList_Moto.FieldByName('MANICOTO').AsInteger = 0 then
    QRLabel210.Left := 162
  else if QCheckList_Moto.FieldByName('MANICOTO').AsInteger = 1 then
    QRLabel210.Left := 234
  else if QCheckList_Moto.FieldByName('MANICOTO').AsInteger = 2 then
    QRLabel210.Left := 306
  else
    QRLabel210.Enabled := False;

  if QCheckList_Moto.FieldByName('JOGO_FERRAMENTA').AsInteger = 0 then
    QRLabel211.Left := 162
  else if QCheckList_Moto.FieldByName('JOGO_FERRAMENTA').AsInteger = 1 then
    QRLabel211.Left := 306
  else
    QRLabel211.Enabled := False;

  if QCheckList_Moto.FieldByName('ELASTICOS').AsInteger = 0 then
    QRLabel212.Left := 162
  else if QCheckList_Moto.FieldByName('ELASTICOS').AsInteger = 1 then
    QRLabel212.Left := 306
  else
    QRLabel212.Enabled := False;

  if QCheckList_Moto.FieldByName('FLANELA').AsInteger = 0 then
    QRLabel213.Left := 162
  else if QCheckList_Moto.FieldByName('FLANELA').AsInteger = 1 then
    QRLabel213.Left := 306
  else
    QRLabel213.Enabled := False;

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

procedure TFrmOrdem_Servico.QRCompositeReport1AddReports(Sender: TObject);
begin
  QRCompositeReport1.Reports.Add(Ordem);
  QRCompositeReport1.Reports.Add(Espaco);
  QRCompositeReport1.Reports.Add(Ordem);
end;

procedure TFrmOrdem_Servico.QSub_DetailAfterOpen(DataSet: TDataSet);
begin
TFloatField(QSub_Detail.FieldByName('VR_DESCONTO')).DisplayFormat := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('VR_TOTAL')).DisplayFormat    := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('QUANTIDADE')).DisplayFormat  := '#,##0.00';
TFloatField(QSub_Detail.FieldByName('VR_UNITARIO')).DisplayFormat := '#,##0.00';
end;

procedure TFrmOrdem_Servico.QSub_DetailBeforeDelete(DataSet: TDataSet);
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

procedure TFrmOrdem_Servico.QSub_DetailBeforeEdit(DataSet: TDataSet);
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

procedure TFrmOrdem_Servico.QSub_DetailBeforeInsert(DataSet: TDataSet);
begin
  if QTabela.FieldByName('DT_MOVIMENTO').AsDateTime < FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime then
  begin
    Application.MessageBox('Movimento já encerrado', PChar(Msg_Title), mb_IconStop);
    abort;
  end;
end;

procedure TFrmOrdem_Servico.QSub_DetailBeforePost(DataSet: TDataSet);
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
    Itens.SelectedIndex := 3;
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
  {
  if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
  begin
    if (QProduto.FieldByName('DESC_MAXIMO').AsFloat > 0) and (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > QProduto.FieldByName('DESC_MAXIMO').AsFloat) then
    begin
      Application.MessageBox('Vr. Desconto não pode ser maior do que o desconto máximo permitido para o item', PChar(Msg_Title), mb_IconStop);
      Itens.SelectedIndex := 9;
      abort;
    end;
  end;
  }
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

procedure TFrmOrdem_Servico.QSub_DetailNewRecord(DataSet: TDataSet);
begin
  DataSet['ORDEM_ID']     := QTabela.FieldByName('ORDEM_ID').AsInteger;
  DataSet['TP_PROD_SERV'] := 'P';
  DataSet['CONTA_ID']     := QTabela.FieldByName('CONTA_ID').AsInteger;
end;

procedure TFrmOrdem_Servico.RDprint1BeforeNewPage(Sender: TObject;
  Pagina: Integer);
begin
  RDprint1.Imp(63, 01, '================================================================================');
  RDprint1.Imp(64, 01, 'Eficaz Automação e Sistemas Ltda');
  RDprint1.ImpDir(64, 33, 80, 'http://www.eficazautomacao.com.br', []);
  RDprint1.Imp(66,01,' ');
end;

procedure TFrmOrdem_Servico.RDprint1NewPage(Sender: TObject; Pagina: Integer);
begin
  linha := 3;
end;

procedure TFrmOrdem_Servico.Set_Campos(Vazio: Boolean);
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


    end;
  end;

  QSub_Detail.Close;
  QSub_Detail.ParamByName('ORDEM_ID').AsInteger := QTabela.FieldByName('ORDEM_ID').AsInteger;
  QSub_Detail.Prepare;
  QSub_Detail.Open;

  QOrdem_Lacre.Close;
  QOrdem_Lacre.ParamByName('ORDEM_ID').AsInteger := QTabela.FieldByName('ORDEM_ID').AsInteger;
  QOrdem_Lacre.Prepare;
  QOrdem_Lacre.Open;


  if QTabela.IsEmpty then
  Begin
    Itens.Enabled := False;
    Grid_ordemLacre.Enabled := False;
  End
  else
  Begin
    Itens.Enabled := True;
    Grid_ordemLacre.Enabled := True;
  End;


  DetailSearch('');
end;

procedure TFrmOrdem_Servico.STATUSChange(Sender: TObject);
begin
   {
  if (STATUS.Text = 'EXECUTADA') OR (STATUS.Text = 'ENTREGUE')  then
  Begin
  DT_FECHAMENTO.Date := DATE;
  H_FECHAMENTO.Text := TimeToStr(Time);
  End;
  }

  if (STATUS.Text = 'FATURADO') then
  begin
  DT_NSERVICO.ReadOnly   := False;
  NNOTA_SERVICO.ReadOnly := False;
  DT_FECHAMENTO.Date     := DATE;
  H_FECHAMENTO.Text      := TimeToStr(Time);
  end
  Else
  begin
  DT_NSERVICO.ReadOnly   := True;
  NNOTA_SERVICO.ReadOnly := True;
  end;


end;

procedure TFrmOrdem_Servico.btnDeleteClick(Sender: TObject);
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

procedure TFrmOrdem_Servico.btnDiscardClick(Sender: TObject);
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

procedure TFrmOrdem_Servico.btnEditClick(Sender: TObject);
Var
Temservico : Boolean;
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

  QSub_Detail.First;
  while not QSub_Detail.Eof do
  begin

   if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'S' then
   Temservico := True;

   QSub_Detail.Next;

  end;

  if (QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0) and (not Temservico) then
  begin
    Application.MessageBox(PChar('Ordem de Serviço faturado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
    //abort;
  end;

  if (Temservico) and (QTabela.FieldByName('TRANSACAO_ID').AsInteger > 0)  AND (QTabela.FieldByName('DT_NSERVICO').AsDateTime  > StrTodate('01/01/2020')) AND
     (QTabela.FieldByName('NNOTA_SERVICO').AsString <> '')  then
  Begin
   Application.MessageBox(PChar('Ordem de Serviço faturado na transação ' + QTabela.FieldByName('TRANSACAO_ID').AsString), PChar(Msg_Title), mb_IconStop);
   //abort;
  End;

  Operacao := 'Alterando';

  ID := QTabela.FieldByName('ORDEM_ID').AsInteger;
  ID_TRANSACAO := QTabela.FieldByName('TRANSACAO_ID').AsInteger;

  Botoes_Editing;
  Habilitar(True);
  Itens.Enabled := False;
  Grid_OrdemLacre.enabled := False;

  Consulta.TabVisible := False;

   if FrmData.QAcesso.FieldByName('LIBERA').AsString = 'SIM' then
  Begin
    DT_NSERVICO.ReadOnly   := False;
    NNOTA_SERVICO.ReadOnly := False;
    DT_FECHAMENTO.ReadOnly := False;
    H_FECHAMENTO.ReadOnly  := False;
  End;


  DT_ORDEM.SetFocus;

  OrcDados.Show;

end;

procedure TFrmOrdem_Servico.btnEmpresaClick(Sender: TObject);
begin
  try
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID.Text));
  except
    EMPRESA_ID.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;
end;

procedure TFrmOrdem_Servico.btnempresarateioClick(Sender: TObject);
begin
try
    EMPRESA_ID_RATEIO.Value := GetConsulta('EMPRESAS', 0, 0, StrToInt(EMPRESA_ID_RATEIO.Text));
  except
    EMPRESA_ID_RATEIO.Value := GetConsulta('EMPRESAS', 0, 0, 0);
  end;

end;

procedure TFrmOrdem_Servico.btnAgendaClick(Sender: TObject);
begin
  Ver_Agenda_Ordem_Servico(QTabela.FieldByName('FUNCIONARIO').AsInteger);
end;

procedure TFrmOrdem_Servico.btnAtendenteClick(Sender: TObject);
begin
  try
    ATENDENTE.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(ATENDENTE.Text));
  except
    ATENDENTE.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmOrdem_Servico.btnCentro_CustoClick(Sender: TObject);
begin
  try
    C_CUSTO_ID.Value := GetConsulta('CCUSTO', 0, 0, StrToInt(C_CUSTO_ID.Text));
  except
    C_CUSTO_ID.Value := GetConsulta('CCUSTO', 0, 0, 0);
  end;
end;

procedure TFrmOrdem_Servico.btnCheck_ListClick(Sender: TObject);
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

procedure TFrmOrdem_Servico.btnClienteClick(Sender: TObject);
begin
  try
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, StrToInt(CLIENTE_ID.Text));
  except
    CLIENTE_ID.Value := GetConsulta('CLIENTES', 0, 0, 0);
  end;
end;

procedure TFrmOrdem_Servico.btnContaClick(Sender: TObject);
begin
  try
    CONTA_ID.Value := GetConsulta('PLANO', 0, 0, StrToInt(CONTA_ID.Text));
  except
    CONTA_ID.Value := GetConsulta('PLANO', 0, 0, 0);
  end;

end;

procedure TFrmOrdem_Servico.btnInsertClick(Sender: TObject);
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
  Grid_OrdemLacre.Enabled := False;
  
  QEmpresa.Close;
  QCliente.Close;
  QSub_Detail.Close;

  UF.Text           := FrmPrincipal.QEmpresa.FieldByName('ESTADO').AsString;
  DT_ORDEM.Date     := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  HORAS.Text        := Copy(TimeToStr(time), 1, 5);
  DT_MOVIMENTO.Date := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  EMPRESA_ID.Value  := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;
  FUNCIONARIO.Value := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
  ATENDENTE.Value   := FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger;
  STATUS.Text       :='ABERTA';

  Consulta.TabVisible := False;

  if LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento') <> '' then

  OBSERVACAO.Text :=LeIni(Arq_Ini, 'Sistema', 'Mensagem Orçamento');

  DT_ORDEM.SetFocus;
  OrcDados.Show;
end;

procedure TFrmOrdem_Servico.btnNextClick(Sender: TObject);
begin
  if not QTabela.Eof then
  begin
    QTabela.Next;
    Set_Campos(False);
    ManutencaoShow(Manutencao);
  end;
  Botoes_Normal;

end;

procedure TFrmOrdem_Servico.VerificaNovaPagina;
begin
  if linha > RDprint1.TamanhoQteLinhas  then
  Begin
    RDprint1.Novapagina;
    Pagina := Pagina + 1;
  End;
end;

procedure TFrmOrdem_Servico.btnOrdemClick(Sender: TObject);
begin
  Set_Campos(False);

  Botoes_Normal;
  Pagina := 0;

  if (LeIni(Arq_Ini, 'Sistema', 'Imp. Orçamento') = 'RDPrint')  then //or (LeIni(Arq_Ini, 'Sistema', 'Imp. Recebimento') = 'RDPrint')
  Begin
  if CheckBox1.Checked = True then
    Begin
      RDprint1.Impressora := HP;
      RDprint1.FonteTamanhoPadrao := S10cpp;
    End;
    RDprint1.OpcoesPreview.Preview     := True;
    RDprint1.MostrarProgresso          := True;
    RDprint1.Acentuacao                := SemAcento;
    RDprint1.TamanhoQteLinhas          := 61;
    RDprint1.FonteTamanhoPadrao        := S10cpp;
    RDprint1.Abrir;
    Pagina := Pagina + 1;

      IF NO_ORDEM.Value < 10 Then
      Begin
      RDprint1.Imp(02, 01, FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(02, (length(FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString) + 1), 80, 'Eficaz Automação e Sistemas Ltda - ME', []);
      RDprint1.Imp(03, 01, 'E-mail: ' + FrmPrincipal.QEmpresa.FieldByName('EMAIL').AsString);

      RDprint1.Imp(04, 01, Copy(FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString,1,28));
      RDprint1.Imp(04, 30, 'N:' + Copy(FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString,1,5));
      RDprint1.Imp(04, 37, Copy (FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString,1,15));
      RDprint1.Imp(04, 55, Copy(FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString,1,15));
      RDprint1.Imp(04, 72, FrmPrincipal.QEmpresa.FieldByName('CEP').AsString);
      RDprint1.Imp(05, 01, 'Cnpj.:' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString);
      RDprint1.Imp(05, 30, 'I.E.: ' + FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString);
      RDprint1.Imp(05, 55, 'Fone: ' + FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString);
      RDprint1.Imp(06, 01, 'Data: ' + DateToStr(date) + ' - ' + TimeToStr(now));
      End
      Else
      Begin
      IQuery.Sql.Clear;
      IQuery.Sql.Text := 'SELECT * FROM EMPRESAS WHERE EMPRESA_ID = :EMPRESA_CABECALHO';
      IQuery.ParamByName('EMPRESA_CABECALHO').AsInteger := FrmPrincipal.Config.FieldByName('FUNC_SALAO').AsInteger;
      IQuery.Prepare;
      IQuery.Open;

      RDprint1.Imp(02, 01, IQuery.FieldByName('RAZAO').AsString);
      RDprint1.ImpDir(02, (length(IQuery.FieldByName('RAZAO').AsString) + 1), 80, 'Eficaz Automação e Sistemas Ltda - ME', []);
      RDprint1.Imp(03, 01, 'E-mail: ' + FrmPrincipal.QEmpresa.FieldByName('EMAIL').AsString);

      RDprint1.Imp(04, 01, Copy(IQuery.FieldByName('ENDERECO').AsString,1,28));
      RDprint1.Imp(04, 30, 'N:' + Copy(IQuery.FieldByName('NUMERO').AsString,1,5));
      RDprint1.Imp(04, 37, Copy (IQuery.FieldByName('BAIRRO').AsString,1,15));
      RDprint1.Imp(04, 55, Copy(IQuery.FieldByName('MUNICIPIO').AsString,1,15));
      RDprint1.Imp(04, 72, IQuery.FieldByName('CEP').AsString);
      RDprint1.Imp(05, 01, 'Cnpj.:' + IQuery.FieldByName('CNPJ').AsString);
      RDprint1.Imp(05, 30, 'I.E.: ' + IQuery.FieldByName('INSCR_ESTADUAL').AsString);
      RDprint1.Imp(05, 55, 'Fone: ' + IQuery.FieldByName('TELEFONE').AsString);
      RDprint1.Imp(06, 01, 'Data: ' + DateToStr(date) + ' - ' + TimeToStr(now));

      End;



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
      RDPrint1.Imp(17,20,Copy(QTabela.FieldByName('APARELHO').AsString, 1, 60));
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
      RDPrint1.Imp(23,01,'Data Fechamento.:');
      RDPrint1.Imp(23,20,DateToStr(QTabela.FieldByName('DT_FECHAMENTO').AsDateTime));
      RDPrint1.Imp(24,01,'Horas:');
      RDPrint1.Imp(24,20,QTabela.FieldByName('H_FECHAMENTO').AsString);

      RDprint1.Imp(25, 01, 'Garantia.:');
      RDprint1.Imp(25, 20, QTabela.FieldByName('GARANTIA').AsString);

      RDprint1.Imp(26, 01, '--------------------------------------------------------------------------------');
      RDprint1.Imp(27, 01, 'Cód.    Descrição                      Quantidade  Pr.Unt.   Desc.Unt. Pr. Total');
      RDprint1.Imp(28, 01, '--------------------------------------------------------------------------------');
      Linha := 29;

    while not QSub_Detail.Eof do
    Begin
    RDprint1.Imp(linha,01,QSub_Detail.FieldByName('CODIGO_ITEM').AsString);
    RDprint1.Imp(linha,9,Copy(QSub_Detail.FieldByName('DESCRICAO').AsString ,1,24));
    RDprint1.ImpVal(linha,38,'###,##0.00',QSub_Detail.FieldByName('QUANTIDADE').AsFloat,[]);
    RDprint1.ImpVal(linha,48,'###,##0.00',QSub_Detail.FieldByName('VR_UNITARIO').AsFloat,[]);
    RDprint1.ImpVal(linha,58,'###,##0.00',QSub_Detail.FieldByName('VR_DESCONTO').AsFloat,[]);
    RDprint1.ImpVal(linha,68,'###,##0.00',QSub_Detail.FieldByName('VR_TOTAL').AsFloat,[]);
    inc(linha);
    QSub_Detail.Next;
    VerificaNovaPagina;
    End;
    RDprint1.Imp(linha,70,'__________');
    inc(linha);
    VerificaNovaPagina;

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
       VerificaNovaPagina;
       RDPrint1.Imp(linha,01,'Lacre Retirado 2º:');
       RDPrint1.Imp(linha,19,QOrdem_Lacre.FieldByName('L_RETIRADO2').AsString);
       RDPrint1.Imp(linha,35,'Lacre Aplicado 2º:');
       RDPrint1.Imp(linha,53,QOrdem_Lacre.FieldByName('L_APLICADO2').AsString);
       End;

       inc(linha);
       VerificaNovaPagina;
       RDPrint1.Imp(linha,01,'Etiqueta Retirada:');
       RDPrint1.Imp(linha,19,QOrdem_Lacre.FieldByName('E_RETIRADO').AsString);
       RDPrint1.Imp(linha,35,'Etiqueta Aplicada:');
       RDPrint1.Imp(linha,53,QOrdem_Lacre.FieldByName('E_APLICADO').AsString);
       QOrdem_lacre.Next;
      End;
       inc(linha);
       VerificaNovaPagina;
       RDPrint1.Imp(linha,01,'Portaria         :');
       RDPrint1.Imp(linha,19,QTabela.FieldByName('PORTARIA').AsString);
       RDPrint1.Imp(linha,35,'Inmetro          :');
       RDPrint1.Imp(linha,53,QTabela.FieldByName('INMETRO').AsString);
      inc(linha);
      inc(linha);
      VerificaNovaPagina;
    End;

  RDprint1.Imp(linha ,01, 'Observação:');
  RDprint1.Imp(linha,13,Copy(QTabela.FieldByName('OBSERVACAO').AsString,1,40));
  RDprint1.Imp(linha,54,'Sub-Total');
  RDprint1.ImpVal(linha,66,'###,###,##0.00',QTabela.FieldByName('VALOR_ITENS').AsFloat,[]);
  inc(linha);
  VerificaNovaPagina;
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,41,52));
  RDprint1.Imp(linha,54,'Desconto');
  RDprint1.ImpVal(linha,66,'###,###,##0.00',QTabela.FieldByName('DESCONTO').AsFloat,[]);
  inc(linha);
  VerificaNovaPagina;
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,93,52));
  RDprint1.Imp(linha,54,'Valor');
  RDprint1.ImpVal(linha,66,'###,###,##0.00',QTabela.FieldByName('VALOR').AsFloat,[]);
  inc(linha);
  VerificaNovaPagina;
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,145,52));
  inc(linha);
  VerificaNovaPagina;
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,197,52));
  inc(linha);
  VerificaNovaPagina;
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,249,52));
  inc(linha);
  VerificaNovaPagina;
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,301,52));
  inc(linha);
  VerificaNovaPagina;
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,353,52));
  inc(linha);
  VerificaNovaPagina;
  RDprint1.Imp(linha,01,Copy(QTabela.FieldByName('OBSERVACAO').AsString,405,52));
  inc(linha);
  VerificaNovaPagina;
  RDprint1.Imp(linha,01,'--------------------------------------------------------------------------------');
  inc(linha);
  VerificaNovaPagina;
  RDprint1.Imp(linha,01,'Autorizo a Execucao Desta');
  inc(linha);
  VerificaNovaPagina;
  RDprint1.Imp(linha,01,'Assinatura do Cliente:_____________________________________' );
  linha := linha + 3;
  VerificaNovaPagina;

   if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Automóvel' then
      RDprint1.Imp(linha,01,'Assinatura do Mecânico:_____________________________________' )
   else
      RDprint1.Imp(linha,01,'Assinatura do Tecnico:_____________________________________' );


  inc(linha);
  VerificaNovaPagina;
  RDprint1.Imp(linha,23,QVendedor.FieldByName('NOME').AsString);
  inc(linha);
  inc(linha);
  VerificaNovaPagina;
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

    if LeIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço') <> '' Then
    Begin
      QMsg_Adicional.Enabled := True;
      QMsg_Adicional.Lines.Clear;
      QMsg_Adicional.Lines.Add(LeIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço'));
      QMsg_Adicional.Lines.Add(LeIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço 1'));
      QMsg_Adicional.Lines.Add(LeIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço 2'));
      QMsg_Adicional.Lines.Add(LeIni(Arq_Ini, 'Sistema', 'Mensagem Ordem Serviço 3'));
      ChildBand1.Height := 232;
    End
    Else
    begin
      QMsg_Adicional.Enabled := False;
      ChildBand1.Height := 107;
      Ordem.Height := ChildBand1.Top + ChildBand1.Height + 20;
    end;

    if QTabela.FieldByName('NO_ORDEM').AsInteger = 1  then
      Lb_Prioridade.Caption := 'A'
    Else if QTabela.FieldByName('NO_ORDEM').AsInteger = 2  then
       Lb_Prioridade.Caption := 'B'
    Else if QTabela.FieldByName('NO_ORDEM').AsInteger = 3  then
       Lb_Prioridade.Caption := 'C'
    Else
    Lb_Prioridade.Caption    := '';

      IF NO_ORDEM.Value < 10 Then
      Begin
      QRLabel329.Caption   := FrmPrincipal.QEmpresa.FieldByName('ENDERECO').AsString + ', ' + FrmPrincipal.QEmpresa.FieldByName('NUMERO').AsString + ' - ' +
                            FrmPrincipal.QEmpresa.FieldByName('BAIRRO').AsString + ' - ' +
                            FrmPrincipal.QEmpresa.FieldByName('MUNICIPIO').AsString + ' - CEP ' +
                            FrmPrincipal.QEmpresa.FieldByName('CEP').AsString;
      QRLabel330.Caption   := 'CNPJ: ' + FrmPrincipal.QEmpresa.FieldByName('CNPJ').AsString + ' - I. E. ' +
                            FrmPrincipal.QEmpresa.FieldByName('INSCR_ESTADUAL').AsString;

      QRLabel341.Caption   :='Fone/Celular: ' +
                             FrmPrincipal.QEmpresa.FieldByName('TELEFONE').AsString + '/' + FrmPrincipal.QEmpresa.FieldByName('CELULAR').AsString ;

      QRLabel342.Caption  := FrmPrincipal.QEmpresa.FieldByName('RAZAO').AsString;

      End
      Else
      Begin

      IQuery.Sql.Clear;
      IQuery.Sql.Text := 'SELECT * FROM EMPRESAS WHERE EMPRESA_ID = :EMPRESA_CABECALHO';
      IQuery.ParamByName('EMPRESA_CABECALHO').AsInteger := FrmPrincipal.Config.FieldByName('FUNC_SALAO').AsInteger;
      IQuery.Prepare;
      IQuery.Open;




      QRLabel329.Caption   :=IQuery.FieldByName('ENDERECO').AsString + ', ' + IQuery.FieldByName('NUMERO').AsString + ' - ' +
                            IQuery.FieldByName('BAIRRO').AsString + ' - ' +
                            IQuery.FieldByName('MUNICIPIO').AsString + ' - CEP ' +
                            IQuery.FieldByName('CEP').AsString;
      QRLabel330.Caption   := 'CNPJ: ' + IQuery.FieldByName('CNPJ').AsString + ' - I. E. ' +
                            IQuery.FieldByName('INSCR_ESTADUAL').AsString;

      QRLabel341.Caption   :='Fone/Celular: ' +
                            IQuery.FieldByName('TELEFONE').AsString + '/' + IQuery.FieldByName('CELULAR').AsString ;

      QRLabel342.Caption   := IQuery.FieldByName('RAZAO').AsString;
      End;

    if not QOrdem_Lacre.IsEmpty then
    Begin
     Memo_Lacre1.lines.Clear;
     Memo_Lacre2.lines.Clear;

     QOrdem_Lacre.First;
      while not QOrdem_Lacre.Eof do
      Begin

       Memo_Lacre1.lines.add('Lacre Retirado      : ' + QOrdem_Lacre.FieldByName('L_RETIRADO').AsString);
       Memo_Lacre2.lines.add('Lacre Lacre Aplicado: ' + QOrdem_Lacre.FieldByName('L_APLICADO').AsString);
       if QOrdem_Lacre.FieldByName('L_RETIRADO2').AsString <> '' then
       Begin
       Memo_Lacre1.lines.add('Lacre Retirado 2º   : ' + QOrdem_Lacre.FieldByName('L_RETIRADO2').AsString);
       Memo_Lacre2.lines.add('Lacre Aplicado 2º   : ' + QOrdem_Lacre.FieldByName('L_APLICADO2').AsString);
       End;
       if QOrdem_Lacre.FieldByName('E_RETIRADO').AsString <> '' then
       Begin
       Memo_Lacre1.lines.add('Etiqueta Retirada   : ' + QOrdem_Lacre.FieldByName('E_RETIRADO').AsString);
       Memo_Lacre2.lines.add('Etiqueta Aplicada   : ' + QOrdem_Lacre.FieldByName('E_APLICADO').AsString);
       End;

       Memo_Lacre1.lines.add('Portaria            : ' + QTabela.FieldByName('PORTARIA').AsString);
       Memo_Lacre2.lines.add('Inmetro             : ' + QTabela.FieldByName('INMETRO').AsString);

       {
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

      }
      QOrdem_Lacre.Next;

      End;

    End
    Else
    Begin
     Memo_Lacre1.lines.Clear;
     Memo_Lacre2.lines.Clear;
    End;

    if not MeiaPagina.Checked then
    begin
      Ordem.Page.PaperSize := A4;
      Ordem.PreviewModal;
    end
    else
    begin
      Ordem.Page.PaperSize := Custom;
      QRCompositeReport1.Preview;
    end;
  end
  else
   Application.MessageBox(PChar('Informe a largura e altura do papel.'), PChar(Msg_Title), mb_IconInformation);

end;

procedure TFrmOrdem_Servico.btnPesquisaClick(Sender: TObject);
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

procedure TFrmOrdem_Servico.btnPriorClick(Sender: TObject);
begin
  if not QTabela.Bof then
  begin
    CONTROLE_REGISTRO('ORDEM SERVICO',QTabela.FieldByName('ORDEM_ID').AsInteger,1);
    QTabela.Prior;
    Set_Campos(False);
    ManutencaoShow(Manutencao);
  end;
  Botoes_Normal;

  if not QTabela.Bof then
  CONTROLE_REGISTRO('ORDEM SERVICO',QTabela.FieldByName('ORDEM_ID').AsInteger,0);

end;

procedure TFrmOrdem_Servico.btnRetornaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOrdem_Servico.btnSaveClick(Sender: TObject);
Var
Temservico : Boolean;
begin
  DetailSearch('');

  if Validacao then
  begin

    VALOR.Value := VALOR_ITENS.Value - DESCONTO.Value;

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
    Begin

     QSub_Detail.First;
     while not QSub_Detail.Eof do
     begin
      if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'S' then
      Temservico := True;

     QSub_Detail.Next
     end;

     if (Temservico) and (ID_TRANSACAO > 0)  AND (DT_NSERVICO.Date > StrTodate('01/01/2020')) AND (NNOTA_SERVICO.Text <> '')  then

      STATUS.Text := 'FATURADO';

     Edit;


    End;

    Set_Campos(False);

    if QTabela.IsEmpty then
    begin
      QEmpresa.Close;
      QCliente.Close;
    end;

    Habilitar(False);
    Botoes_Normal;

    Operacao := '';
    Consulta.TabVisible := True;

    if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Moto' then
      btnCheck_ListClick(Sender);

    If (FrmPrincipal.Config.FieldByName('AUDITORIA').AsString = 'True') and (valor.value > 0) Then
       GravarLog('ORDEM_SERVIÇO','EDITAR',DateToStr(date),TimeToStr(time),'ORDEM_ID ' , IntToStr(QTabela.FieldByName('ORDEM_ID').AsInteger),FloatToStr(Valor.Value) + ' Documento: ' + InttoStr(QTabela.FieldByName('ORDEM_ID').AsInteger)  ,FrmData.QAcesso.FieldByName('FUNCIONARIO_ID').AsInteger,QTabela.FieldByName('CLIENTE_ID').AsInteger);

  end;
end;

procedure TFrmOrdem_Servico.btnVendedorClick(Sender: TObject);
begin
  try
    FUNCIONARIO.Value := GetConsulta('PESSOAL', 0, 0, StrToInt(FUNCIONARIO.Text));
  except
    FUNCIONARIO.Value := GetConsulta('PESSOAL', 0, 0, 0);
  end;
end;

procedure TFrmOrdem_Servico.DBGrid1DblClick(Sender: TObject);
begin
  Manutencao.Show;
end;

procedure TFrmOrdem_Servico.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmOrdem_Servico.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
      CmdSelectNull := 'WHERE (NOME_CLIENTE ILIKE :NOME_CLIENTE) AND (EMPRESA_ID = :EMPRESA_ID)';
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
      CmdSelectNull := 'WHERE (NUM_SERIE ILIKE :NUM_SERIE) AND (EMPRESA_ID = :EMPRESA_ID)';
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

procedure TFrmOrdem_Servico.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Manutencao.Show;
end;

procedure TFrmOrdem_Servico.DBGrid1TitleClick(Column: TColumn);
begin
  CmdOrderBy := 'ORDER BY ' + Column.FieldName;

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;
  QTabela.Open;
end;

procedure TFrmOrdem_Servico.ItensColEnter(Sender: TObject);
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

procedure TFrmOrdem_Servico.ItensColExit(Sender: TObject);
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


      if Itens.SelectedField.FieldName = 'vr_unitario' then
      begin

        if FrmPrincipal.Config.FieldByName('LIBERA_VALOR_UNITARIO_OS').AsString <> 'True' then
        begin
          if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'S' then
          Begin
            ServicoSearch;
            if QSub_Detail.FieldByName('VR_UNITARIO').AsFloat < QServico.FieldByName('PRECO').AsFloat Then
            Begin

              Application.MessageBox('Valor unitário inferior ao preço do serviço', PChar(Msg_Title), mb_IconStop);
              QSub_Detail.FieldByName('VR_UNITARIO').AsFloat := QServico.FieldByName('PRECO').AsFloat;
              Itens.SelectedIndex := 5;
              abort;

            End;
          End
          Else
          Begin
            ProdutoSearch;
            if QSub_Detail.FieldByName('VR_UNITARIO').AsFloat < QProduto.FieldByName('PRECO_VAREJO').AsFloat Then
            Begin

              Application.MessageBox('Valor unitário inferior ao preço do produto', PChar(Msg_Title), mb_IconStop);
              QSub_Detail.FieldByName('VR_UNITARIO').AsFloat := QProduto.FieldByName('PRECO_VAREJO').AsFloat;
              Itens.SelectedIndex := 5;
              abort;

            End;
          End;
        end;

      end;

      if Itens.SelectedField.FieldName = 'quantidade' then
      begin
         ProdutoSearch;

        if (QSub_Detail.FieldByName('QUANTIDADE').AsFloat <= 0) or (QSub_Detail.FieldByName('QUANTIDADE').AsFloat > 99999) then
        begin
          Application.MessageBox('Quantidade inválida', PChar(Msg_Title), mb_IconStop);
          Itens.SelectedIndex := 3;
          abort;
        end;


        if QProduto.FieldbyName('FRACAO_VENDA').AsFloat > 0 then
          QSub_Detail.FieldByName('QUANTIDADE').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * QProduto.FieldByName('FRACAO_VENDA').AsFloat);

      end;



      // Desconto por produto/serviço
      if Itens.SelectedField.FieldName = 'vr_desconto' then
      begin

        if FrmPrincipal.Config.FieldByName('DESCONTOS_PRODUTOS').AsString = 'True'  then
        Begin
        ProdutoSearch;
        ServicoSearch;
        Desc_por := 0;

          if QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > 0 then
             Desc_Por := RoundTo(((QSub_Detail.FieldByName('VR_DESCONTO').AsFloat * 100) / (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat)), -2)
          else
             Desc_Por  := 0;

              IQuery.SQL.Clear;
              IQuery.SQL.Add('SELECT * FROM OPERADORES WHERE NOME LIKE :NOME');
              IQuery.ParamByName('NOME').AsString := Copy(Qvendedor.FieldByName('NOME').AsString,1,20) ;
              IQuery.Prepare;
              IQuery.Open;
           {
          if (IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsFloat = 0) and (QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > 0) then
          begin
              Application.MessageBox(Pchar('Vr. Desconto máximo permitido para ' +  IQuery.FieldByName('NOME').AsString + ' ' + ': '+ IQuery.FieldByName('DESCONTO_MAX_SUBTOTAL').AsString +'%') , PChar(Msg_Title), mb_IconStop);
              Itens.SelectedIndex := 5;
              abort;
          end;
          }
            if QProduto.FieldbyName('DESC_MAXIMO').AsFloat > 0 then
            begin

              //SHOWMESSAGE('DESCONTO..');
              //SHOWMESSAGE(FloatToStr((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * QProduto.FieldbyName('DESC_MAXIMO').AsFloat) / 100)));

              if QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > (((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat ) * QProduto.FieldbyName('DESC_MAXIMO').AsFloat) / 100) then
              begin
                Application.MessageBox(Pchar('Vr. Desconto máximo permitido para o produto:' + #13 +  QProduto.FieldByName('DESCRICAO').AsString + ' ' + ': '+ QProduto.FieldbyName('DESC_MAXIMO').AsString +'%/R$' + FloatToStr((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat) * QProduto.FieldbyName('DESC_MAXIMO').AsFloat) / 100)) ) , PChar(Msg_Title), mb_IconStop);

                if FrmGerente = Nil then
                begin
                  Application.CreateForm(TFrmGerente, FrmGerente);
                  try
                    if FrmGerente.ShowModal = mrOK then
                    begin
                      if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_ITEM').AsFloat then
                      begin
                        Application.MessageBox('Desconto acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                       Itens.SelectedIndex := 6;
                       abort;
                      end;
                    QSub_Detail.FieldByName('VR_TOTAL').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat));
                    Itens.SelectedIndex := 7;
                    end
                    else
                      Itens.SelectedIndex := 6;
                      abort;
                  finally

                  end;
                end
                else
                begin
                  if FrmGerente.ShowModal = mrOK then
                  begin
                    if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_ITEM').AsFloat then
                    begin
                      Application.MessageBox('Desconto acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                      Itens.SelectedIndex := 6;
                      abort;
                    end;
                  QSub_Detail.FieldByName('VR_TOTAL').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat));
                  Itens.SelectedIndex := 7;
                  end
                  else
                    Itens.SelectedIndex := 6;
                    abort;
                end;
              end;

              QSub_Detail.FieldByName('VR_TOTAL').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat));
              Itens.SelectedIndex := 7;
            end;

            if QServico.FieldbyName('DESC_MAXIMO').AsFloat > 0 then
            begin

              //SHOWMESSAGE('DESCONTO..');
              //SHOWMESSAGE(FloatToStr((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat * QSub_Detail.FieldByName('QUANTIDADE').AsFloat) * QProduto.FieldbyName('DESC_MAXIMO').AsFloat) / 100)));

              if QSub_Detail.FieldByName('VR_DESCONTO').AsFloat > (((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat ) * QServico.FieldbyName('DESC_MAXIMO').AsFloat) / 100) then
              begin
                Application.MessageBox(Pchar('Vr. Desconto máximo permitido para o Serviço:' + #13 +  QServico.FieldByName('DESCRICAO').AsString + ' ' + ': '+ QServico.FieldbyName('DESC_MAXIMO').AsString +'%/R$' + FloatToStr((((QSub_Detail.FieldByName('VR_UNITARIO').AsFloat) * QServico.FieldbyName('DESC_MAXIMO').AsFloat) / 100)) ) , PChar(Msg_Title), mb_IconStop);

                if FrmGerente = Nil then
                begin
                  Application.CreateForm(TFrmGerente, FrmGerente);
                  try
                    if FrmGerente.ShowModal = mrOK then
                    begin
                      if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_ITEM').AsFloat then
                      begin
                        Application.MessageBox('Desconto acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                       Itens.SelectedIndex := 6;
                       abort;
                      end;
                    QSub_Detail.FieldByName('VR_TOTAL').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat));
                    Itens.SelectedIndex := 7;
                    end
                    else
                      Itens.SelectedIndex := 6;
                      abort;
                  finally

                  end;
                end
                else
                begin
                  if FrmGerente.ShowModal = mrOK then
                  begin
                    if Desc_Por > FrmGerente.QOperador.FieldByName('DESCONTO_MAX_ITEM').AsFloat then
                    begin
                      Application.MessageBox('Desconto acima do máximo permitido', 'Orçamento', MB_IconStop + MB_OK);
                      Itens.SelectedIndex := 6;
                      abort;
                    end;
                  QSub_Detail.FieldByName('VR_TOTAL').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat));
                  Itens.SelectedIndex := 7;
                  end
                  else
                    Itens.SelectedIndex := 6;
                    abort;
                end;
              end;

              QSub_Detail.FieldByName('VR_TOTAL').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat));
              Itens.SelectedIndex := 7;
            end;

        End;
      end;

      QSub_Detail.FieldByName('VR_TOTAL').AsFloat := (QSub_Detail.FieldByName('QUANTIDADE').AsFloat * (QSub_Detail.FieldByName('VR_UNITARIO').AsFloat - QSub_Detail.FieldByName('VR_DESCONTO').AsFloat));
    end;
  end;
end;

procedure TFrmOrdem_Servico.ItensEnter(Sender: TObject);
begin
  Botoes_Disable;
  Consulta.TabVisible := False;
end;

procedure TFrmOrdem_Servico.ItensExit(Sender: TObject);
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


  VALOR_ITENS.Value     := 0;
  VALOR_PECAS.Value     := 0;
  VALOR_SERVICOS.Value  := 0;
  VALORP_RATEIO1.Value  := 0;
  VALORS_RATEIO1.Value  := 0;
  VALORP_RATEIO2.Value  := 0;
  VALORS_RATEIO2.Value  := 0;


  QSub_Detail.First;
  while not QSub_Detail.Eof do
  begin
    if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
      VALOR_PECAS.Value := VALOR_PECAS.Value + QSub_Detail.FieldByName('VR_TOTAL').AsFloat;

    if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'S' then
      VALOR_SERVICOS.Value := VALOR_SERVICOS.Value + QSub_Detail.FieldByName('VR_TOTAL').AsFloat;

    if (Empresa_Id_Rateio.Value > 0) Then
    Begin

     if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'P' then
     Begin
      VALORP_RATEIO1.Value := VALORP_RATEIO1.Value + (QSub_Detail.FieldByName('VR_TOTAL').AsFloat/2);
      VALORP_RATEIO2.Value := VALORP_RATEIO2.Value + (QSub_Detail.FieldByName('VR_TOTAL').AsFloat/2);
     End;

     if QSub_Detail.FieldByName('TP_PROD_SERV').AsString = 'S' then
     Begin
      VALORS_RATEIO1.Value := VALORS_RATEIO1.Value + (QSub_Detail.FieldByName('VR_TOTAL').AsFloat/2);
      VALORS_RATEIO2.Value := VALORS_RATEIO2.Value + (QSub_Detail.FieldByName('VR_TOTAL').AsFloat/2);
     End;

    End;


    VALOR_ITENS.Value := VALOR_ITENS.Value + QSub_Detail.FieldByName('VR_TOTAL').AsFloat;

    Application.ProcessMessages;

    QSub_Detail.Next;
  end;

 // btnSaveClick(Self);
  btnEditClick(Self);
//
   OrcDados.Show;
  if DT_RETORNO.CanFocus then
    DT_RETORNO.SetFocus
  else
    Botoes_Normal;
end;

procedure TFrmOrdem_Servico.ItensKeyDown(Sender: TObject;
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

procedure TFrmOrdem_Servico.ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #46 then
    Key := #44;

  if Key = #13 then
    Keybd_Event(VK_TAB, 0, 0, 0);

  Key := AnsiUpperCase(Key)[1];
end;

procedure TFrmOrdem_Servico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmOrdem_Servico.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (Operacao = 'Inserindo') or (Operacao = 'Alterando') or (QSub_Detail.State in [dsInsert, dsEdit]) then
  begin
    Application.MessageBox('É melhor salvar as alterações antes de continuar', PChar(Msg_Title), mb_IconStop);
    CanClose := False;
  end;

  CONTROLE_REGISTRO('ORDEM SERVICO',QTabela.FieldByName('ORDEM_ID').AsInteger,1);
end;

procedure TFrmOrdem_Servico.FormCreate(Sender: TObject);
var
X, Ult_Dia: Integer;
begin

   if FrmPrincipal.Config.FieldByName('OBJETO_ORDEM').AsString = 'Automóvel' then
   begin
      Label26.Caption := 'Mecânico';
      Label14.Caption := 'Placa';
      Label13.Caption := 'Veículo';

      NUM_SERIE.MaxLength := 8;
      StatusBar2.Panels[2].Text := '<F4> - Localizar p/ Número da Placa';
   end;




  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TABELAS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');

  IQuery.ParamByName('TIPO_TABELA').AsString := 'T';

  IQuery.Prepare;
  IQuery.Open;

  TIPO_ATENDIMENTO.Items.Clear;

  IQuery.First;
  while not IQuery.Eof do
  begin
    TIPO_ATENDIMENTO.Items.Add(Copy(IQuery.FieldByName('DESCRICAO').AsString, 1, 25));

    Application.ProcessMessages;
    IQuery.Next;
  end;

  IQuery.Sql.Clear;
  IQuery.Sql.Add('SELECT * FROM TABELAS');
  IQuery.Sql.Add('WHERE');
  IQuery.Sql.Add('(TIPO_TABELA = :TIPO_TABELA)');

  if FrmData.QAcesso.FieldByName('LIBERA').AsString <> 'SIM' then
  Begin
  IQuery.Sql.Add('AND (DESCRICAO <> :DESCRICAO)');
  IQuery.ParamByName('DESCRICAO').AsString := 'FATURADO';
  End;

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
  Itens.Columns[3].Width  := 35;
  Itens.Columns[4].Width  := 54;
  Itens.Columns[5].Width  := 54;
  Itens.Columns[6].Width  := 54;



  CmdSelect     := QTabela.Sql.Text;
  CmdSelectNull := 'WHERE (ORDEM_ID IS NOT NULL) AND (DT_MOVIMENTO = :DT_MOVIMENTO) AND (EMPRESA_ID = :EMPRESA_ID)';
  CmdOrderBy    := 'ORDER BY ORDEM_ID';

  QTabela.Sql.Text := CmdSelect + #13 + CmdSelectNull + #13 + CmdOrderBy;

  QTabela.ParamByName('DT_MOVIMENTO').AsDateTime := FrmPrincipal.Abertura.FieldByName('DT_MOVIMENTO').AsDateTime;
  QTabela.ParamByName('EMPRESA_ID').AsInteger    := FrmData.QAcesso.FieldByName('EMPRESA_ID').AsInteger;

  QTabela.Prepare;
  QTabela.Open;

  if FrmData.QAcesso.FieldByName('LIBERA').AsString = 'SIM' then
  Begin
    DT_NSERVICO.ReadOnly   := False;
    NNOTA_SERVICO.ReadOnly := False;
  End;

  Botoes_Normal;
  Consulta.Show;


end;

procedure TFrmOrdem_Servico.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
  
end;

end.
