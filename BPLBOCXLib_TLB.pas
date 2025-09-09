unit BPLBOCXLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 2010-8-7 8:41:39 from Type Library described below.

// ************************************************************************  //
// Type Lib: F:\SVN\6200I_2100E\SW_BPLADLL\trunk\BPLAOCX\BPLAOCXDemo\BPLBOCXDemo_Delphi\BPLBOCX.ocx (1)
// LIBID: {D71AB038-1CF0-4988-A3F5-EEED68699B79}
// LCID: 0
// Helpfile: F:\SVN\6200I_2100E\SW_BPLADLL\trunk\BPLAOCX\BPLAOCXDemo\BPLBOCXDemo_Delphi\BPLBOCX.hlp
// HelpString: BPLBOCX ActiveX Control module
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  BPLBOCXLibMajorVersion = 1;
  BPLBOCXLibMinorVersion = 0;

  LIBID_BPLBOCXLib: TGUID = '{D71AB038-1CF0-4988-A3F5-EEED68699B79}';

  DIID__DBPLBOCX: TGUID = '{4A7C514D-1AAA-4722-9518-8024D0168A5F}';
  DIID__DBPLBOCXEvents: TGUID = '{DEC2FFDB-991D-48D3-B304-7C52245FC485}';
  CLASS_BPLBOCX: TGUID = '{67BD0171-F83A-401E-A83B-CF6A2AB2B42D}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _DBPLBOCX = dispinterface;
  _DBPLBOCXEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  BPLBOCX = _DBPLBOCX;


