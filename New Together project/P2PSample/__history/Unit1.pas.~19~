unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, PortSIPConsts, PortSIPCore,  StdCtrls, ExtCtrls, ComCtrls,
   winsock, unit2, unit3, filectrl, shellapi, MMSystem;

const
  WM_MSG_BASE                 = WM_APP + 1;
  WM_REGISTER_SUCCESS         = WM_MSG_BASE+3;
  WM_REGISTER_FAILURE         = WM_MSG_BASE+4;
  WM_INVITE_INCOMING          = WM_MSG_BASE+5;
  WM_INVITE_TRYING            = WM_MSG_BASE+6;
  WM_INVITE_RINGING           = WM_MSG_BASE+7;
  WM_INVITE_ANSWERED          = WM_MSG_BASE+8;
  WM_INVITE_FAILURE           = WM_MSG_BASE+9;
  WM_INVITE_CLOSED            = WM_MSG_BASE+10;
  WM_INVITE_UPDATED           = WM_MSG_BASE+11;
  WM_INVITE_UASCONNECTED      = WM_MSG_BASE+12;
  WM_INVITE_UACCONNECTED      = WM_MSG_BASE+13;
  WM_BEGINING_FORWARD         = WM_MSG_BASE+14;
  WM_REMOTE_HOLD              = WM_MSG_BASE+15;
  WM_REMOTE_UNHOLD            = WM_MSG_BASE+16;
  WM_TRANSFER_TRYING          = WM_MSG_BASE+17;
  WM_TRANSFER_RINGING         = WM_MSG_BASE+18;
  WM_PASVTRANSFER_SUCCESS     = WM_MSG_BASE+19;
  WM_PASVTRANSFER_FAILURE     = WM_MSG_BASE+20;
  WM_ACTVTRANSFER_SUCCESS      = WM_MSG_BASE+21;
  WM_ACTVTRANSFER_FAILURE     = WM_MSG_BASE+22;
  WM_RECV_PAGERMESSAGE        = WM_MSG_BASE+23;
  WM_SEND_PAGERMESSAGE_SUCCESS = WM_MSG_BASE+24;
  WM_SEND_PAGERMESSAGE_FAILURE = WM_MSG_BASE+25;
  WM_ARRIVED_SIGNALING        = WM_MSG_BASE+26;
  WM_WAITING_VOICEMESSAGE     = WM_MSG_BASE+27;
  WM_WAITING_FAXMESSAGE       = WM_MSG_BASE+28;
  WM_RECV_DTMFTONE            = WM_MSG_BASE+29;
  WM_PRESENCE_RECVSUBSCRIBE   = WM_MSG_BASE+30;
  WM_PRESENCE_ONLINE          = WM_MSG_BASE+31;
  WM_PRESENCE_OFFLINE         = WM_MSG_BASE+32;
  WM_RECV_OPTION              = WM_MSG_BASE+33;
  WM_RECV_INFO                = WM_MSG_BASE+34;
  WM_RECV_MESSAGE             = WM_MSG_BASE+35;
  WM_RECV_BINARYMESSAGE       = WM_MSG_BASE+36;
  WM_RECV_BINARYPAGERMESSAGE  = WM_MSG_BASE+37;
  WM_PLAYWAVEFILE_FINISHED    = WM_MSG_BASE+38;
  WM_PLAYAVIFILE_FINISHED     = WM_MSG_BASE+39;
  WM_RAW_VIDEOCALLBACK        = WM_MSG_BASE+40;
  WM_RAW_AUDIOCALLBACK        = WM_MSG_BASE+41;
  WM_RECV_RTPPACKETCALLBACK   = WM_MSG_BASE+42;
  WM_SENT_RTPPACKETCALLBACK   = WM_MSG_BASE+43;
  WM_SENT_SIGNALING           = WM_MSG_BASE+44;

type
  TMsgText = class(TObject)
    MyMessage:string;
  end;

type
  TCallbackMessage = class(TObject)
    statusCode: integer;
    statusText: string;
    sessionId: integer;
    caller: string;
    callerDispalyName: string;
    callee: string;
    calleeDisplayName: string;
    audioCodecName: string;
    videoCodecName: string;
    hasVideo: boolean;
    hasEarlyMedia: boolean;
    forwardingTo: string;
    referTo: string;
    from: string;
    fromDisplayName: string;
    messageAccount: string;
    dtmfTone: integer;
    subscribeId: integer;
    sipMessage: string;
    textMessage: string;
    filePathName: string;
    rawSteamCallbackType: integer;
    samplingFreqHz: integer;
    width: integer;
    height: integer;
    isAudio: Boolean;
    data: PBYTE;
    dataLength: integer;
  end;




  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditUserName: TEdit;
    EditLocalPort: TEdit;
    Label2: TLabel;
    EditPassword: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    EditPhoneNumber: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    ComboBoxLines: TComboBox;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    CheckBoxSDP: TCheckBox;
    CheckBoxAA: TCheckBox;
    CheckBoxDND: TCheckBox;
    CheckBoxConference: TCheckBox;
    Panel2: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    TrackBarSpeaker: TTrackBar;
    Label12: TLabel;
    TrackBarMicrophone: TTrackBar;
    CheckBoxMuteMicrophone: TCheckBox;
    Label13: TLabel;
    Label14: TLabel;
    ComboBoxSpeaker: TComboBox;
    ComboBoxMicrophone: TComboBox;
    Label15: TLabel;
    ComboBoxCamera: TComboBox;
    Panel4: TPanel;
    Label16: TLabel;
    Button28: TButton;
    CheckBoxG729: TCheckBox;
    CheckBoxG711A: TCheckBox;
    CheckBoxG711U: TCheckBox;
    CheckBoxILBC: TCheckBox;
    CheckBoxGSM: TCheckBox;
    CheckBoxH263: TCheckBox;
    CheckBoxH2631998: TCheckBox;
    CheckBoxH264: TCheckBox;
    CheckBoxAEC: TCheckBox;
    CheckBoxCNG: TCheckBox;
    CheckBoxVAD: TCheckBox;
    CheckBoxAGC: TCheckBox;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Button29: TButton;
    EditRecordFilePath: TEdit;
    Label18: TLabel;
    EditAudioRecordFileName: TEdit;
    Button30: TButton;
    Button31: TButton;
    GroupBox3: TGroupBox;
    Label20: TLabel;
    Button32: TButton;
    EditPlayWaveFileName: TEdit;
    Button33: TButton;
    Button34: TButton;
    OpenDialog1: TOpenDialog;
    ListBoxLog: TListBox;
    Button23: TButton;
    Label19: TLabel;
    Label21: TLabel;
    EditVideoRecordFileName: TEdit;
    Button35: TButton;
    Button36: TButton;
    CheckBoxAudioStreamCallback: TCheckBox;
    GroupBox4: TGroupBox;
    CheckBoxForwardCallBusy: TCheckBox;
    Label22: TLabel;
    Button37: TButton;
    Button38: TButton;
    EditForwardAddress: TEdit;
    ComboBoxSRTP: TComboBox;
    CheckBoxG7221: TCheckBox;
    CheckBoxG722: TCheckBox;
    CheckBoxSPEEX: TCheckBox;
    CheckBoxAMRWB: TCheckBox;
    CheckBoxSPEEXWB: TCheckBox;
    CheckBoxAMR: TCheckBox;
    LocalVideo: TPanel;
    RemoteVideo: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label23: TLabel;
    Button27: TButton;
    Button26: TButton;
    Button25: TButton;
    Button24: TButton;
    ComboBoxResolution: TComboBox;
    TrackBarQuality: TTrackBar;
    CheckBoxVP8: TCheckBox;
    ShowMyFormBtn: TButton;
    Label24: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBoxLinesChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure TrackBarSpeakerChange(Sender: TObject);
    procedure TrackBarMicrophoneChange(Sender: TObject);
    procedure CheckBoxMuteMicrophoneClick(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure CheckBoxG711UClick(Sender: TObject);
    procedure CheckBoxG711AClick(Sender: TObject);
    procedure CheckBoxG729Click(Sender: TObject);
    procedure CheckBoxILBCClick(Sender: TObject);
    procedure CheckBoxGSMClick(Sender: TObject);
    procedure CheckBoxH263Click(Sender: TObject);
    procedure CheckBoxH2631998Click(Sender: TObject);
    procedure CheckBoxH264Click(Sender: TObject);
    procedure CheckBoxAECClick(Sender: TObject);
    procedure CheckBoxCNGClick(Sender: TObject);
    procedure CheckBoxVADClick(Sender: TObject);
    procedure CheckBoxAGCClick(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure CheckBoxConferenceClick(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure Button36Click(Sender: TObject);
    procedure CheckBoxAudioStreamCallbackClick(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure Button38Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure ComboBoxSpeakerChange(Sender: TObject);
    procedure ComboBoxMicrophoneChange(Sender: TObject);
    procedure ComboBoxCameraChange(Sender: TObject);
    procedure Label23Click(Sender: TObject);
    procedure Label24Click(Sender: TObject);
    procedure CheckBoxG7221Click(Sender: TObject);
    procedure CheckBoxAMRWBClick(Sender: TObject);
    procedure CheckBoxG722Click(Sender: TObject);
    procedure CheckBoxAMRClick(Sender: TObject);
    procedure CheckBoxSPEEXWBClick(Sender: TObject);
    procedure CheckBoxSPEEXClick(Sender: TObject);
    procedure ComboBoxResolutionChange(Sender: TObject);
    procedure TrackBarQualityChange(Sender: TObject);
    procedure CheckBoxVP8Click(Sender: TObject);
    procedure ShowMyFormBtnClick(Sender: TObject);


  private
    {  declarations }

    proceDure createCallbackHandler();

    function GetLocalIP : string;
    procedure InitDefaultAudioCodecs();
    procedure InitDefaultVideoCodecs();
    procedure UpdateAudioCodecs();
    proceDure UpdateVideoCodecs();
    proceDure UpdateVideoResolution();
    proceDure UpdateVideoQuality();
    proceDure InitSettings();


  private

    EventHandle : THandle;
    PortSIPHandle : THandle;
    Initialized : Boolean;
    CurrentLine : integer;
    Sessions : Array[0..8] of TSession;


  protected
    procedure onRegisterSuccess(var Message: TMessage); message WM_REGISTER_SUCCESS;
    procedure onRegisterFailure(var Message: TMessage); message WM_REGISTER_FAILURE;

    procedure onInviteIncoming(var Message: TMessage); message WM_INVITE_INCOMING;
    procedure onInviteTrying(var Message: TMessage); message WM_INVITE_TRYING;
    procedure onInviteRinging(var Message: TMessage); message WM_INVITE_RINGING;
    procedure onInviteAnswered(var Message: TMessage); message WM_INVITE_ANSWERED;
    procedure onInviteFailure(var Message: TMessage); message WM_INVITE_FAILURE;
    procedure onInviteClosed(var Message: TMessage); message WM_INVITE_CLOSED;
    procedure onInviteUpdated(var Message: TMessage); message WM_INVITE_UPDATED;
    procedure onInviteUASConnected(var Message: TMessage); message WM_INVITE_UASCONNECTED;
    procedure onInviteUACConnected(var Message: TMessage); message WM_INVITE_UACCONNECTED;
    procedure onBeingingForward(var Message: TMessage); message WM_BEGINING_FORWARD;

    procedure onRemoteHold(var Message: TMessage); message WM_REMOTE_HOLD;
    procedure onRemoteUnhold(var Message: TMessage); message WM_REMOTE_UNHOLD;
    procedure onTransferTrying(var Message: TMessage); message WM_TRANSFER_TRYING;
    procedure onTransferRinging(var Message: TMessage); message WM_TRANSFER_RINGING;
    procedure onPASVTransferSuccess(var Message: TMessage); message WM_PASVTRANSFER_SUCCESS;
    procedure onPASVTransferFailure(var Message: TMessage); message WM_PASVTRANSFER_FAILURE;
    procedure onACTVTransferSuccess(var Message: TMessage); message WM_ACTVTRANSFER_SUCCESS;
    procedure onACTVTransferFailure(var Message: TMessage); message WM_ACTVTRANSFER_FAILURE;
    procedure onRecvPagerMessage(var Message: TMessage); message WM_RECV_PAGERMESSAGE;
    procedure onSendPagerMessageSuccess(var Message: TMessage); message WM_SEND_PAGERMESSAGE_SUCCESS;
    procedure onSendPagerMessageFailure(var Message: TMessage); message WM_SEND_PAGERMESSAGE_FAILURE;
    procedure onArrviedSignaling(var Message: TMessage); message WM_ARRIVED_SIGNALING;
    procedure onSentSignaling(var Message: TMessage); message WM_SENT_SIGNALING;
    procedure onWaitingVoiceMessage(var Message: TMessage); message WM_WAITING_VOICEMESSAGE;
    procedure onWaingFaxMessage(var Message: TMessage); message WM_WAITING_FAXMESSAGE;
    procedure onRecvDtmfTone(var Message: TMessage); message WM_RECV_DTMFTONE;
    procedure onPresenceRecvSubscribe(var Message: TMessage); message WM_PRESENCE_RECVSUBSCRIBE;
    procedure onPresenceOnline(var Message: TMessage); message WM_PRESENCE_ONLINE;
    procedure onPresenceOffline(var Message: TMessage); message WM_PRESENCE_OFFLINE;
    procedure onRecvOption(var Message: TMessage); message WM_RECV_OPTION;
    procedure onRecvInfo(var Message: TMessage); message WM_RECV_INFO;
    procedure onRecvMessage(var Message: TMessage); message WM_RECV_MESSAGE;
    procedure onRecvBinaryMessage(var Message: TMessage); message WM_RECV_BINARYMESSAGE;
    procedure onRecvBinnaryPagerMessage(var Message: TMessage); message WM_RECV_BINARYPAGERMESSAGE;
    procedure onPlayWaveFileFinished(var Message: TMessage); message WM_PLAYWAVEFILE_FINISHED;
    procedure onPlayAviFileFinished(var Message: TMessage); message WM_PLAYAVIFILE_FINISHED;
    procedure onAudioRawCallback(var Message: TMessage); message WM_RAW_AUDIOCALLBACK;
    procedure onVideoRawCallback(var Message: TMessage); message WM_RAW_VIDEOCALLBACK;
    procedure onReceivedRTPPacketCallback(var Message: TMessage); message WM_RECV_RTPPACKETCALLBACK;
    procedure onSendingRTPPacketCallback(var Message: TMessage); message WM_SENT_RTPPACKETCALLBACK;


    procedure AddLog(const Line: string);
    procedure LoadDevice();
    procedure JoinConference(const index: Integer);


  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const

    LINE_BASE = 1;
    MAXLINE = 8;


implementation

{$R *.dfm}

uses Unit4;





function registerSuccess(callbackObject: Pointer; statusCode:integer; statusText:PAnsiChar): integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.statusCode := statusCode;
  callbackMessage.statusText := string(statusText);

  PostMessage(Form1.Handle, WM_REGISTER_SUCCESS, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function registerFailure(callbackObject: Pointer; statusCode:integer; statusText:PAnsiChar): integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.statusCode := statusCode;
  callbackMessage.statusText := string(statusText);

  PostMessage(Form1.Handle, WM_REGISTER_FAILURE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer


  result := 0;
end;


function InviteIncoming(callbackObject: Pointer;
                                sessionId:integer;
                                caller:PAnsiChar;
                                callerDisplayName:PAnsiChar;
                                callee:PAnsiChar;
                                calleeDisplayName:PAnsiChar;
                                audioCodecName:PAnsiChar;
                                videoCodecName:PAnsiChar;
                                hasVideo:boolean
                                ):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.caller := string(caller);
  callbackMessage.callerDispalyName := string(callerDisplayName);
  callbackMessage.callee := string(callee);
  callbackMessage.calleeDisplayName := string(calleeDisplayName);
  callbackMessage.audioCodecName := string(audioCodecName);
  callbackMessage.videoCodecName := string(videoCodecName);
  callbackMessage.hasVideo := hasVideo;

  PostMessage(Form1.Handle, WM_INVITE_INCOMING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer


  result := 0;
end;


function InviteTrying(callbackObject: Pointer; sessionId:integer; Caller, callee:PAnsiChar): integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.caller := string(caller);
  callbackMessage.callee := string(callee);

  PostMessage(Form1.Handle, WM_INVITE_TRYING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function InviteRinging(callbackObject: Pointer;
                               sessionId:integer;
                               hasEarlyMedia:boolean;
                               hasVideo: boolean;
                               audioCodecName: PAnsiChar;
                               videoCodecName: PAnsiChar
                               ):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.hasEarlyMedia := hasEarlyMedia;
  callbackMessage.hasVideo := hasVideo;
  callbackMessage.audioCodecName := string(audioCodecName);
  callbackMessage.videoCodecName := string(videoCodecName);

  PostMessage(Form1.Handle, WM_INVITE_RINGING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;



function InviteAnswered(callbackObject: Pointer;
                                sessionId:integer;
                                hasVideo:boolean;
                                statusCode: integer;
                                statusText:PANsiChar;
                                audioCodecName:PAnsiChar;
                                videoCodecName:PAnsiChar
                                ):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.hasVideo := hasVideo;
  callbackMessage.statusCode := statusCode;
  callbackMessage.statusText := statusText;
  callbackMessage.audioCodecName := string(audioCodecName);
  callbackMessage.videoCodecName := string(videoCodecName);

  PostMessage(Form1.Handle, WM_INVITE_ANSWERED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;

function InviteFailure(callbackObject: Pointer;
                               sessionId:integer;
                               statusCode:integer;
                               statusText:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.statusCode := statusCode;
  callbackMessage.statusText := statusText;

  PostMessage(Form1.Handle, WM_INVITE_FAILURE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function InviteClosed(callbackObject: Pointer; sessionId:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;

  PostMessage(Form1.Handle, WM_INVITE_CLOSED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function InviteUpdated(callbackObject: Pointer;
                               sessionId:integer;
                               hasVideo:boolean;
                               audioCodecName:PAnsiChar;
                               videoCodecName:PAnsiChar
                               ):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.hasVideo := hasVideo;
  callbackMessage.audioCodecName := string(audioCodecName);
  callbackMessage.videoCodecName := string(videoCodecName);

  PostMessage(Form1.Handle, WM_INVITE_UPDATED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;



function InviteUASConnected(callbackObject: Pointer;
                                    sessionId:integer;
                                    statusCode:integer;
                                    statusText:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.statusCode := statusCode;
  callbackMessage.statusText := string(statusText);

  PostMessage(Form1.Handle, WM_INVITE_UASCONNECTED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function InviteUACConnected(callbackObject: Pointer;
                                    sessionId:integer;
                                    statusCode:integer;
                                    statusText:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.statusCode := statusCode;
  callbackMessage.statusText := string(statusText);

  PostMessage(Form1.Handle, WM_INVITE_UACCONNECTED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function InviteBeginingForward(callbackObject: Pointer; forwardingTo:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.forwardingTo :=  string(forwardingTo);


  PostMessage(Form1.Handle, WM_BEGINING_FORWARD, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function RemoteHold(callbackObject: Pointer; sessionId:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;

  PostMessage(Form1.Handle, WM_REMOTE_HOLD, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;

function RemoteUnHold(callbackObject: Pointer; sessionId:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;

  PostMessage(Form1.Handle, WM_REMOTE_UNHOLD, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;



function TransferTrying(callbackObject: Pointer; sessionId:integer; referTo:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;
  callbackMessage.referTo :=  string(referTo);

  PostMessage(Form1.Handle, WM_TRANSFER_TRYING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function TransferRinging(callbackObject: Pointer; sessionId:integer; hasVideo:boolean):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;
  callbackMessage.hasVideo := hasVideo;

  PostMessage(Form1.Handle, WM_TRANSFER_RINGING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function PASVTransferSuccess(callbackObject: Pointer; sessionId:integer; hasVideo:boolean):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;
  callbackMessage.hasVideo := hasVideo;

  PostMessage(Form1.Handle, WM_PASVTRANSFER_SUCCESS, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;



function PASVTransferFailure(callbackObject: Pointer; sessionId:integer; statusCode:integer; statusText:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;
  callbackMessage.statusCode := statusCode;
  callbackMessage.statusText := string(statusText);

  PostMessage(Form1.Handle, WM_PASVTRANSFER_FAILURE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;



function ACTVTransferSuccess(callbackObject: Pointer; sessionId:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;

  PostMessage(Form1.Handle, WM_ACTVTRANSFER_SUCCESS, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function ACTVTransferFailure(callbackObject: Pointer; sessionId:integer; statusCode:integer; statusText:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;
  callbackMessage.statusCode := statusCode;
  callbackMessage.statusText := string(statusText);

  PostMessage(Form1.Handle, WM_ACTVTRANSFER_FAILURE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function RecvPagerMessage(callbackObject: Pointer; from, fromDisplayName, message:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.from := string(from);
  callbackMessage.fromDisplayName := string(fromDisplayName);
  callbackMessage.textMessage := string(message);

  PostMessage(Form1.Handle, WM_RECV_MESSAGE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;

function SendPagerMessageSuccess(callbackObject: Pointer; caller, callerDisplayName, callee, calleeDisplayName:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.caller := caller;
  callbackMessage.callerDispalyName := string(callerDisplayName);
  callbackMessage.callee := string(callee);
  callbackMessage.calleeDisplayName := string(calleeDisplayName);

  PostMessage(Form1.Handle, WM_SEND_PAGERMESSAGE_SUCCESS, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;

function SendPagerMessageFailure(callbackObject: Pointer; caller, callerDisplayName, callee, calleeDisplayName:PAnsiChar; statusCode:integer; statusText:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.caller := caller;
  callbackMessage.callerDispalyName := string(callerDisplayName);
  callbackMessage.callee := string(callee);
  callbackMessage.calleeDisplayName := string(calleeDisplayName);
  callbackMessage.statusCode := statusCode;
  callbackMessage.statusText := statusText;

  PostMessage(Form1.Handle, WM_SEND_PAGERMESSAGE_FAILURE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function ArrivedSignaling(callbackObject: Pointer; sessionId:integer; signaling:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.sipMessage := signaling;

  PostMessage(Form1.Handle, WM_ARRIVED_SIGNALING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;

function SentSignaling(callbackObject: Pointer; signaling:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sipMessage := signaling;

  PostMessage(Form1.Handle, WM_SENT_SIGNALING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;

function WaitingVoiceMessage(callbackObject: Pointer; messageAccount:PAnsiChar; urgentNewMessageCount, urgentOldMessageCount, newMessageCount, oldMessageCount: integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.messageAccount := string(messageAccount);

  PostMessage(Form1.Handle, WM_WAITING_VOICEMESSAGE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function WaitingFaxMessage(callbackObject: Pointer; messageAccount:PAnsiChar; urgentNewMessageCount, urgentOldMessageCount, newMessageCount, oldMessageCount:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.messageAccount := string(messageAccount);

  PostMessage(Form1.Handle, WM_WAITING_FAXMESSAGE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function RecvDtmfTone(callbackObject: Pointer; sessionId:integer; tone:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.dtmfTone := tone;

  PostMessage(Form1.Handle, WM_RECV_DTMFTONE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;

function PresenceRecvSubscribe(callbackObject: Pointer; subscribeId:integer; from, fromDisplayName, subject:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.subscribeId := subscribeId;
  callbackMessage.from := string(from);
  callbackMessage.fromDisplayName := string(fromDisplayName);

  PostMessage(Form1.Handle, WM_PRESENCE_RECVSUBSCRIBE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function PresenceOnline(callbackObject: Pointer; from, fromDisplayName, stateText:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.statusText := stateText;
  callbackMessage.from := string(from);
  callbackMessage.fromDisplayName := string(fromDisplayName);

  PostMessage(Form1.Handle, WM_PRESENCE_ONLINE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function PresenceOffline(callbackObject: Pointer; from, fromDisplayName:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.from := string(from);
  callbackMessage.fromDisplayName := string(fromDisplayName);

  PostMessage(Form1.Handle, WM_PRESENCE_OFFLINE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;



function RecvOptions(callbackObject: Pointer; optionsMessage:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sipMessage := string(optionsMessage);

  PostMessage(Form1.Handle, WM_RECV_OPTION, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;

function RecvInfo(callbackObject: Pointer; sessionId:integer; infoMessage:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sipMessage := string(infoMessage);
  callbackMessage.sessionId := sessionId;

  PostMessage(Form1.Handle, WM_RECV_INFO, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function RecvMessage(callbackObject: Pointer; sessionId:integer; message:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sipMessage := string(message);
  callbackMessage.sessionId := sessionId;

  PostMessage(Form1.Handle, WM_RECV_MESSAGE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function RecvBinaryMessage(callbackObject: Pointer; sessionId:integer; message:PAnsiChar; data:Pointer; dataLength:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sipMessage := string(message);
  callbackMessage.sessionId := sessionId;

  PostMessage(Form1.Handle, WM_RECV_BINARYMESSAGE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function RecvBinaryPagerMessage(callbackObject: Pointer; from:PAnsiChar; fromDisplayName:PAnsiChar; data:Pointer; dataLength:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.fromDisplayName := string(fromDisplayName);
  callbackMessage.from := string(from);

  PostMessage(Form1.Handle, WM_RECV_BINARYPAGERMESSAGE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function ReceivedRTPPacketCallback(callbackObj: Pointer; sessionId: integer; isAudio: Boolean; packet:Pointer; packetSize:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.isAudio := isAudio;
  callbackMessage.dataLength := packetSize;
  GetMem(callbackMessage.data, packetSize);
  CopyMemory(callbackMessage.data, packet, packetSize);

  PostMessage(Form1.Handle, WM_RECV_RTPPACKETCALLBACK, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer


  result := 0;
end;


function SendingRTPPacketCallback(callbackObj: Pointer; sessionId: integer; isAudio: Boolean; packet:Pointer; packetSize:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.isAudio := isAudio;
  callbackMessage.dataLength := packetSize;
  GetMem(callbackMessage.data, packetSize);
  CopyMemory(callbackMessage.data, packet, packetSize);


  PostMessage(Form1.Handle, WM_SENT_RTPPACKETCALLBACK, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer


  result := 0;
end;


function AudioRawCallback(obj: Pointer; sessionId, _type: integer; data:Pointer; dataLength, samplingFreqHz:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.rawSteamCallbackType := _type;
  callbackMessage.samplingFreqHz :=  samplingFreqHz;
  callbackMessage.dataLength := dataLength;
  GetMem(callbackMessage.data, dataLength);
  CopyMemory(callbackMessage.data, data, dataLength);

  PostMessage(Form1.Handle, WM_RAW_AUDIOCALLBACK, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer


  result := 0;
end;


function VideoRawCallback(obj: Pointer; sessionId, _type: integer; width, height:integer; data:Pointer; dataLength:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.rawSteamCallbackType := _type;
  callbackMessage.width := width;
  callbackMessage.height := height;
  callbackMessage.dataLength := dataLength;
  GetMem(callbackMessage.data, dataLength);
  CopyMemory(callbackMessage.data, data, dataLength);

  PostMessage(Form1.Handle, WM_RAW_VIDEOCALLBACK, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer


  result := 0;
end;


function PlayWaveFileToRemoteFinished(obj:Pointer; sessionID:integer; filePathName:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.filePathName := string(filePathName);


  PostMessage(Form1.Handle, WM_PLAYWAVEFILE_FINISHED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;


function PlayAviFileToRemoteFinished(obj:Pointer; sessionID:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;

  PostMessage(Form1.Handle, WM_PLAYAVIFILE_FINISHED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer

  result := 0;
end;



function ReceivedRTPPacket(obj:Pointer; RTPPacket:Pointer; var packetLength:integer):integer; stdcall;
begin

  result := 0;
end;


function SendingRTPPacket(obj:Pointer; RTPPacket:Pointer; var packetLength:integer):integer; stdcall;
begin

  result := 0;
end;




procedure TForm1.createCallbackHandler();
begin
    EventHandle := SIPEV_createSIPCallbackHandle();

    SIPEV_setRegisterSuccessHandler(Eventhandle, RegisterSuccess, nil);
    SIPEV_setRegisterFailureHandler(Eventhandle, RegisterFailure, nil);
    SIPEV_setInviteIncomingHandler(Eventhandle, InviteIncoming, nil);
    SIPEV_setInviteTryingHandler(Eventhandle, InviteTrying, nil);
    SIPEV_setInviteRingingHandler(Eventhandle, InviteRinging, nil);
    SIPEV_setInviteAnsweredHandler(Eventhandle, InviteAnswered, nil);
    SIPEV_setInviteFailureHandler(Eventhandle, InviteFailure, nil);
    SIPEV_setInviteClosedHandler(Eventhandle, InviteClosed, nil);
    SIPEV_setInviteUpdatedHandler(Eventhandle, InviteUpdated, nil);
    SIPEV_setInviteUASConnectedHandler(Eventhandle, InviteUASConnected, nil);
    SIPEV_setInviteUACConnectedHandler(Eventhandle, InviteUACConnected, nil);
    SIPEV_setInviteBeginingForwardHandler(Eventhandle, InviteBeginingForward, nil);
    SIPEV_setRemoteHoldHandler(Eventhandle, RemoteHold, nil);
    SIPEV_setRemoteUnHoldHandler(Eventhandle, RemoteUnHold, nil);
    SIPEV_setTransferTryingHandler(Eventhandle, TransferTrying, nil);
    SIPEV_setTransferRingingHandler(Eventhandle, TransferRinging, nil);
    SIPEV_setPASVTransferSuccessHandler(Eventhandle, PASVTransferSuccess, nil);
    SIPEV_setACTVTransferSuccessHandler(Eventhandle, ACTVTransferSuccess, nil);
    SIPEV_setPASVTransferFailureHandler(Eventhandle, PASVTransferFailure, nil);
    SIPEV_setACTVTransferFailureHandler(Eventhandle, ACTVTransferFailure, nil);
    SIPEV_setRecvPagerMessageHandler(Eventhandle, RecvPagerMessage, nil);
    SIPEV_setSendPagerMessageSuccessHandler(Eventhandle, SendPagerMessageSuccess, nil);
    SIPEV_setSendPagerMessageFailureHandler(Eventhandle, SendPagerMessageFailure, nil);
    SIPEV_setArrivedSignalingHandler(Eventhandle, ArrivedSignaling, nil);
    SIPEV_setSentSignalingHandler(Eventhandle, SentSignaling, nil);
    SIPEV_setWaitingVoiceMessageHandler(Eventhandle, WaitingVoiceMessage, nil);
    SIPEV_setWaitingFaxMessageHandler(Eventhandle, WaitingFaxMessage, nil);
    SIPEV_setRecvDtmfToneHandler(Eventhandle, RecvDtmfTone, nil);
    SIPEV_setPresenceRecvSubscribeHandler(Eventhandle, PresenceRecvSubscribe, nil);
    SIPEV_setPresenceOnlineHandler(Eventhandle, PresenceOnline, nil);
    SIPEV_setPresenceOfflineHandler(Eventhandle, PresenceOffline, nil);
    SIPEV_setRecvOptionsHandler(Eventhandle, RecvOptions, nil);
    SIPEV_setRecvInfoHandler(Eventhandle, RecvInfo, nil);
    SIPEV_setRecvMessageHandler(Eventhandle, RecvMessage, nil);
    SIPEV_setRecvBinaryMessageHandler(Eventhandle, RecvBinaryMessage, nil);
    SIPEV_setRecvBinaryPagerMessageHandler(Eventhandle, RecvBinaryPagerMessage, nil);


end;




procedure TForm1.onRegisterSuccess(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   AddLog('Register server succeeded.');


   callbackMessage.Free;
end;

procedure TForm1.onRegisterFailure(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   AddLog('Register server failed.');


   callbackMessage.Free;
end;


procedure TForm1.onInviteIncoming(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  i : integer;
  j : integer;
  state : boolean;
  DND : boolean;
  needIgnoreAutoAnswer: boolean;

  s1 : boolean;
  s2 : boolean;
begin
   callbackMessage := TCallbackMessage(Message.WParam);

   if callbackMessage.hasVideo = True then
   begin
     // this is the incoming video call
   end
   else
   begin
    // this is the incoming audio call
   end;

  state := false;

  for i := LINE_BASE to MAXLINE do
  begin
    s1 :=  Sessions[i].GetSessionState();
    s2 := Sessions[i].GetRecvCallState();
     if ((Sessions[i].GetSessionState()= False) and (Sessions[i].GetRecvCallState()= False)) then
     begin

       state := True;
       Sessions[i].SetRecvCallState(True);
       break;
     end;
  end;

  if state = False then
  begin
    PortSIP_rejectCall(PortSIPHandle, callbackMessage.sessionId, 486, 'Busy here');
    Exit;
  end;

  DND := false;
  if checkboxDND.Checked = True then
  begin
    PortSIP_rejectCall(PortSIPHandle, callbackMessage.sessionId, 486, 'Busy here');
    Sessions[i].Reset;

    AddLog(Format('Rejected the call by DND on line : %d', [i]));
    Exit;
  end;

  Sessions[i].SetSessionID(callbackMessage.sessionId);

  needIgnoreAutoAnswer := false;
  j := 0;
  for j := LINE_BASE to MAXLINE do
  begin
     if (Sessions[j].GetSessionState = true ) then
     begin
       needIgnoreAutoAnswer := True;
       break;
     end;
  end;

  if (needIgnoreAutoAnswer=false) and (checkboxAA.Checked=true) then
  begin
    Sessions[i].SetRecvCallState(false);
    Sessions[i].SetSessionState(true);

    PortSIP_setRemoteVideoWindow(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), remoteVideo.Handle);

    PortSIP_answerCall(PortSIPHandle, Sessions[i].GetSessionID);

    AddLog(Format('Answered the call automatically on line %d ', [i]));
    Exit;

  end;

  AddLog(Format('Line %d : call incoming from %s <%s>', [i, callbackMessage.callerDispalyName, callbackMessage.caller]));

  //  You should write your own code to play the wav file here for alert the incoming call(incoming tone);

  callbackMessage.Free;
end;

procedure TForm1.onInviteTrying(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  i : integer;
  state : boolean;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

  AddLog(Format('Line %d : call is trying...', [i]));


  callbackMessage.Free;
end;



procedure TForm1.onInviteRinging(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

  if callbackMessage.hasEarlyMedia = false then
  begin
    // No early media exists, you must play the local WAVE  file for ringing tone
  end;

   AddLog(Format('Line %d : call is ringing...', [i]));

   callbackMessage.Free;
end;



procedure TForm1.onInviteAnswered(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

   if callbackMessage.hasVideo = true then
   begin
     // this is the video call
   end
   else
   begin
     // no video exists in this call
   end;

   Sessions[i].SetSessionState(true);
   AddLog(Format('Line %d : call is established.', [i]));

   JoinConference(i);

   callbackMessage.Free;
end;


procedure TForm1.onInviteFailure(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

  Sessions[i].Reset;

  AddLog(Format('Line %d : call failed.', [i]));

  callbackMessage.Free;
end;

procedure TForm1.onInviteClosed(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

  Sessions[i].Reset;

  AddLog(Format('Line %d : call is closed.', [i]));

   callbackMessage.Free;
end;



procedure TForm1.onInviteUpdated(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

  AddLog(Format('Line %d : call is updated.', [i]));

   callbackMessage.Free;
end;



procedure TForm1.onInviteUASConnected(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   callbackMessage.Free;
end;



procedure TForm1.onInviteUACConnected(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);


   callbackMessage.Free;
end;



procedure TForm1.onBeingingForward(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);

   AddLog(Format('Call has been forwarded to %s .', [callbackMessage.forwardingTo]));

   callbackMessage.Free;
end;




procedure TForm1.onRemoteHold(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

  AddLog(Format('Line %d : place the call on hold by remote party.', [i]));


   callbackMessage.Free;
end;


procedure TForm1.onRemoteUnhold(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
    state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

  AddLog(Format('Line %d : take off hold by remote party.', [i]));


   callbackMessage.Free;
end;


procedure TForm1.onTransferTrying(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
    state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

  // for example, if A and B is established call, A transfer B to C, the transfer is trying,
  // B will got this transferTring event, and use referTo to know C ( C is "referTo" in this case)


  AddLog(Format('Line %d : transfer trying.', [i]));

   callbackMessage.Free;
end;



procedure TForm1.onTransferRinging(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state: boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
     state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

   AddLog(Format('Line %d : transfer is ringing.', [i]));

  // Use callbackMessage.hasVideo to check does this transfer call has video.
  // if callbackMessage.hasVideo is true, then it's have video, if hasVideo is false, means has no video.


   callbackMessage.Free;
end;



procedure TForm1.onPASVTransferSuccess(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

  PortSIP_setRemoteVideoWindow(PortSIPHandle, Sessions[i].GetSessionID(), remoteVideo.Handle);


   AddLog(Format('Line %d : transfer is succeeded.', [i]));


   callbackMessage.Free;
end;



procedure TForm1.onPASVTransferFailure(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

   AddLog(Format('Line %d : transfer is failed.', [i]));


   callbackMessage.Free;
end;


procedure TForm1.onACTVTransferSuccess(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
    state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

   AddLog(Format('Line %d : transfer is failed.', [i]));

   Sessions[i].Reset;

   callbackMessage.Free;
end;


procedure TForm1.onACTVTransferFailure(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

   AddLog(Format('Line %d : transfer is failed.', [i]));

   callbackMessage.Free;
end;



procedure TForm1.onRecvPagerMessage(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);

   AddLog(Format('Received the pager message from %s : %s', [callbackMessage.from, callbackMessage.textMessage]));

   callbackMessage.Free;
end;



procedure TForm1.onSendPagerMessageSuccess(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);


   callbackMessage.Free;
end;


procedure TForm1.onSendPagerMessageFailure(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);


   callbackMessage.Free;
end;


procedure TForm1.onArrviedSignaling(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);

  // This event will be fired when the SDK received a SIP message
  // you can use callbackMessage.signaling to access the SIP message.

   callbackMessage.Free;
end;


procedure TForm1.onSentSignaling(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);

  // This event will be fired when the SDK sent a SIP message
  // you can use callbackMessage.signaling to access the SIP message.

   callbackMessage.Free;
end;



procedure TForm1.onWaitingVoiceMessage(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);

   AddLog('Has waiting voice message');

   callbackMessage.Free;
end;



procedure TForm1.ShowMyFormBtnClick(Sender: TObject);
begin
Form4.Show;
end;

procedure TForm1.onWaingFaxMessage(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);

   AddLog('Has waiting FAX message');

   callbackMessage.Free;
end;



procedure TForm1.onRecvDtmfTone(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
  dtmfTone : string;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

  if callbackMessage.dtmfTone = 10 then
  begin
    dtmfTone := '*';
  end
  else if callbackMessage.dtmfTone = 11 then
  begin
    dtmfTone := '#';
  end
  else
  begin
    dtmfTone := IntToStr(callbackMessage.dtmfTone);
  end;

   AddLog(Format('Line %d : Reveived the DTMF tone: %s', [i, dtmfTone]));

   callbackMessage.Free;
end;



procedure TForm1.onPresenceRecvSubscribe(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);


   callbackMessage.Free;
end;



procedure TForm1.onPresenceOnline(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);


   callbackMessage.Free;
end;



procedure TForm1.onPresenceOffline(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);


   callbackMessage.Free;
end;


procedure TForm1.onRecvOption(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);


   // Received the OPTIONS message, it's callbackMessage.sipMessage.

   callbackMessage.Free;
end;



procedure TForm1.onRecvInfo(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

   // Received the INFO message, it's callbackMessage.sipMessage.


   callbackMessage.Free;
end;




procedure TForm1.onRecvMessage(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

   // Received the MESSAGE message on a line, it's callbackMessage.sipMessage.

   callbackMessage.Free;
end;




procedure TForm1.onRecvBinaryMessage(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);


   callbackMessage.Free;
end;




procedure TForm1.onRecvBinnaryPagerMessage(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
begin
   callbackMessage := TCallbackMessage(Message.WParam);


   callbackMessage.Free;
end;



procedure TForm1.onPlayWaveFileFinished(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);

   state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

   AddLog(Format('Line %d :, The wave file play finished, file name is %s', [i, callbackMessage.filePathName]));

   callbackMessage.Free;
end;




procedure TForm1.onPlayAviFileFinished(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);
    state := false;

  for i := LINE_BASE to MAXLINE do
  begin
     if (Sessions[i].GetSessionID() = callbackMessage.sessionId) then
     begin
       state := true;
       break;
     end;
  end;

  if (state = false) then
  begin
    Exit;
  end;

   AddLog(Format('Line %d :, The AVI file play finished', [i]));


   callbackMessage.Free;
end;


procedure TForm1.onAudioRawCallback(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);

   FreeMem(callbackMessage.data);
   callbackMessage.Free;
end;

procedure TForm1.onVideoRawCallback(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);

   FreeMem(callbackMessage.data);
   callbackMessage.Free;
end;

procedure TForm1.onReceivedRTPPacketCallback(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);

   FreeMem(callbackMessage.data);
   callbackMessage.Free;
end;


procedure TForm1.onSendingRTPPacketCallback(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  state : boolean;
  i : integer;
begin
   callbackMessage := TCallbackMessage(Message.WParam);

   FreeMem(callbackMessage.data);
   callbackMessage.Free;
end;



procedure TForm1.AddLog(const Line: string);
begin
    ListboxLog.Items.Add(Line);
end;


function TForm1.GetLocalIP : string;
type
  TaPInAddr = array [0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe:PHostEnt;
  pptr:PaPInAddr;
  Buffer:array [0..63] of Ansichar;
  I:Integer;
  GInitData:TWSADATA;
begin
  WSAStartup($202, GInitData);
  Result:= '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe:=GetHostByName(buffer);

  if phe = nil then Exit;

  pptr:= PaPInAddr(Phe^.h_addr_list);
  I:= 0;

  while pptr^[I] <> nil do
  begin
    result:=StrPas(inet_ntoa(pptr^[I]^));
    Inc(I);
  end;

end;


procedure TForm1.JoinConference(const index: Integer);
begin
  if (Initialized = False) then
  begin
    Exit;
  end;

  if CheckBoxConference.Checked = false then
  begin
    Exit;
  end;

  PortSIP_joinToConference(PortSIPHandle, Sessions[index].GetSessionID());
  Sessions[index].SetHoldState(false);

end;



procedure TForm1.LoadDevice;
var
  nums: integer;
  volume: integer;
  deviceName: array[0..255] of AnsiChar;
  uniqueId: array[0..255] of AnsiChar;
  i : integer;
begin
  if (Initialized = False) then
  begin
    Exit;
  end;

   nums := PortSIP_getNumOfPlayoutDevices(PortSIPHandle);
   for i := 0 to nums-1 do
   begin
     if PortSIP_getPlayoutDeviceName(PortSIPHandle, i, @deviceName, 255) = 0 then
     begin
       ComboBoxSpeaker.Items.Add(deviceName);
     end;
   end;

   ComboBoxSpeaker.ItemIndex := 0;

   nums := PortSIP_getNumOfRecordingDevices(PortSIPHandle);
   for i := 0 to nums-1 do
     begin
        if PortSIP_getRecordingDeviceName(PortSIPHandle, i, @deviceName, 255) = 0 then
        begin
          ComboBoxMicrophone.Items.Add(deviceName);
        end;
     end;

     ComboBoxMicrophone.ItemIndex := 0;

     volume := PortSIP_getSpeakerVolume(PortSIPHandle);
     TrackBarSpeaker.Position := volume;

     volume := PortSIP_getMicVolume(PortSIPHandle);
     TrackBarMicrophone.Position := volume;

    nums := PortSIP_getNumOfVideoCaptureDevices(PortSIPHandle);
    for i := 0 to nums-1 do
     begin
        if PortSIP_getVideoCaptureDeviceName(PortSIPHandle, i, @uniqueId, 255, @deviceName, 255) = 0 then
        begin
          ComboBoxCamera.Items.Add(deviceName);
        end;
     end;

     ComboBoxCamera.ItemIndex := 0;

end;



procedure TForm1.InitSettings();
var
   SRTPPolicy: integer;
begin

  if (Initialized = False) then
  begin
    Exit;
  end;


  SRTPPolicy := SRTP_POLICY_NONE;
  if ComboBoxSRTP.ItemIndex = 1 then
  begin
     SRTPPolicy := SRTP_POLICY_PREFER;
  end
  else if ComboBoxSRTP.ItemIndex = 2 then
  begin
     SRTPPolicy := SRTP_POLICY_FORCE;
  end;

  PortSIP_setSrtpPolicy(PortSIPHandle, SRTPPolicy);

  PortSIP_enableAEC(PortSIPHandle, CheckBoxAEC.Checked);
  PortSIP_enableCNG(PortSIPHandle, CheckBoxCNG.Checked);
  PortSIP_enableVAD(PortSIPHandle, CheckBoxVAD.Checked);
  PortSIP_enableAGC(PortSIPHandle, CheckBoxAGC.Checked);


end;



procedure TForm1.InitDefaultAudioCodecs();
begin

  if (Initialized = False) then
  begin
    Exit;
  end;


    PortSIP_clearAudioCodec(PortSIPHandle);


// Default we just using PCMU, PCMA, G729, G.722.1
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_PCMU);   // G711 uLaw
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_G729);   // G729
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_PCMA);   // PCMA

    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_DTMF);   // DTMF
end;




procedure TForm1.InitDefaultVideoCodecs();
begin

  if (Initialized = False) then
  begin
    Exit;
  end;

    PortSIP_clearVideoCodec(PortSIPHandle);

// Default we just using H264

    PortSIP_addVideoCodec(PortSIPHandle, VIDEOCODEC_H264);

end;



procedure TForm1.UpdateVideoResolution();
begin
  if (Initialized = False) then
  begin
    Exit;
  end;

  case ComboBoxResolution.ItemIndex of
  0:  PortSIP_setVideoResolution(PortSIPHandle, VIDEO_QCIF);
  1:  PortSIP_setVideoResolution(PortSIPHandle, VIDEO_CIF);
  2:  PortSIP_setVideoResolution(PortSIPHandle, VIDEO_VGA);
  3:  PortSIP_setVideoResolution(PortSIPHandle, VIDEO_SVGA);
  4:  PortSIP_setVideoResolution(PortSIPHandle, VIDEO_XVGA);
  5:  PortSIP_setVideoResolution(PortSIPHandle, VIDEO_720P);
  6:  PortSIP_setVideoResolution(PortSIPHandle, VIDEO_QVGA);
  end;
end;


procedure TForm1.UpdateVideoQuality();
begin
  if (Initialized = False) then
  begin
    Exit;
  end;

    PortSIP_setVideoBitrate(PortSIPHandle, TrackBarQuality.Position);
end;


procedure TForm1.Label24Click(Sender: TObject);
begin
   ShellExecute(Handle,'open','mailto:sales@portsip.com', nil, nil, sw_shownormal);
end;



procedure TForm1.Label23Click(Sender: TObject);
begin
    ShellExecute(Handle,'open','http://www.portsip.com', nil, nil, sw_shownormal);
end;



procedure TForm1.TrackBarQualityChange(Sender: TObject);
begin
  if (Initialized = False) then
  begin
    Exit;
  end;

    UpdateVideoQuality();
end;

procedure TForm1.TrackBarMicrophoneChange(Sender: TObject);
begin
  if (Initialized = False) then
  begin
    Exit;
  end;

    PortSIP_setMicVolume(PortSIPHandle, TrackBarMicrophone.Position);
end;

procedure TForm1.TrackBarSpeakerChange(Sender: TObject);
begin
  if (Initialized = False) then
  begin
    Exit;
  end;

    PortSIP_setSpeakerVolume(PortSIPHandle, TrackBarSpeaker.Position);
end;

procedure TForm1.UpdateAudioCodecs();
begin
  if (Initialized = False) then
  begin
    Exit;
  end;

  PortSIP_clearAudioCodec(PortSIPHandle);

  if (CheckBoxG711U.Checked = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_PCMU);
  end;

   if (CheckBoxG711A.Checked = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_PCMA);
  end;

  if (CheckBoxG729.Checked = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_G729);
  end;

  if (CheckBoxAMR.Checked = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_AMR);
  end;

  if (CheckBoxILBC.Checked = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_ILBC);
  end;

  if (CheckBoxGSM.Checked = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_GSM);
  end;

  if (CheckBoxG7221.Checked = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_G7221);
  end;

  if (CheckBoxG722.Checked = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_G722);
  end;

  if (CheckBoxSPEEX.Checked = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_SPEEX);
  end;

  if (CheckBoxSPEEXWB.Checked = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_SPEEXWB);
  end;

  if (CheckBoxAMRWB.Checked = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_AMRWB);
  end;

  PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_DTMF);


end;



procedure TForm1.UpdateVideoCodecs();
begin
  if (Initialized = False) then
  begin
    Exit;
  end;

  PortSIP_clearVideoCodec(PortSIPHandle);

  if (CheckBoxH263.Checked = True) then
  begin
    PortSIP_addVideoCodec(PortSIPHandle, VIDEOCODEC_H263);
  end;

   if (CheckBoxH2631998.Checked = True) then
  begin
    PortSIP_addVideoCodec(PortSIPHandle, VIDEOCODEC_H263_1998);
  end;

  if (CheckBoxH264.Checked = True) then
  begin
    PortSIP_addVideoCodec(PortSIPHandle, VIDEOCODEC_H264);
  end;

  if (CheckBoxVP8.Checked = True) then
  begin
    PortSIP_addVideoCodec(PortSIPHandle, VIDEOCODEC_VP8);
  end;

end;



procedure TForm1.FormCreate(Sender: TObject);
var
  Text : string;
  i : integer;
begin
    Randomize;

    Text :=  'This sample was built base on evaluation PortSIP VoIP SDK, which allows only three minutes conversation. The conversation will be cut off ';
    Text := Text + 'automatically after three minutes, then you can not hearing anything. Feel free contact us at: sales@portsip.com to purchase the official version.';
    ShowMessage(Text);


    ComboBoxSpeaker.ItemIndex := 0;
    ComboBoxMicrophone.ItemIndex := 0;

    ComboBoxCamera.ItemIndex := 0;


  for i:=0 to (8) do
  begin
    Sessions[i] := TSession.Create ;
    Sessions[i].SetSessionID(0);
    Sessions[i].SetSessionState(False);
    Sessions[i].SetHoldState(False);
    Sessions[i].SetRecvCallState(False);
  end;


  Initialized := False;
  CurrentLine := LINE_BASE;
  ComboBoxLines.ItemIndex := 0;

  ComboBoxResolution.ItemIndex := 1;

  PortSIPHandle := 0;
  EventHandle := 0;

end;



procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
  Text : String;
begin
  if (Initialized = False)  then
  begin
    Exit;
  end;

  for i := LINE_BASE to MAXLINE do
  begin
    if (Sessions[i].GetRecvCallState() = True) then
    begin
      Text := 'Busy Here';
      PortSIP_rejectCall(PortSIPHandle, Sessions[i].GetSessionID(), 486, PAnsiChar(Text));
    end
    else if (Sessions[i].GetSessionState() = True) then
    begin
      PortSIP_terminateCall(PortSIPHandle, Sessions[i].GetSessionID());
    end;

    Sessions[i].Reset();

  end;


  SIPEV_shutdownSIPCallbackHandle(EventHandle);
  PortSIP_unInitialize(PortSIPHandle);
  SIPEV_releaseSIPCallbackHandle(EventHandle);


  Initialized := False;

  ListboxLog.Clear();

  PortSIPHandle := 0;
  EventHandle := 0;

end;




procedure TForm1.Button1Click(Sender: TObject);

const SIPPORT_MIN : integer = 8000;
var LocalIP : String;
    UserName : String;
    Password : String;
    SIPServer : String;
    Agent : String;
    STUNServer : String;
    OutboundServer : String;
    UserDomain : String;
    DisplayName : String;
    AuthName : String;
    LocalSIPPort : integer;

    SIPServerPort : integer;
    OutboundServerPort : integer;
    STUNServerPort : integer;

    LicenseKey : String;
    transport : integer;
    SRTPPolicy : integer;
    ErrorCode : integer;

begin
  if (Initialized = True) then
  begin
    ShowMessage('alreay logged in');
    Exit;
  end;

  if (length(EditUserName.Text) = 0) then
  begin
    ShowMessage('Please enter user name');
    Exit;
  end;

  if (length(EditPassword.Text) = 0) then
  begin
    ShowMessage('Please enter password');
    Exit;
  end;

  // For P2P call(without SIP proxy server), we pass the SIP proxy server,
  // outbound proxy server, stun server as empty.


  LocalIP := GetLocalIP();
  Label24.Caption:=LocalIP;
  if (length(EditLocalPort.Text) > 0) then
  begin
    LocalSIPPort := StrToInt(EditLocalPort.Text);
  end
  else
  begin
     ShowMessage('Please enter local SIP port');
    Exit;
  end;

  UserName := EditUserName.Text;
  Password := EditPassword.Text;
  SIPServer := '';
  Agent := 'PortSIP VoIP SDK 7.0';
  UserDomain := '';
  OutboundServer := ''; // Default we are don't use outbound server
  OutboundServerPort := 0;
  STUNServer := '';
  DisplayName := '';
  AuthName := '';
  SIPServerPort := 0;
  STUNServerPort := 0;
  transport := TRANSPORT_UDP;

  createCallbackHandler();



  PortSIPHandle := PortSIP_initialize(EventHandle,
                        transport,
                        PORTSIP_LOG_NONE,
                        nil,
                        8,
                        pansichar(ansistring(Agent)),
                        pansichar(ansistring(STUNServer)),
                        STUNServerPort,
                        false,
                        false,
                        ErrorCode);
  if (ErrorCode <> 0 )then
  begin
    Initialized := False;
    ShowMessage('Initialize PortSIPCoreLib failed');
    Exit;
  end;

  Initialized := True;
  LicenseKey := 'PORTSIP_TEST_LICENSE';
  PortSIP_setLicenseKey(PortSIPHandle, pansichar(ansistring(LicenseKey)));

  InitSettings();

  AddLog('Initialized the SDK.');

  ErrorCode := PortSIP_setUserInfo(PortSIPHandle,
                                  pansichar(ansistring(UserName)),
                                  pansichar(ansistring(DisplayName)),
                                  pansichar(ansistring(AuthName)),
                                  pansichar(ansistring(Password)),
                                  pansichar(ansistring(LocalIP)),
                                  LocalSIPPort,
                                  pansichar(ansistring(UserDomain)),
                                  pansichar(ansistring(SIPServer)),
                                  SIPServerPort,
                                  pansichar(ansistring(OutboundServer)),
                                  OutboundServerPort);
  if (ErrorCode <> 0) then
  begin
    PortSIP_unInitialize(PortSIPHandle);
    PortSIPHandle := 0;

    SIPEV_shutdownSIPCallbackHandle(EventHandle);
    SIPEV_releaseSIPCallbackHandle(EventHandle);
    EventHandle := 0;

    ListboxLog.Clear();

    ShowMessage('SetUserInfo failed.');

    Exit;

  end;

  AddLog('Set user information succeeded.');

  LoadDevice();


	PortSIP_setLocalVideoWindow(PortSIPHandle, LocalVideo.handle);

	InitDefaultAudioCodecs();
	InitDefaultVideoCodecs();

	initSettings();

	UpdateVideoResolution();
	UpdateVideoQuality();


  AddLog('Ready.');

end;


procedure TForm1.Button20Click(Sender: TObject);
var
  TransferNumber : String;
  Text : string;
begin
  if (Initialized = False) then
    begin
      Exit;
    end;

    if (Sessions[CurrentLine].GetSessionState() = False) then
    begin
      ShowMessage('Please make the call established first');
      Exit;
    end;

    if Form2.ShowModal() <> mrOk then
    begin
      Exit
    end;

    if (length(Form2.Edit1.Text) <= 0) then
    begin
      ShowMessage('The Transfer number is empty');
      Exit;
    end;


    TransferNumber := Form2.Edit1.Text;

    if (PortSIP_refer(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), pansichar(ansistring(TransferNumber))) <> 0) then
    begin
      Text := 'Line ';
      Text := Text + IntToStr(Currentline);
      Text := Text + ' : Transfer failed';
      AddLog(Text);
      Exit
    end;

      Text := 'Line ';
      Text := Text + IntToStr(Currentline);
      Text := Text + ' : Transfering';
      AddLog(Text);

end;

procedure TForm1.Button21Click(Sender: TObject);
var
  Text : string;
begin
  if (Initialized = False) then
    begin
      Exit;
    end;

    if (Sessions[CurrentLine].GetRecvCallState() = False) then
    begin
      ShowMessage('Current line have not the incoming call, please switch a line.');
      Exit;
    end;

    Sessions[CurrentLine].SetRecvCallState(False);
    Sessions[CurrentLine].SetSessionState(True);

    PortSIP_setRemoteVideoWindow(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), remoteVideo.Handle);

    if (PortSIP_answerCall(PortSIPHandle, Sessions[CurrentLine].GetSessionID()) = 0) then
      begin
        Text := 'Line ';
        Text := Text + IntToStr(Currentline);
        Text := Text + ' : Call established';
        AddLog(Text);
      end
    else
      begin
        Sessions[CurrentLine].Reset();
        Text := 'Line ';
        Text := Text + IntToStr(Currentline);
        Text := Text + ' : Answer call failed!';
        AddLog(Text);
      end;
end;


procedure TForm1.Button23Click(Sender: TObject);
var
  TransferNumber : String;
  Text : string;
  ReplaceLine : Integer;
begin
  if (Initialized = False) then
    begin
      Exit;
    end;

    if (Sessions[CurrentLine].GetSessionState() = False) then
    begin
      ShowMessage('Please make the call established first');
      Exit;
    end;

    if Form2.ShowModal() <> mrOk then
    begin
      Exit
    end;

    if (length(Form2.Edit1.Text) <= 0) then
    begin
      ShowMessage('The Transfer number is empty');
      Exit;
    end;


    if (length(Form2.EditLineNum.Text) <= 0) then
    begin
      ShowMessage('The replace line is empty');
      Exit;
    end;

    ReplaceLine := StrToInt(Form2.EditLineNum.Text);
    if ((ReplaceLine<=0) Or (ReplaceLine>MAXLINE)) then
    begin
      ShowMessage('The replace line out of range');
      Exit;
    end;

    if (Sessions[ReplaceLine].GetSessionState() = False) then
    begin
        ShowMessage('The replace line does not established yet');
      Exit;
    end;


    TransferNumber := Form2.Edit1.Text;

    if (PortSIP_attendedRefer(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), Sessions[ReplaceLine].GetSessionID(), pansichar(ansistring(TransferNumber))) <> 0) then
    begin
      Text := 'Line ';
      Text := Text + IntToStr(Currentline);
      Text := Text + ' : Transfer failed';
      AddLog(Text);

      Exit
    end;

      Text := 'Line ';
      Text := Text + IntToStr(Currentline);
      Text := Text + ' : Transfering';
      AddLog(Text);
end;



procedure TForm1.Button24Click(Sender: TObject);
var
  deviceName: array[0..256] of Ansichar;
  uniqueId: array[0.. 256] of Ansichar;
  len : integer;
begin
  if PortSIP_getVideoCaptureDeviceName(PortSIPHandle,
                                                ComboBoxCamera.ItemIndex,
                                                @uniqueId,
                                                256,
                                                @deviceName,
                                                256) <> 0 then
  begin
    ShowMessage('Get camera name failed.');
    Exit;
  end;

  if PortSIP_showVideoCaptureSettingsDialogBox(PortSIPHandle,
                                                uniqueId,
                                                length(uniqueId),
                                                'Camera settings',
                                                Application.MainForm.Handle,
                                                200,
                                                200 ) <> 0 then
  begin
    ShowMessage('Show the camera settings dialog failed.');
    Exit;
  end;

end;

procedure TForm1.Button25Click(Sender: TObject);
begin
  if (Initialized = False)  then
  begin
    Exit;
  end;

  if (Button25.Caption = 'Local Video') then
  begin
    PortSIP_viewLocalVideo(PortSIPHandle, true);
    Button25.Caption := 'Stop Local';
  end
  else
  begin
    PortSIP_viewLocalVideo(PortSIPHandle, false);
    Button25.Caption := 'Local Video';
  end;



end;

procedure TForm1.Button26Click(Sender: TObject);
begin
  if (Initialized = False)  then
  begin
    Exit;
  end;

  if (Sessions[CurrentLine].GetSessionState() = True) then
  begin
    if PortSIP_startVideoSending(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), true) <> 0 then
    begin
      ShowMessage('Start send video failed.');
    end;
  end;

end;

procedure TForm1.Button27Click(Sender: TObject);
begin
  if (Initialized = False)  then
  begin
    Exit;
  end;

  if (Sessions[CurrentLine].GetSessionState() = True) then
  begin
    PortSIP_startVideoSending(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), false);
  end;

end;

procedure TForm1.Button28Click(Sender: TObject);
var
PathTest:string;
begin
    ListboxLog.Clear();
    PathTest :='m:\OldPhone.wav';
    SndPlaySound(PChar(PathTest), SND_ASYNC or SND_LOOP);
end;

procedure TForm1.Button29Click(Sender: TObject);
var
  FilePath : string;
begin
  if (SelectDirectory('Please select the directory', 'c:\', FilePath) = True) then
  begin
    EditRecordFilePath.Text := FilePath;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i : integer;
  Text : String;
begin
  if (Initialized = False)  then
  begin
    Exit;
  end;

  for i := LINE_BASE to MAXLINE do
  begin
    if (Sessions[i].GetRecvCallState() = True) then
    begin
      Text := 'Busy Here';
      PortSIP_rejectCall(PortSIPHandle, Sessions[i].GetSessionID(), 486, pansichar(ansistring(Text)));
    end
    else if (Sessions[i].GetSessionState() = True) then
    begin
      PortSIP_terminateCall(PortSIPHandle, Sessions[i].GetSessionID());
    end;

    Sessions[i].Reset();

  end;

  SIPEV_shutdownSIPCallbackHandle(EventHandle);
  PortSIP_unInitialize(PortSIPHandle);
  SIPEV_releaseSIPCallbackHandle(EventHandle);

  Initialized := False;

  ListboxLog.Clear();

end;

procedure TForm1.Button30Click(Sender: TObject);
var
  FilePath : String;
  FileName : String;
  FileFormat : Integer;
begin
  if (Initialized = False)  then
  begin
    ShowMessage('Please initialize the SDK first.');
    Exit;
  end;

  if (length(EditRecordFilePath.Text) = 0) then
  begin
    ShowMessage('Please select a directory');
    Exit;
  end;

  FilePath := EditRecordFilePath.Text;

  if (length(EditAudioRecordFileName.Text) = 0) then
  begin
    FileName := 'RecordFile';
  end
  else
  begin
    FileName :=  EditAudioRecordFileName.Text;
  end;

  FileFormat := FILEFORMAT_WAVE;

  if PortSIP_startAudioRecording(PortSIPHandle, pansichar(ansistring(FilePath)), pansichar(ansistring(FileName)), true, FileFormat, RECORD_BOTH) = 0 then
  begin
     ShowMessage('Start recording audio conversation.');
  end
  else
  begin
     ShowMessage('Failed to start recording audio conversation.');
  end;

end;

procedure TForm1.Button31Click(Sender: TObject);
begin
  if (Initialized = False)  then
  begin
    ShowMessage('Please initialize the SDK first.');
    Exit;
  end;

  PortSIP_stopAudioRecording(PortSIPHandle);

end;

procedure TForm1.Button32Click(Sender: TObject);
begin
  if (OpenDialog1.Execute() = True) then
  begin
    EditPlayWaveFileName.Text := OpenDialog1.FileName;
  end;

end;

procedure TForm1.Button33Click(Sender: TObject);
var
  PlayFile : String;
begin
  if (Initialized = False)  then
  begin
    ShowMessage('Please initialize the SDK first.');
    Exit;
  end;


  if (length(EditPlayWaveFileName.Text) = 0) then
  begin
    ShowMessage('The play file is empty.');
    Exit;
  end;

  PlayFile := EditPlayWaveFileName.Text;
  PortSIP_setPlayWaveFileToRemote(PortSIPHandle,
                                  Sessions[CurrentLine].GetSessionID(),
                                  pansichar(ansistring(PlayFile)),
                                  true,
                                  0,
                                  16000,
                                  0,
                                  PlayWaveFileToRemoteFinished);


end;

procedure TForm1.Button34Click(Sender: TObject);
var
  PlayFile : String;
begin
  if (Initialized = False)  then
  begin
    ShowMessage('Please initialize the SDK first.');
    Exit;
  end;


  if (length(EditPlayWaveFileName.Text) = 0) then
  begin
    ShowMessage('The play file is empty.');
    Exit;
  end;

  PlayFile := EditPlayWaveFileName.Text;
  PortSIP_setPlayWaveFileToRemote(PortSIPHandle,
                                  Sessions[CurrentLine].GetSessionID(),
                                  pansichar(ansistring(PlayFile)),
                                  false,
                                  0,
                                  16000,
                                  0,
                                  nil);


end;

procedure TForm1.Button35Click(Sender: TObject);
var
  FilePath : String;
  FileName : String;
begin
  if (Initialized = False)  then
  begin
    ShowMessage('Please initialize the SDK first.');
    Exit;
  end;

  if (length(EditRecordFilePath.Text) = 0) then
  begin
    ShowMessage('Please select a directory');
    Exit;
  end;


  FilePath := EditRecordFilePath.Text;

  if (length(EditVideoRecordFileName.Text) = 0) then
  begin
    ShowMessage('The record file name is empty');
    Exit;
  end;

  FileName :=  EditVideoRecordFileName.Text;

  if PortSIP_startVideoRecording(PortSIPHandle, pansichar(ansistring(FilePath)), pansichar(ansistring(FileName)), true, VIDEOCODEC_H264, RECORD_BOTH) <> 0 then
  begin
     ShowMessage('Failed started recording video conversation.');
     Exit;
  end;

  ShowMessage('Started recording Video conversation.');

end;

procedure TForm1.Button36Click(Sender: TObject);
begin
  if (Initialized = False)  then
  begin
    ShowMessage('Please initialize the SDK first.');
    Exit;
  end;

  PortSIP_stopVideoRecording(PortSIPHandle);
end;


procedure TForm1.Button37Click(Sender: TObject);
var
   forwardTo : String;
begin
  if (Initialized = False)  then
    begin
      ShowMessage('Please initialize the SDK first.');
      Exit;
    end;

  if ((pos('sip:', EditForwardAddress.Text)=0) or  (pos('@', EditForwardAddress.Text)=0))then
    begin
      ShowMessage('The forward address must likes sip:xxxx@sip.portsip.com.');
      Exit;
    end;

  forwardTo := EditForwardAddress.Text;

  if CheckBoxForwardCallBusy.Checked = True then
    begin
      PortSIP_enableCallForwarding(PortSIPHandle, true, pansichar(ansistring(forwardTo)));
    end
  else
    begin
      PortSIP_enableCallForwarding(PortSIPHandle, false, pansichar(ansistring(forwardTo)));
    end;

    ShowMessage('Call forward is enabled.');

end;




procedure TForm1.Button38Click(Sender: TObject);
begin
  if (Initialized = False)  then
    begin
      ShowMessage('Please initialize the SDK first.');
      Exit;
    end;

    PortSIP_disableCallForwarding(PortSIPHandle);
    ShowMessage('Call forward is disabled.');
end;



procedure TForm1.Button3Click(Sender: TObject);
begin
  EditPhoneNumber.Text :=  EditPhoneNumber.Text + '1';
  if ((Initialized = True) and (Sessions[CurrentLine].GetSessionState() = True)) then
    begin
      PortSIP_sendDTMF(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), '1');
    end;
end;




procedure TForm1.Button4Click(Sender: TObject);
begin
  EditPhoneNumber.Text :=  EditPhoneNumber.Text + '2';
  if ((Initialized = True) and (Sessions[CurrentLine].GetSessionState() = True)) then
    begin
      PortSIP_sendDTMF(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), '2');
    end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  EditPhoneNumber.Text :=  EditPhoneNumber.Text + '3';
  if ((Initialized = True) and (Sessions[CurrentLine].GetSessionState() = True)) then
    begin
      PortSIP_sendDTMF(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), '3');
    end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  EditPhoneNumber.Text :=  EditPhoneNumber.Text + '4';
  if ((Initialized = True) and (Sessions[CurrentLine].GetSessionState() = True)) then
    begin
      PortSIP_sendDTMF(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), '4');
    end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  EditPhoneNumber.Text :=  EditPhoneNumber.Text + '5';
  if ((Initialized = True) and (Sessions[CurrentLine].GetSessionState() = True)) then
    begin
      PortSIP_sendDTMF(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), '5');
    end;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  EditPhoneNumber.Text :=  EditPhoneNumber.Text + '6';
  if ((Initialized = True) and (Sessions[CurrentLine].GetSessionState() = True)) then
    begin
      PortSIP_sendDTMF(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), '6');
    end;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  EditPhoneNumber.Text :=  EditPhoneNumber.Text + '7';
  if ((Initialized = True) and (Sessions[CurrentLine].GetSessionState() = True)) then
    begin
      PortSIP_sendDTMF(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), '7');
    end;
end;



procedure TForm1.Button10Click(Sender: TObject);
begin
  EditPhoneNumber.Text :=  EditPhoneNumber.Text + '8';
  if ((Initialized = True) and (Sessions[CurrentLine].GetSessionState() = True)) then
    begin
      PortSIP_sendDTMF(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), '8');
    end;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  EditPhoneNumber.Text :=  EditPhoneNumber.Text + '9';
  if ((Initialized = True) and (Sessions[CurrentLine].GetSessionState() = True)) then
    begin
      PortSIP_sendDTMF(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), '9');
    end;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  EditPhoneNumber.Text :=  EditPhoneNumber.Text + '*';
  if ((Initialized = True) and (Sessions[CurrentLine].GetSessionState() = True)) then
    begin
      PortSIP_sendDTMF(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), '*');
    end;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
   EditPhoneNumber.Text :=  EditPhoneNumber.Text + '0';
  if ((Initialized = True) and (Sessions[CurrentLine].GetSessionState() = True)) then
    begin
      PortSIP_sendDTMF(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), '0');
    end;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
   EditPhoneNumber.Text :=  EditPhoneNumber.Text + '#';
  if ((Initialized = True) and (Sessions[CurrentLine].GetSessionState() = True)) then
    begin
      PortSIP_sendDTMF(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), '#');
    end;
end;




procedure TForm1.Button15Click(Sender: TObject);
var
  SessionID : Integer;
  CallTo : String;
  Text : string;
  HasSDP : Boolean;
  ErrorCode : Integer;
begin
  if (Initialized = False) then
    begin
      Exit;
    end;
  if (length(EditPhoneNumber.Text) <= 0) then
  begin
    ShowMessage('The phone number is empty');
    Exit;
  end;

  if ((Sessions[Currentline].GetSessionState() = True) Or (Sessions[Currentline].GetRecvCallState() = True)) then
  begin
     ShowMessage('Current line is busy, please switch a line');
    Exit;
  end;

  CallTo := CallTo+EditPhoneNumber.Text;
  if (pos('sip:', CallTo)=0) or (pos('@', CallTo)=0) then
  begin
    ShowMessage('For P2P call(without SIP server), the phone number must likes: sip:12345@192.168.1.111');
    Exit;
  end;
  UpdateAudioCodecs();
  UpdateVideoCodecs();

  if (PortSIP_isAudioCodecEmpty(PortSIPHandle) = true) then
  begin
    InitDefaultAudioCodecs();
  end;
  CallTo := EditPhoneNumber.Text;

  if (CheckBoxSDP.Checked = True) then
  begin
    HasSDP := false;
  end
  else
  begin
    HasSDP := true;
  end;
  PortSIP_setAudioDeviceId(PortSIPHandle, comboBoxMicrophone.ItemIndex, comboBoxSpeaker.ItemIndex);
  SessionID := PortSIP_call(PortSIPHandle, pansichar(ansistring(CallTo)), HasSDP, ErrorCode);
  if (SessionID = INVALID_SESSION_ID ) then
  begin
    AddLog('Call Failed');
    Exit;
  end;

  PortSIP_setRemoteVideoWindow(PortSIPHandle, SessionID, remoteVideo.Handle);

  Sessions[CurrentLine].SetSessionID(SessionID);
  Sessions[CurrentLine].SetSessionState(True);

  Text := 'Line ';
  Text := Text + IntToStr(Currentline);
  Text := Text + ' : calling...';
  AddLog(Text);

end;



procedure TForm1.Button16Click(Sender: TObject);
var
  Text : String;
  Logs : string;
begin
  if (Initialized = False) then
    begin
      Exit;
    end;


    Text := 'Busy Here';
    if (Sessions[CurrentLine].GetRecvCallState() = True) then
    begin
      PortSIP_rejectCall(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), 486, pansichar(ansistring(Text)));
      Sessions[CurrentLine].Reset();

      Logs := 'Line ';
      Logs := Logs + IntToStr(Currentline);
      Logs := Logs + ' : Reject the call';
      AddLog(Logs);

      Exit;
    end;


    if (Sessions[CurrentLine].GetSessionState() = True) then
    begin
      PortSIP_terminateCall(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
      Sessions[CurrentLine].Reset();

      Logs := 'Line ';
      Logs := Logs + IntToStr(Currentline);
      Logs := Logs + ' : Hang up the call';
      AddLog(Logs);

      Exit;
    end;

end;



procedure TForm1.Button17Click(Sender: TObject);
var
  Text : String;
  Logs : string;
begin
  if (Initialized = False) then
    begin
      Exit;
    end;

    Text := 'Busy Here';
    if (Sessions[CurrentLine].GetRecvCallState() = True) then
    begin
      PortSIP_rejectCall(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), 486, pansichar(ansistring(Text)));
      Sessions[CurrentLine].Reset();

      Logs := 'Line ';
      Logs := Logs + IntToStr(Currentline);
      Logs := Logs + ' : Reject the call';
      AddLog(Logs);
    end;

end;

procedure TForm1.Button18Click(Sender: TObject);
var
  Text : string;
begin
  if (Initialized = False) then
    begin
      Exit;
    end;

    if (Sessions[CurrentLine].GetSessionState() = False) then
    begin
      Exit;
    end;

    if (Sessions[CurrentLine].GetHoldState() = True) then
    begin
      Exit;
    end;

    PortSIP_hold(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
    Sessions[CurrentLine].SetHoldState(True);

    Text := 'Line ';
    Text := Text + IntToStr(Currentline);
    Text := Text + ' : hold';
    AddLog(Text);

end;

procedure TForm1.Button19Click(Sender: TObject);
var
  Text : string;
begin
  if (Initialized = False) then
    begin
      Exit;
    end;

    if (Sessions[CurrentLine].GetSessionState() = False) then
    begin
      Exit;
    end;

    if (Sessions[CurrentLine].GetHoldState() = False) then
    begin
      Exit;
    end;

    PortSIP_unHold(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
    Sessions[CurrentLine].SetHoldState(False);

    Text := 'Line ';
    Text := Text + IntToStr(Currentline);
    Text := Text + ' : Un-Hold';
    AddLog(Text);

end;




procedure TForm1.CheckBoxAECClick(Sender: TObject);
begin
  if (Initialized = False) then
    begin
      Exit;
    end;


    if (CheckBoxAEC.Checked = True) then
    begin
      PortSIP_enableAEC(PortSIPHandle, true);
    end
    else
    begin
      PortSIP_enableAEC(PortSIPHandle, false);
    end;


end;

procedure TForm1.CheckBoxAGCClick(Sender: TObject);
begin
  if (Initialized = False) then
    begin
      Exit;
    end;


    if (CheckBoxAGC.Checked = True) then
    begin
      PortSIP_enableAGC(PortSIPHandle, true);
    end
    else
    begin
      PortSIP_enableAGC(PortSIPHandle, false);
    end;

end;

procedure TForm1.CheckBoxAMRWBClick(Sender: TObject);
begin
  UpdateAudioCodecs();
end;

procedure TForm1.CheckBoxAudioStreamCallbackClick(Sender: TObject);
begin
  if (Initialized = False)  then
  begin
    ShowMessage('Please initialize the SDK first.');
    Exit;
  end;

  if (CheckBoxAudioStreamCallback.Checked = True) then
  begin
    if PortSIP_enableAudioStreamCallback(PortSIPHandle,
                                          Sessions[CurrentLine].GetSessionID(),
                                          true,
                                          AUDIOSTREAM_REMOTE_PER_CHANNEL,
                                          0,
                                          AudioRawCallback) <> 0 then
    begin
      ShowMessage('Enable the audio stream callback failed.');
      CheckBoxAudioStreamCallback.Checked := false;
    end
  end
  else
  begin
    PortSIP_enableAudioStreamCallback(PortSIPHandle,
                                          Sessions[CurrentLine].GetSessionID(),
                                          false,
                                          AUDIOSTREAM_REMOTE_PER_CHANNEL,
                                          0,
                                          AudioRawCallback)
  end;

end;



procedure TForm1.CheckBoxCNGClick(Sender: TObject);
begin
  if (Initialized = False) then
    begin
      Exit;
    end;

    if (CheckBoxCNG.Checked = True) then
    begin
      PortSIP_enableCNG(PortSIPHandle, true);
    end
    else
    begin
      PortSIP_enableCNG(PortSIPHandle, false);
    end;

end;

procedure TForm1.CheckBoxConferenceClick(Sender: TObject);
var
  i : Integer;
  Text : string;
  resolution : Integer;
begin

  if (Initialized = False) then
    begin
      CheckBoxConference.Checked := False;
      Exit;
    end;

    resolution := VIDEO_CIF;

    case ComboBoxResolution.ItemIndex of
    0:  resolution := VIDEO_QCIF;
    1:  resolution := VIDEO_CIF;
    2:  resolution := VIDEO_VGA;
    3:  resolution := VIDEO_SVGA;
    4:  resolution := VIDEO_XVGA;
    5:  resolution := VIDEO_720P;
    6:  resolution := VIDEO_QVGA;
    end;


    if CheckBoxConference.Checked = True then
    begin
      if (PortSIP_createConference(PortSIPHandle, RemoteVideo.Handle, resolution, false) = 0)  then
        begin
          AddLog('Make conference succeeded');
          for i := LINE_BASE to MAXLINE do
          begin
            if Sessions[i].GetSessionState() = True  then
            begin
              JoinConference(i);
            end;
          end;
        end
      else
        begin
          AddLog('Make conference failed.');
          CheckBoxConference.Checked := False;
        end;

      Exit;
    end
    else
    begin
    // Stop conference
    // Before stop the conference, MUST place all lines to hold state

       for i := LINE_BASE to MAXLINE do
      begin
        if ((Sessions[i].GetSessionState()=True) and (Sessions[i].GetHoldState = False)) then
        begin
          PortSIP_hold(PortSIPHandle, Sessions[i].GetSessionID());
          Sessions[i].SetHoldState(True);

          Text := 'Line ';
          Text := Text+IntToStr(i);
          Text := Text+' : ';
          Text := Text+'Hold';
        end;
      end;


      PortSIP_destroyConference(PortSIPHandle);
      AddLog('Taken off Conference');

    end;

end;




procedure TForm1.CheckBoxG711AClick(Sender: TObject);
begin
  UpdateAudioCodecs();
end;

procedure TForm1.CheckBoxG711UClick(Sender: TObject);
begin
  UpdateAudioCodecs();
end;

procedure TForm1.CheckBoxG7221Click(Sender: TObject);
begin
  UpdateAudioCodecs();
end;

procedure TForm1.CheckBoxG722Click(Sender: TObject);
begin
  UpdateAudioCodecs();
end;

procedure TForm1.CheckBoxAMRClick(Sender: TObject);
begin
  UpdateAudioCodecs();
end;


procedure TForm1.CheckBoxG729Click(Sender: TObject);
begin
  UpdateAudioCodecs();
end;

procedure TForm1.CheckBoxGSMClick(Sender: TObject);
begin
  UpdateAudioCodecs();
end;

procedure TForm1.CheckBoxH2631998Click(Sender: TObject);
begin
  UpdateVideoCodecs();
end;

procedure TForm1.CheckBoxH263Click(Sender: TObject);
begin
  UpdateVideoCodecs();
end;

procedure TForm1.CheckBoxH264Click(Sender: TObject);
begin
  UpdateVideoCodecs();
end;

procedure TForm1.CheckBoxVP8Click(Sender: TObject);
begin
  UpdateVideoCodecs();
end;

procedure TForm1.CheckBoxILBCClick(Sender: TObject);
begin
  UpdateAudioCodecs();
end;




procedure TForm1.CheckBoxMuteMicrophoneClick(Sender: TObject);
begin
  if (Initialized = False) then
  begin
    Exit;
  end;

  if (CheckBoxMuteMicrophone.Checked = True) then
  begin
    PortSIP_muteMicrophone(PortSIPHandle, true);
  end
  else
  begin
    PortSIP_muteMicrophone(PortSIPHandle, false);
  end;
end;



procedure TForm1.CheckBoxSPEEXClick(Sender: TObject);
begin
  UpdateAudioCodecs();
end;

procedure TForm1.CheckBoxSPEEXWBClick(Sender: TObject);
begin
  UpdateAudioCodecs();
end;

procedure TForm1.CheckBoxVADClick(Sender: TObject);
begin
  if (Initialized = false) then
  begin
    Exit;
  end;

  if (CheckBoxVAD.Checked = True) then
  begin
    PortSIP_enableVAD(PortSIPHandle, true);
  end
  else
  begin
    PortSIP_enableVAD(PortSIPHandle, false);
  end;

end;



procedure TForm1.ComboBoxCameraChange(Sender: TObject);
begin
   if Initialized = True then
   begin
     PortSIP_setVideoDeviceId(PortSIPHandle, comboBoxCamera.ItemIndex);
   end;
end;

procedure TForm1.ComboBoxLinesChange(Sender: TObject);
var
  Text : string;
begin
  if (Initialized=False) then
  begin
    ComboBoxLines.ItemIndex := 0;
    Exit;
  end;

  if (CurrentLine =  (ComboBoxLines.ItemIndex+LINE_BASE)) then Exit;

   if CheckBoxConference.Checked = True then
    begin
      CurrentLine := ComboBoxLines.ItemIndex+LINE_BASE;
      Exit;
    end;

  if ((Sessions[CurrentLine].GetSessionState()=True) and (Sessions[CurrentLine].GetHoldState()=False)) then
  begin
    PortSIP_hold(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
    Sessions[CurrentLine].SetHoldState(True);

    Text := 'Line ';
    Text := Text + IntToStr(CurrentLine);
    Text := Text + ' : Hold';

    AddLog(Text);

  end;
  CurrentLine := ComboBoxLines.ItemIndex+LINE_BASE;
  if ((Sessions[CurrentLine].GetSessionState()=True) and (Sessions[CurrentLine].GetHoldState()=True)) then
  begin
    PortSIP_unHold(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
    Sessions[CurrentLine].SetHoldState(False);
    Text := 'Line ';
    Text := Text + IntToStr(CurrentLine);
    Text := Text + ' : unHold - Call established';
    AddLog(Text);
  end;

end;



procedure TForm1.ComboBoxMicrophoneChange(Sender: TObject);
begin
   if Initialized = True then
   begin
     PortSIP_setAudioDeviceId(PortSIPHandle, comboBoxMicrophone.ItemIndex, comboBoxSpeaker.ItemIndex);
   end;
end;



procedure TForm1.ComboBoxResolutionChange(Sender: TObject);
begin
    UpdateVideoResolution();
end;

procedure TForm1.ComboBoxSpeakerChange(Sender: TObject);
begin
   if Initialized = True then
   begin
     PortSIP_setAudioDeviceId(PortSIPHandle, comboBoxMicrophone.ItemIndex, comboBoxSpeaker.ItemIndex);
   end;
end;



end.