// *********************************************************************//
// DispIntf:  _DBPLBOCX
// Flags:     (4112) Hidden Dispatchable
// GUID:      {4A7C514D-1AAA-4722-9518-8024D0168A5F}
// *********************************************************************//
  _DBPLBOCX = dispinterface
    ['{4A7C514D-1AAA-4722-9518-8024D0168A5F}']
    function BPLBOpenCom(const cComName: WideString; iBaudrate: Integer; iHandshak: Integer; 
                         iCheckFlag: Integer; iTimeout: Integer): Integer; dispid 1;
    function BPLBCloseCom(m_hPort: Integer): Integer; dispid 2;
    function BPLBOpenLpt(iAddress: Integer; iBusySleep: Integer): Integer; dispid 3;
    function BPLBOpenUSB(iMode: Integer; iID: Integer): Integer; dispid 4;
    function BPLBCloseUSB(m_hPort: Integer): Integer; dispid 5;
    function BPLBOpenUSBPrinter(const cUSBPrinterName: WideString): Integer; dispid 6;
    function BPLBCloseUSBPrinter(m_hPort: Integer): Integer; dispid 7;
    function BPLBOpenNetPort(const cIpAddress: WideString; iPort: Integer): Integer; dispid 8;
    function BPLBCloseNetPort(m_hPort: Integer): Integer; dispid 9;
    function BPLBSetTimeOut(m_hPort: Integer; iWriteTimeOut: Integer; iReadTimeOut: Integer): Integer; dispid 10;
    function BPLBClosePrinterDriver(m_hPort: Integer): Integer; dispid 11;
    function BPLBCloseNibblePar: Integer; dispid 12;
    function BPLBOpenPrinterDriver(const cDriverName: WideString): Integer; dispid 13;
    function BPLBOpenNibblePar(iPortNum: Integer; iDeviceNum: Integer; const cDriverPath: WideString): Integer; dispid 14;
    function BPLBEnumPrinterDrv(const cTerm: WideString): Integer; dispid 15;
    function BPLBEnumUSBPrinter: Integer; dispid 16;
    function BPLBGetUsbPrnName: WideString; dispid 17;
    function BPLBCloseLpt: Integer; dispid 18;
    function BPLBGetPrnDrvName(const cTerm: WideString): WideString; dispid 19;
    function BPLBStartArea(m_hPort: Integer; iPrintWidth: Integer; iColumn: Integer; iRow: Integer; 
                           iDarkness: Integer; iSpeedPrint: Integer): Integer; dispid 20;
    function BPLBPrintText(m_hPort: Integer; const cText: WideString; iStartX: Integer; 
                           iStartY: Integer; iRotate: Integer; const iFontID: WideString; 
                           iHorZoom: Integer; iVerZoom: Integer; iReverse: Integer): Integer; dispid 21;
    function BPLBPrintBarCode(m_hPort: Integer; const cData: WideString; iStartX: Integer; 
                              iStartY: Integer; iRotate: Integer; const cBarType: WideString; 
                              iNarrow: Integer; iWide: Integer; iBarHeight: Integer; 
                              iComment: Integer): Integer; dispid 22;
    function BPLBPrintPDF(m_hPort: Integer; const cData: WideString; iStartX: Integer; 
                          iStartY: Integer; iRotate: Integer; iMaxWidth: Integer; 
                          iMaxHeight: Integer; iErrorCorrectionLevel: Integer; 
                          iDataCompressLevel: Integer; iWidth: Integer; iHeight: Integer; 
                          iMaxRow: Integer; iMaxCol: Integer; iTruncationFlag: Integer): Integer; dispid 23;
    function BPLBPrintMaxi(m_hPort: Integer; const cData: WideString; iStartX: Integer; 
                           iStartY: Integer; const iClassCode: WideString; 
                           const iNationCode: WideString; const iPostCode: WideString): Integer; dispid 24;
    function BPLBPrintFontNameList(m_hPort: Integer): Integer; dispid 25;
    function BPLBPrintRect(m_hPort: Integer; iStartX: Integer; iStartY: Integer; iWeight: Integer; 
                           iEndX: Integer; iEndY: Integer): Integer; dispid 26;
    function BPLBPrintImageByName(m_hPort: Integer; const cPicName: WideString; iStartX: Integer; 
                                  iStartY: Integer): Integer; dispid 27;
    function BPLBPrintImageNameList(m_hPort: Integer): Integer; dispid 28;
    function BPLBClearRAM(m_hPort: Integer): Integer; dispid 29;
    function BPLBPrintImage(m_hPort: Integer; const cPicName: WideString; iStartX: Integer; 
                            iStartY: Integer): Integer; dispid 30;
    function BPLBDrawLine(m_hPort: Integer; iStartX: Integer; iStartY: Integer; iLong: Integer; 
                          iHeight: Integer; iMode: Integer): Integer; dispid 31;
    function BPLBDownloadImage(m_hPort: Integer; const cFileName: WideString; 
                               const cPicName: WideString; iModelType: Integer): Integer; dispid 32;
    function BPLBDeleteFontByID(m_hPort: Integer; const cID: WideString): Integer; dispid 33;
    function BPLBSet(m_hPort: Integer; iOutMode: Integer; iPrintMode: Integer): Integer; dispid 34;
    function BPLBPrint(m_hPort: Integer; iPieces: Integer; iSamePieces: Integer): Integer; dispid 35;
    function BPLBSetSaveFile(m_hPort: Integer; bsave: WordBool; const cFileName: WideString; 
                             bport: WordBool): Integer; dispid 36;
    function BPLBDeleteImageByName(m_hPort: Integer; const cPicName: WideString): Integer; dispid 37;
    function BPLBSetCharSet(m_hPort: Integer; iDataBit: Integer; const cCharSet: WideString; 
                            const cNationCode: WideString): Integer; dispid 38;
    function BPLBStartDoc(m_hPort: Integer): Integer; dispid 39;
    function BPLBEndDoc(m_hPort: Integer): Integer; dispid 40;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  _DBPLBOCXEvents
// Flags:     (4096) Dispatchable
// GUID:      {DEC2FFDB-991D-48D3-B304-7C52245FC485}
// *********************************************************************//
  _DBPLBOCXEvents = dispinterface
    ['{DEC2FFDB-991D-48D3-B304-7C52245FC485}']
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TBPLBOCX
// Help String      : BPLBOCX Control
// Default Interface: _DBPLBOCX
// Def. Intf. DISP? : Yes
// Event   Interface: _DBPLBOCXEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TBPLBOCX = class(TOleControl)
  private
    FIntf: _DBPLBOCX;
    function  GetControlInterface: _DBPLBOCX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function BPLBOpenCom(const cComName: WideString; iBaudrate: Integer; iHandshak: Integer; 
                         iCheckFlag: Integer; iTimeout: Integer): Integer;
    function BPLBCloseCom(m_hPort: Integer): Integer;
    function BPLBOpenLpt(iAddress: Integer; iBusySleep: Integer): Integer;
    function BPLBOpenUSB(iMode: Integer; iID: Integer): Integer;
    function BPLBCloseUSB(m_hPort: Integer): Integer;
    function BPLBOpenUSBPrinter(const cUSBPrinterName: WideString): Integer;
    function BPLBCloseUSBPrinter(m_hPort: Integer): Integer;
    function BPLBOpenNetPort(const cIpAddress: WideString; iPort: Integer): Integer;
    function BPLBCloseNetPort(m_hPort: Integer): Integer;
    function BPLBSetTimeOut(m_hPort: Integer; iWriteTimeOut: Integer; iReadTimeOut: Integer): Integer;
    function BPLBClosePrinterDriver(m_hPort: Integer): Integer;
    function BPLBCloseNibblePar: Integer;
    function BPLBOpenPrinterDriver(const cDriverName: WideString): Integer;
    function BPLBOpenNibblePar(iPortNum: Integer; iDeviceNum: Integer; const cDriverPath: WideString): Integer;
    function BPLBEnumPrinterDrv(const cTerm: WideString): Integer;
    function BPLBEnumUSBPrinter: Integer;
    function BPLBGetUsbPrnName: WideString;
    function BPLBCloseLpt: Integer;
    function BPLBGetPrnDrvName(const cTerm: WideString): WideString;
    function BPLBStartArea(m_hPort: Integer; iPrintWidth: Integer; iColumn: Integer; iRow: Integer; 
                           iDarkness: Integer; iSpeedPrint: Integer): Integer;
    function BPLBPrintText(m_hPort: Integer; const cText: WideString; iStartX: Integer; 
                           iStartY: Integer; iRotate: Integer; const iFontID: WideString; 
                           iHorZoom: Integer; iVerZoom: Integer; iReverse: Integer): Integer;
    function BPLBPrintBarCode(m_hPort: Integer; const cData: WideString; iStartX: Integer; 
                              iStartY: Integer; iRotate: Integer; const cBarType: WideString; 
                              iNarrow: Integer; iWide: Integer; iBarHeight: Integer; 
                              iComment: Integer): Integer;
    function BPLBPrintPDF(m_hPort: Integer; const cData: WideString; iStartX: Integer; 
                          iStartY: Integer; iRotate: Integer; iMaxWidth: Integer; 
                          iMaxHeight: Integer; iErrorCorrectionLevel: Integer; 
                          iDataCompressLevel: Integer; iWidth: Integer; iHeight: Integer; 
                          iMaxRow: Integer; iMaxCol: Integer; iTruncationFlag: Integer): Integer;
    function BPLBPrintMaxi(m_hPort: Integer; const cData: WideString; iStartX: Integer; 
                           iStartY: Integer; const iClassCode: WideString; 
                           const iNationCode: WideString; const iPostCode: WideString): Integer;
    function BPLBPrintFontNameList(m_hPort: Integer): Integer;
    function BPLBPrintRect(m_hPort: Integer; iStartX: Integer; iStartY: Integer; iWeight: Integer; 
                           iEndX: Integer; iEndY: Integer): Integer;
    function BPLBPrintImageByName(m_hPort: Integer; const cPicName: WideString; iStartX: Integer; 
                                  iStartY: Integer): Integer;
    function BPLBPrintImageNameList(m_hPort: Integer): Integer;
    function BPLBClearRAM(m_hPort: Integer): Integer;
    function BPLBPrintImage(m_hPort: Integer; const cPicName: WideString; iStartX: Integer; 
                            iStartY: Integer): Integer;
    function BPLBDrawLine(m_hPort: Integer; iStartX: Integer; iStartY: Integer; iLong: Integer; 
                          iHeight: Integer; iMode: Integer): Integer;
    function BPLBDownloadImage(m_hPort: Integer; const cFileName: WideString; 
                               const cPicName: WideString; iModelType: Integer): Integer;
    function BPLBDeleteFontByID(m_hPort: Integer; const cID: WideString): Integer;
    function BPLBSet(m_hPort: Integer; iOutMode: Integer; iPrintMode: Integer): Integer;
    function BPLBPrint(m_hPort: Integer; iPieces: Integer; iSamePieces: Integer): Integer;
    function BPLBSetSaveFile(m_hPort: Integer; bsave: WordBool; const cFileName: WideString; 
                             bport: WordBool): Integer;
    function BPLBDeleteImageByName(m_hPort: Integer; const cPicName: WideString): Integer;
    function BPLBSetCharSet(m_hPort: Integer; iDataBit: Integer; const cCharSet: WideString; 
                            const cNationCode: WideString): Integer;
    function BPLBStartDoc(m_hPort: Integer): Integer;
    function BPLBEndDoc(m_hPort: Integer): Integer;
    procedure AboutBox;
    property  ControlInterface: _DBPLBOCX read GetControlInterface;
    property  DefaultInterface: _DBPLBOCX read GetControlInterface;
  published
    property Anchors;
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

procedure TBPLBOCX.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{67BD0171-F83A-401E-A83B-CF6A2AB2B42D}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004005*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TBPLBOCX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _DBPLBOCX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TBPLBOCX.GetControlInterface: _DBPLBOCX;
begin
  CreateControl;
  Result := FIntf;
end;

function TBPLBOCX.BPLBOpenCom(const cComName: WideString; iBaudrate: Integer; iHandshak: Integer; 
                              iCheckFlag: Integer; iTimeout: Integer): Integer;
begin
  Result := DefaultInterface.BPLBOpenCom(cComName, iBaudrate, iHandshak, iCheckFlag, iTimeout);
end;

function TBPLBOCX.BPLBCloseCom(m_hPort: Integer): Integer;
begin
  Result := DefaultInterface.BPLBCloseCom(m_hPort);
end;

function TBPLBOCX.BPLBOpenLpt(iAddress: Integer; iBusySleep: Integer): Integer;
begin
  Result := DefaultInterface.BPLBOpenLpt(iAddress, iBusySleep);
end;

function TBPLBOCX.BPLBOpenUSB(iMode: Integer; iID: Integer): Integer;
begin
  Result := DefaultInterface.BPLBOpenUSB(iMode, iID);
end;

function TBPLBOCX.BPLBCloseUSB(m_hPort: Integer): Integer;
begin
  Result := DefaultInterface.BPLBCloseUSB(m_hPort);
end;

function TBPLBOCX.BPLBOpenUSBPrinter(const cUSBPrinterName: WideString): Integer;
begin
  Result := DefaultInterface.BPLBOpenUSBPrinter(cUSBPrinterName);
end;

function TBPLBOCX.BPLBCloseUSBPrinter(m_hPort: Integer): Integer;
begin
  Result := DefaultInterface.BPLBCloseUSBPrinter(m_hPort);
end;

function TBPLBOCX.BPLBOpenNetPort(const cIpAddress: WideString; iPort: Integer): Integer;
begin
  Result := DefaultInterface.BPLBOpenNetPort(cIpAddress, iPort);
end;

function TBPLBOCX.BPLBCloseNetPort(m_hPort: Integer): Integer;
begin
  Result := DefaultInterface.BPLBCloseNetPort(m_hPort);
end;

function TBPLBOCX.BPLBSetTimeOut(m_hPort: Integer; iWriteTimeOut: Integer; iReadTimeOut: Integer): Integer;
begin
  Result := DefaultInterface.BPLBSetTimeOut(m_hPort, iWriteTimeOut, iReadTimeOut);
end;

function TBPLBOCX.BPLBClosePrinterDriver(m_hPort: Integer): Integer;
begin
  Result := DefaultInterface.BPLBClosePrinterDriver(m_hPort);
end;

function TBPLBOCX.BPLBCloseNibblePar: Integer;
begin
  Result := DefaultInterface.BPLBCloseNibblePar;
end;

function TBPLBOCX.BPLBOpenPrinterDriver(const cDriverName: WideString): Integer;
begin
  Result := DefaultInterface.BPLBOpenPrinterDriver(cDriverName);
end;

function TBPLBOCX.BPLBOpenNibblePar(iPortNum: Integer; iDeviceNum: Integer; 
                                    const cDriverPath: WideString): Integer;
begin
  Result := DefaultInterface.BPLBOpenNibblePar(iPortNum, iDeviceNum, cDriverPath);
end;

function TBPLBOCX.BPLBEnumPrinterDrv(const cTerm: WideString): Integer;
begin
  Result := DefaultInterface.BPLBEnumPrinterDrv(cTerm);
end;

function TBPLBOCX.BPLBEnumUSBPrinter: Integer;
begin
  Result := DefaultInterface.BPLBEnumUSBPrinter;
end;

function TBPLBOCX.BPLBGetUsbPrnName: WideString;
begin
  Result := DefaultInterface.BPLBGetUsbPrnName;
end;

function TBPLBOCX.BPLBCloseLpt: Integer;
begin
  Result := DefaultInterface.BPLBCloseLpt;
end;

function TBPLBOCX.BPLBGetPrnDrvName(const cTerm: WideString): WideString;
begin
  Result := DefaultInterface.BPLBGetPrnDrvName(cTerm);
end;

function TBPLBOCX.BPLBStartArea(m_hPort: Integer; iPrintWidth: Integer; iColumn: Integer; 
                                iRow: Integer; iDarkness: Integer; iSpeedPrint: Integer): Integer;
begin
  Result := DefaultInterface.BPLBStartArea(m_hPort, iPrintWidth, iColumn, iRow, iDarkness, 
                                           iSpeedPrint);
end;

function TBPLBOCX.BPLBPrintText(m_hPort: Integer; const cText: WideString; iStartX: Integer; 
                                iStartY: Integer; iRotate: Integer; const iFontID: WideString; 
                                iHorZoom: Integer; iVerZoom: Integer; iReverse: Integer): Integer;
begin
  Result := DefaultInterface.BPLBPrintText(m_hPort, cText, iStartX, iStartY, iRotate, iFontID, 
                                           iHorZoom, iVerZoom, iReverse);
end;

function TBPLBOCX.BPLBPrintBarCode(m_hPort: Integer; const cData: WideString; iStartX: Integer; 
                                   iStartY: Integer; iRotate: Integer; const cBarType: WideString; 
                                   iNarrow: Integer; iWide: Integer; iBarHeight: Integer; 
                                   iComment: Integer): Integer;
begin
  Result := DefaultInterface.BPLBPrintBarCode(m_hPort, cData, iStartX, iStartY, iRotate, cBarType, 
                                              iNarrow, iWide, iBarHeight, iComment);
end;

function TBPLBOCX.BPLBPrintPDF(m_hPort: Integer; const cData: WideString; iStartX: Integer; 
                               iStartY: Integer; iRotate: Integer; iMaxWidth: Integer; 
                               iMaxHeight: Integer; iErrorCorrectionLevel: Integer; 
                               iDataCompressLevel: Integer; iWidth: Integer; iHeight: Integer; 
                               iMaxRow: Integer; iMaxCol: Integer; iTruncationFlag: Integer): Integer;
begin
  Result := DefaultInterface.BPLBPrintPDF(m_hPort, cData, iStartX, iStartY, iRotate, iMaxWidth, 
                                          iMaxHeight, iErrorCorrectionLevel, iDataCompressLevel, 
                                          iWidth, iHeight, iMaxRow, iMaxCol, iTruncationFlag);
end;

function TBPLBOCX.BPLBPrintMaxi(m_hPort: Integer; const cData: WideString; iStartX: Integer; 
                                iStartY: Integer; const iClassCode: WideString; 
                                const iNationCode: WideString; const iPostCode: WideString): Integer;
begin
  Result := DefaultInterface.BPLBPrintMaxi(m_hPort, cData, iStartX, iStartY, iClassCode, 
                                           iNationCode, iPostCode);
end;

function TBPLBOCX.BPLBPrintFontNameList(m_hPort: Integer): Integer;
begin
  Result := DefaultInterface.BPLBPrintFontNameList(m_hPort);
end;

function TBPLBOCX.BPLBPrintRect(m_hPort: Integer; iStartX: Integer; iStartY: Integer; 
                                iWeight: Integer; iEndX: Integer; iEndY: Integer): Integer;
begin
  Result := DefaultInterface.BPLBPrintRect(m_hPort, iStartX, iStartY, iWeight, iEndX, iEndY);
end;

function TBPLBOCX.BPLBPrintImageByName(m_hPort: Integer; const cPicName: WideString; 
                                       iStartX: Integer; iStartY: Integer): Integer;
begin
  Result := DefaultInterface.BPLBPrintImageByName(m_hPort, cPicName, iStartX, iStartY);
end;

function TBPLBOCX.BPLBPrintImageNameList(m_hPort: Integer): Integer;
begin
  Result := DefaultInterface.BPLBPrintImageNameList(m_hPort);
end;

function TBPLBOCX.BPLBClearRAM(m_hPort: Integer): Integer;
begin
  Result := DefaultInterface.BPLBClearRAM(m_hPort);
end;

function TBPLBOCX.BPLBPrintImage(m_hPort: Integer; const cPicName: WideString; iStartX: Integer; 
                                 iStartY: Integer): Integer;
begin
  Result := DefaultInterface.BPLBPrintImage(m_hPort, cPicName, iStartX, iStartY);
end;

function TBPLBOCX.BPLBDrawLine(m_hPort: Integer; iStartX: Integer; iStartY: Integer; 
                               iLong: Integer; iHeight: Integer; iMode: Integer): Integer;
begin
  Result := DefaultInterface.BPLBDrawLine(m_hPort, iStartX, iStartY, iLong, iHeight, iMode);
end;

function TBPLBOCX.BPLBDownloadImage(m_hPort: Integer; const cFileName: WideString; 
                                    const cPicName: WideString; iModelType: Integer): Integer;
begin
  Result := DefaultInterface.BPLBDownloadImage(m_hPort, cFileName, cPicName, iModelType);
end;

function TBPLBOCX.BPLBDeleteFontByID(m_hPort: Integer; const cID: WideString): Integer;
begin
  Result := DefaultInterface.BPLBDeleteFontByID(m_hPort, cID);
end;

function TBPLBOCX.BPLBSet(m_hPort: Integer; iOutMode: Integer; iPrintMode: Integer): Integer;
begin
  Result := DefaultInterface.BPLBSet(m_hPort, iOutMode, iPrintMode);
end;

function TBPLBOCX.BPLBPrint(m_hPort: Integer; iPieces: Integer; iSamePieces: Integer): Integer;
begin
  Result := DefaultInterface.BPLBPrint(m_hPort, iPieces, iSamePieces);
end;

function TBPLBOCX.BPLBSetSaveFile(m_hPort: Integer; bsave: WordBool; const cFileName: WideString; 
                                  bport: WordBool): Integer;
begin
  Result := DefaultInterface.BPLBSetSaveFile(m_hPort, bsave, cFileName, bport);
end;

function TBPLBOCX.BPLBDeleteImageByName(m_hPort: Integer; const cPicName: WideString): Integer;
begin
  Result := DefaultInterface.BPLBDeleteImageByName(m_hPort, cPicName);
end;

function TBPLBOCX.BPLBSetCharSet(m_hPort: Integer; iDataBit: Integer; const cCharSet: WideString; 
                                 const cNationCode: WideString): Integer;
begin
  Result := DefaultInterface.BPLBSetCharSet(m_hPort, iDataBit, cCharSet, cNationCode);
end;

function TBPLBOCX.BPLBStartDoc(m_hPort: Integer): Integer;
begin
  Result := DefaultInterface.BPLBStartDoc(m_hPort);
end;

function TBPLBOCX.BPLBEndDoc(m_hPort: Integer): Integer;
begin
  Result := DefaultInterface.BPLBEndDoc(m_hPort);
end;

procedure TBPLBOCX.AboutBox;
begin
  DefaultInterface.AboutBox;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TBPLBOCX]);
end;

end.
