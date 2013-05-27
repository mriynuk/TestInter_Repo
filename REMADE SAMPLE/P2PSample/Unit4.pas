unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, PortSIPConsts, PortSIPCore,  StdCtrls, ExtCtrls, ComCtrls,
   winsock, unit2, unit3, filectrl, shellapi, IniFiles, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, MMSystem, Vcl.Menus;

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

  TForm4 = class(TForm)
    ListBoxLog: TMemo;
    ComboBoxSpeaker: TComboBox;
    ComboBoxMicrophone: TComboBox;
    TrackBarSpeaker: TTrackBar;
    TrackBarMicrophone: TTrackBar;
    ClearBtn: TButton;
    CallBtn: TButton;
    AnswBtn: TButton;
    HungUpBtn: TButton;
    HoldBtn: TButton;
    UnHoldBtn: TButton;
    ListBox1: TListBox;
    Label6: TLabel;
    CallLabel: TLabel;
    DNDSpBtn: TSpeedButton;
    AASpBtn: TSpeedButton;
    ConSpBtn: TSpeedButton;
    SpLine1: TSpeedButton;
    SpLine2: TSpeedButton;
    SpLine3: TSpeedButton;
    SpLine4: TSpeedButton;
    SpLine5: TSpeedButton;
    SpLine6: TSpeedButton;
    SpLine7: TSpeedButton;
    SpLine8: TSpeedButton;
    ImageSpeaker: TImage;
    ImageMic: TImage;
    PopupMenuMic: TPopupMenu;
    PopupMenuSpeak: TPopupMenu;
    PlayFileEdit: TEdit;
    PlayFileBtn: TButton;
    RecConversationBtn: TButton;
    StopRecordBtn: TButton;
    RecBtn: TButton;
    StopSaveBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure CallBtnClick(Sender: TObject);
    procedure AnswBtnClick(Sender: TObject);
    procedure TrackBarSpeakerChange(Sender: TObject);
    procedure TrackBarMicrophoneChange(Sender: TObject);
    procedure HungUpBtnClick(Sender: TObject);
    procedure HoldBtnClick(Sender: TObject);
    procedure UnHoldBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBox1Click(Sender: TObject);
    procedure DNDSpBtnClick(Sender: TObject);
    procedure SpLine1Click(Sender: TObject);
    procedure SpLine2Click(Sender: TObject);
    procedure SpLine3Click(Sender: TObject);
    procedure SpLine4Click(Sender: TObject);
    procedure SpLine5Click(Sender: TObject);
    procedure SpLine6Click(Sender: TObject);
    procedure SpLine7Click(Sender: TObject);
    procedure SpLine8Click(Sender: TObject);
    procedure ConSpBtnClick(Sender: TObject);
    procedure ImageSpeakerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageMicMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ComboBoxSpeakerChange(Sender: TObject);
    procedure ComboBoxMicrophoneChange(Sender: TObject);
    procedure PopupMicItemClick(Sender: TObject) ;
    procedure PopupSpeakerItemClick(Sender: TObject) ;
    procedure PopUpMenusInitialization();
    procedure InitialiseSDK();
    procedure PlayFileBtnClick(Sender: TObject);
    procedure RecConversationBtnClick(Sender: TObject);
    procedure StopRecordBtnClick(Sender: TObject);
    procedure RecBtnClick(Sender: TObject);
    procedure StopSaveBtnClick(Sender: TObject);
    procedure saveBtnClick(Sender: TObject);

  private
  function GetLocalIP : string;
    { Private declarations }
  protected
   procedure onInviteIncoming(var Message: TMessage); message WM_INVITE_INCOMING;
   procedure onInviteTrying(var Message: TMessage); message WM_INVITE_TRYING;
   procedure onInviteRinging(var Message: TMessage); message WM_INVITE_RINGING;
   procedure onInviteAnswered(var Message: TMessage); message WM_INVITE_ANSWERED;
   procedure onInviteFailure(var Message: TMessage); message WM_INVITE_FAILURE;
   procedure onInviteClosed(var Message: TMessage); message WM_INVITE_CLOSED;
   procedure onInviteUpdated(var Message: TMessage); message WM_INVITE_UPDATED;
   procedure onRemoteHold(var Message: TMessage); message WM_REMOTE_HOLD;
   procedure onRemoteUnhold(var Message: TMessage); message WM_REMOTE_UNHOLD;
   procedure JoinConference(const index: Integer);
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Initialized, MicMute, SpeakerMute : Boolean;
  PortSIPHandle : THandle;
  EventHandle : THandle;
  CurrentLine : integer;
  CallString:string;
  Sessions : Array[0..8] of TSession;
  UserFile: TiniFile;
  MenuItemMic,MenuItemSpeaker:TMenuItem;
  procedure LoadDevice();
  proceDure InitSettings();
  procedure createCallbackHandler();
const
  LINE_BASE = 1;
  MAXLINE = 8;
implementation

var
  AudioVideoSettingsFile:TIniFile;
{$R *.dfm}



procedure TForm4.JoinConference(const index: Integer);
begin
  if (Initialized = False) then
  begin
    Exit;
  end;

  if ConSpBtn.Down = false then
  begin
    Exit;
  end;

  PortSIP_joinToConference(PortSIPHandle, Sessions[index].GetSessionID());
  Sessions[index].SetHoldState(false);
end;

procedure TForm4.ListBox1Click(Sender: TObject);
var
PartLine, FilePath:string;
j, index:integer;
begin
  FilePath := ExtractFilePath(Application.ExeName) + 'Users.ini';
  UserFile := TiniFile.Create(FilePath);
  index:=ListBox1.ItemIndex+1;

  PartLine := UserFile.ReadString('User' + IntToStr(index), 'UserName', '');
  CallString:='sip:';
  CallString:=CallString+PartLine+'@';

  PartLine := UserFile.ReadString('User' + IntToStr(index), 'UserIP', '');
  CallString:=CallString+PartLine+':';

  PartLine := UserFile.ReadString('User' + IntToStr(index), 'UserPort', '');
  CallString:=CallString+PartLine;
  CallLabel.Caption:=CallString;
end;

procedure TForm4.onInviteRinging(var Message: TMessage);
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
   ListBoxLog.Lines.Add(Format('Line %d : call is ringing...', [i]));
   callbackMessage.Free;
end;

procedure TForm4.onInviteAnswered(var Message: TMessage);
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
   Sessions[i].SetSessionState(true);
   ListBoxLog.Lines.Add(Format('Line %d : call is established.', [i]));
   JoinConference(i);
   callbackMessage.Free;
end;

procedure TForm4.onInviteFailure(var Message: TMessage);
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
  ListBoxLog.Lines.Add(Format('Line %d : call failed.', [i]));
  callbackMessage.Free;
end;

procedure TForm4.onInviteClosed(var Message: TMessage);
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
  ListBoxLog.Lines.Add(Format('Line %d : call is closed.', [i]));
  callbackMessage.Free;
end;

procedure TForm4.onInviteUpdated(var Message: TMessage);
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

  ListBoxLog.Lines.Add(Format('Line %d : call is updated.', [i]));
   callbackMessage.Free;
end;

function TForm4.GetLocalIP : string;
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

procedure TForm4.onInviteIncoming(var Message: TMessage);
var
  callbackMessage : TCallbackMessage;
  i : integer;
  j : integer;
  state : boolean;
  DND : boolean;
  needIgnoreAutoAnswer: boolean;
  Path23 : string;
  s1 : boolean;
  s2 : boolean;
begin
  callbackMessage := TCallbackMessage(Message.WParam);
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
  if DNDSpBtn.Down = True then
  begin
    PortSIP_rejectCall(PortSIPHandle, callbackMessage.sessionId, 486, 'Busy here');
    Sessions[i].Reset;
    ListboxLog.Lines.Add(Format('Rejected the call by DND on line : %d', [i]));
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

  if (needIgnoreAutoAnswer=false) and (AASpBtn.Down=true) then
  begin
    for i := 1 to 8 do
      begin
      Sessions[i].SetRecvCallState(false);
      Sessions[i].SetSessionState(true);
//    PortSIP_setRemoteVideoWindow(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), remoteVideo.Handle);
      PortSIP_answerCall(PortSIPHandle, Sessions[i].GetSessionID);
      if Sessions[i].GetSessionState() = True then
      ListboxLog.Lines.Add(Format('Answered the call automatically on line %d ', [i]));
    end;
    Exit;

  end;

  ListboxLog.Lines.Add(Format('Line %d : call incoming from %s <%s>', [i, callbackMessage.callerDispalyName, callbackMessage.caller]));

  //  You should write your own code to play the wav file here for alert the incoming call(incoming tone);
   Path23 :=ExtractFilePath(Application.ExeName)+'OldPhone.wav';
   SndPlaySound(PChar(Path23), SND_ASYNC or SND_LOOP);
  callbackMessage.Free;
end;

procedure TForm4.onInviteTrying(var Message: TMessage);
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

  ListboxLog.Lines.Add(Format('Line %d : call is trying...', [i]));


  callbackMessage.Free;
end;

procedure TForm4.onRemoteHold(var Message: TMessage);
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

  ListBoxLog.Lines.Add(Format('Line %d : place the call on hold by remote party.', [i]));


   callbackMessage.Free;
end;

procedure TForm4.onRemoteUnhold(var Message: TMessage);
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

  ListBoxLog.Lines.Add(Format('Line %d : take off hold by remote party.', [i]));
   callbackMessage.Free;
end;


procedure TForm4.SpLine1Click(Sender: TObject);
var
  Text : string;
begin
  if (Initialized=False) then
  begin
    Exit;
  end;
   if (CurrentLine = 1) then Exit else
  CurrentLine:=1;

   if ConSpBtn.Down = True then
    begin
      CurrentLine := 1;
      Exit;
    end;


  if ((Sessions[CurrentLine].GetSessionState()=True) and (Sessions[CurrentLine].GetHoldState()=False)) then
  begin
    PortSIP_hold(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
    Sessions[CurrentLine].SetHoldState(True);
    Text := 'Line ';
    Text := Text + IntToStr(CurrentLine);
    Text := Text + ' : Hold';
    ListBoxLog.Lines.Add(Text);
  end;
end;

procedure TForm4.SpLine2Click(Sender: TObject);
var
  Text : string;
begin
 if (Initialized=False) then
  begin
    Exit;
  end;
   if (CurrentLine = 2) then Exit else
  CurrentLine:=2;

   if ConSpBtn.Down = True then
    begin
      CurrentLine := 2;
      Exit;
    end;
  if ((Sessions[CurrentLine].GetSessionState()=True) and (Sessions[CurrentLine].GetHoldState()=False)) then
  begin
    PortSIP_hold(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
    Sessions[CurrentLine].SetHoldState(True);
    Text := 'Line ';
    Text := Text + IntToStr(CurrentLine);
    Text := Text + ' : Hold';
    ListBoxLog.Lines.Add(Text);
  end;
end;

procedure TForm4.SpLine3Click(Sender: TObject);
var
  Text : string;
begin
 if (Initialized=False) then
  begin
    Exit;
  end;

   if (CurrentLine = 3) then Exit else
  CurrentLine:=3;

   if ConSpBtn.Down = True then
    begin
      CurrentLine := 3;
      Exit;
    end;


  if ((Sessions[CurrentLine].GetSessionState()=True) and (Sessions[CurrentLine].GetHoldState()=False)) then
  begin
    PortSIP_hold(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
    Sessions[CurrentLine].SetHoldState(True);
    Text := 'Line ';
    Text := Text + IntToStr(CurrentLine);
    Text := Text + ' : Hold';
    ListBoxLog.Lines.Add(Text);
  end;
end;

procedure TForm4.SpLine4Click(Sender: TObject);
var
  Text : string;
begin
  if (Initialized=False) then
  begin
    Exit;
  end;

   if (CurrentLine = 4) then Exit else
  CurrentLine:=4;

   if ConSpBtn.Down = True then
    begin
      CurrentLine := 4;
      Exit;
    end;


  if ((Sessions[CurrentLine].GetSessionState()=True) and (Sessions[CurrentLine].GetHoldState()=False)) then
  begin
    PortSIP_hold(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
    Sessions[CurrentLine].SetHoldState(True);
    Text := 'Line ';
    Text := Text + IntToStr(CurrentLine);
    Text := Text + ' : Hold';
    ListBoxLog.Lines.Add(Text);
  end;
end;

procedure TForm4.SpLine5Click(Sender: TObject);
var
  Text : string;
begin
 if (Initialized=False) then
  begin
    Exit;
  end;

   if (CurrentLine = 5) then Exit else
  CurrentLine:=5;

   if ConSpBtn.Down = True then
    begin
      CurrentLine := 5;
      Exit;
    end;


  if ((Sessions[CurrentLine].GetSessionState()=True) and (Sessions[CurrentLine].GetHoldState()=False)) then
  begin
    PortSIP_hold(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
    Sessions[CurrentLine].SetHoldState(True);
    Text := 'Line ';
    Text := Text + IntToStr(CurrentLine);
    Text := Text + ' : Hold';
    ListBoxLog.Lines.Add(Text);
  end;
end;

procedure TForm4.SpLine6Click(Sender: TObject);
var
  Text : string;
begin
 if (Initialized=False) then
  begin
    Exit;
  end;

   if (CurrentLine = 6) then Exit else
  CurrentLine:=6;

   if ConSpBtn.Down = True then
    begin
      CurrentLine := 6;
      Exit;
    end;


  if ((Sessions[CurrentLine].GetSessionState()=True) and (Sessions[CurrentLine].GetHoldState()=False)) then
  begin
    PortSIP_hold(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
    Sessions[CurrentLine].SetHoldState(True);
    Text := 'Line ';
    Text := Text + IntToStr(CurrentLine);
    Text := Text + ' : Hold';
    ListBoxLog.Lines.Add(Text);
  end;
end;

procedure TForm4.SpLine7Click(Sender: TObject);
var
  Text : string;
begin
 if (Initialized=False) then
  begin
    Exit;
  end;

   if (CurrentLine = 7) then Exit else
  CurrentLine:=7;

   if ConSpBtn.Down = True then
    begin
      CurrentLine := 7;
      Exit;
    end;


  if ((Sessions[CurrentLine].GetSessionState()=True) and (Sessions[CurrentLine].GetHoldState()=False)) then
  begin
    PortSIP_hold(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
    Sessions[CurrentLine].SetHoldState(True);
    Text := 'Line ';
    Text := Text + IntToStr(CurrentLine);
    Text := Text + ' : Hold';
    ListBoxLog.Lines.Add(Text);
  end;
end;

procedure TForm4.SpLine8Click(Sender: TObject);
var
  Text : string;
begin
 if (Initialized=False) then
  begin
    Exit;
  end;

   if (CurrentLine = 8) then Exit else
  CurrentLine:=8;

   if ConSpBtn.Down = True then
    begin
      CurrentLine := 8;
      Exit;
    end;


  if ((Sessions[CurrentLine].GetSessionState()=True) and (Sessions[CurrentLine].GetHoldState()=False)) then
  begin
    PortSIP_hold(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
    Sessions[CurrentLine].SetHoldState(True);
    Text := 'Line ';
    Text := Text + IntToStr(CurrentLine);
    Text := Text + ' : Hold';
    ListBoxLog.Lines.Add(Text);
  end;
end;

procedure TForm4.StopSaveBtnClick(Sender: TObject);
var
  FilePath:string;
begin
  mciSendString('STOP mysound', nil, 0, Handle);
  FilePath:=ExtractFilePath(Application.ExeName)+'message.wav';
  mciSendString(PChar('SAVE mysound "' + FilePath+'"' ), nil, 0, Handle);
  mciSendString('CLOSE mysound', nil, 0, Handle)

end;

procedure TForm4.StopRecordBtnClick(Sender: TObject);
begin
if (Initialized = False)  then
  begin
    ShowMessage('Please initialize the SDK first.');
    Exit;
  end;

  PortSIP_stopAudioRecording(PortSIPHandle);
end;

procedure TForm4.DNDSpBtnClick(Sender: TObject);
begin
//if SpeedButton1.Down=False then
//begin
//   SpeedButton1.Down:=True;
//   SpeedButton1.GroupIndex:=1
//end
//   else
//   begin
//  SpeedButton1.Down:=True;
//  SpeedButton1.GroupIndex:=0;
//  end;
//
//
////SpeedButton1.GroupIndex:=1;

//  DNDSpBtn.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName) + 'red50.bmp');
end;

procedure UpdateAudioCodecs();
begin
  if (Initialized = False) then
  begin
    Exit;
  end;
  AudioVideoSettingsFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Audio_Video_settings.ini');
  PortSIP_clearAudioCodec(PortSIPHandle);
   if (AudioVideoSettingsFile.ReadBool('Audio','G711ULaw',True) = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_PCMU);
  end;

   if (AudioVideoSettingsFile.ReadBool('Audio','G711ALaw',True) = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_PCMA);
  end;

  if (AudioVideoSettingsFile.ReadBool('Audio','G729',True) = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_G729);
  end;

  if (AudioVideoSettingsFile.ReadBool('Audio','AMR',False) = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_AMR);
  end;

  if (AudioVideoSettingsFile.ReadBool('Audio','iLBC',False) = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_ILBC);
  end;

  if (AudioVideoSettingsFile.ReadBool('Audio','GSM610',False) = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_GSM);
  end;

  if (AudioVideoSettingsFile.ReadBool('Audio','G7221',False) = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_G7221);
  end;

  if (AudioVideoSettingsFile.ReadBool('Audio','G722',False) = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_G722);
  end;

  if (AudioVideoSettingsFile.ReadBool('Audio','SPEEX',False) = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_SPEEX);
  end;

  if (AudioVideoSettingsFile.ReadBool('Audio','SPEEX-WB',False) = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_SPEEXWB);
  end;

  if (AudioVideoSettingsFile.ReadBool('Audio','AMR-WB',False) = True) then
  begin
    PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_AMRWB);
  end;
  PortSIP_addAudioCodec(PortSIPHandle, AUDIOCODEC_DTMF);


end;

procedure InitDefaultAudioCodecs();
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

procedure TForm4.UnHoldBtnClick(Sender: TObject);
var
  text:string;
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
    ListBoxLog.Lines.Add(Text);
end;


procedure TForm4.HoldBtnClick(Sender: TObject);
var
  Text,Path : string;
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
    ListBoxLog.Lines.Add(Text);
end;

procedure TForm4.HungUpBtnClick(Sender: TObject);
var
  Text : String;
  Logs : string;
begin
     if (Initialized = False) then
    begin
      Exit;
    end;
    SndPlaySound(nil,0);
    Text := 'Busy Here';
    if (Sessions[CurrentLine].GetRecvCallState() = True) then
    begin
      PortSIP_rejectCall(PortSIPHandle, Sessions[CurrentLine].GetSessionID(), 486, pansichar(ansistring(Text)));
      Sessions[CurrentLine].Reset();
      Logs := 'Line ';
      Logs := Logs + IntToStr(Currentline);
      Logs := Logs + ' : Reject the call';
      ListBoxLog.Lines.Add(Logs);
      Exit;
    end;
    if (Sessions[CurrentLine].GetSessionState() = True) then
    begin
      PortSIP_terminateCall(PortSIPHandle, Sessions[CurrentLine].GetSessionID());
      Sessions[CurrentLine].Reset();
      Logs := 'Line ';
      Logs := Logs + IntToStr(Currentline);
      Logs := Logs + ' : Hang up the call';
      ListBoxLog.Lines.Add(Logs);
      Exit;
    end;
end;

procedure TForm4.RecBtnClick(Sender: TObject);
begin
 mciSendString('OPEN NEW TYPE WAVEAUDIO ALIAS mysound', nil, 0, Handle);
  mciSendString('SET mysound TIME FORMAT MS ' +     // set time
    'BITSPERSAMPLE 16 ' +                // 16 Bit
    'CHANNELS 1 ' +                     // MONO
    'SAMPLESPERSEC 8192 ' +             // 8 KHz
    'BYTESPERSEC 8192',                // 8000 Bytes/s
    nil, 0, Handle);
  mciSendString('RECORD mysound', nil, 0, Handle);

end;

procedure TForm4.RecConversationBtnClick(Sender: TObject);
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

  FilePath := ExtractFilePath(Application.ExeName)+'\Recordings\';
  FileName := 'RecordedConversation';

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

procedure TForm4.CallBtnClick(Sender: TObject);
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
  if ((Sessions[Currentline].GetSessionState() = True) Or (Sessions[Currentline].GetRecvCallState() = True)) then
  begin
     ShowMessage('Current line is busy, please switch a line');
    Exit;
  end;
    UpdateAudioCodecs();
  if (PortSIP_isAudioCodecEmpty(PortSIPHandle) = true) then
  begin
    InitDefaultAudioCodecs();
  end;

  CallTo := CallString;
  PortSIP_setAudioDeviceId(PortSIPHandle, comboBoxMicrophone.ItemIndex, comboBoxSpeaker.ItemIndex);
  HasSDP := false;
  SessionID := PortSIP_call(PortSIPHandle, pansichar(ansistring(CallTo)), HasSDP, ErrorCode);
  if (SessionID = INVALID_SESSION_ID ) then
  begin
    ListBoxLog.Lines.Add('Call Failed');
    Exit;
  end;

//  PortSIP_setRemoteVideoWindow(PortSIPHandle, SessionID, remoteVideo.Handle);

  Sessions[CurrentLine].SetSessionID(SessionID);
  Sessions[CurrentLine].SetSessionState(True);

  Text := 'Line ';
  Text := Text + IntToStr(Currentline);
  Text := Text + ' : calling...';
  ListBoxLog.Lines.Add(Text);
  ListBoxLog.Lines.Add(CallTo);
end;


procedure TForm4.ClearBtnClick(Sender: TObject);
begin
    ListBoxLog.Clear;
end;

procedure TForm4.ComboBoxMicrophoneChange(Sender: TObject);
begin
if Initialized = True then
   begin
     PortSIP_setAudioDeviceId(PortSIPHandle, comboBoxMicrophone.ItemIndex, comboBoxSpeaker.ItemIndex);
   end;
end;

procedure TForm4.ComboBoxSpeakerChange(Sender: TObject);
begin
if Initialized = True then
   begin
     PortSIP_setAudioDeviceId(PortSIPHandle, comboBoxMicrophone.ItemIndex, comboBoxSpeaker.ItemIndex);
   end;
end;

procedure TForm4.ConSpBtnClick(Sender: TObject);
var
  i : Integer;
  Text : string;
begin

  if (Initialized = False) then
    begin
      ConSpBtn.Down := False;
      Exit;
    end;

    if ConSpBtn.Down = True then
    begin
//      if (PortSIP_createConference(PortSIPHandle, RemoteVideo.Handle, resolution, false) = 0)  then
//        begin
          ListBoxLog.Lines.Add('Make conference succeeded');
          for i := LINE_BASE to MAXLINE do
          begin
            if Sessions[i].GetSessionState() = True  then
            begin
              JoinConference(i);
            end;
          end;
//        end
//      else
//        begin
//          ListBoxLog.Lines.Add('Make conference failed.');
//          ConSpBtn.Down:= False;
//        end;

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
      ListBoxLog.Lines.Add('Taken off Conference');
    end;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
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
  UserFile.Free;
  AudioVideoSettingsFile.Free;

  PortSIP_muteSpeaker(PortSIPHandle, false);
  PortSIP_muteMicrophone(PortSIPHandle, false);
end;

procedure TForm4.FormCreate(Sender: TObject);

const SIPPORT_MIN : integer = 8000;
 var
    Text : string;
    i,j,k : integer;
    FilePath, FileLine, PartLine: string;
    LocalIP : String;
    UserName : String;
    Password : String;
    SIPServer : String;
    Agent : String;
    STUNServer : String;
    OutboundServer : String;
    UserDomain : String;
    DisplayName : String;
    AuthName : String;
    SmallStr: string;
    LocalSIPPort : integer;

    SIPServerPort : integer;
    OutboundServerPort : integer;
    STUNServerPort : integer;

    LicenseKey : String;
    transport : integer;
    SRTPPolicy : integer;
    ErrorCode : integer;
begin
    Randomize;
    ComboBoxSpeaker.ItemIndex := 0;
    ComboBoxMicrophone.ItemIndex := 0;
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
  PortSIPHandle := 0;
  EventHandle := 0;
  InitialiseSDK();
  MicMute:=False;
  PortSIP_muteMicrophone(PortSIPHandle, false);
  SpeakerMute := False;
  PortSIP_muteSpeaker(PortSIPHandle, false);
  ComboBoxSpeaker.Width:=-1;
  ComboBoxMicrophone.Width:=-1;
  PopUpMenusInitialization()
end;
procedure TForm4.InitialiseSDK();
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
    j:integer;
    SIPServerPort : integer;
    OutboundServerPort : integer;
    STUNServerPort : integer;
    FilePath,PartLine: string;
    LicenseKey : String;
    transport : integer;
    SRTPPolicy : integer;
    ErrorCode : integer;
begin
  FilePath := ExtractFilePath(Application.ExeName) + 'Users.ini';
  UserFile := TiniFile.Create(FilePath);
  j := 1;
  Repeat
    PartLine := UserFile.ReadString('User' + IntToStr(j), 'UserName', '');
    ListBox1.Items.Add(PartLine);
    Inc(j);
  Until PartLine = '';
    ListBox1.Items[j-2]:='========';
   if (Initialized = True) then
  begin
    ShowMessage('alreay logged in');
    Exit;
  end;
  LocalIP := GetLocalIP();
  LocalSIPPort := 6012;
  UserName := 'Michael';
  Password := 'aaa';
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
  Form4.Caption:='Your User Name: '+UserName+' || '+' Your IP: '+LocalIP+':'+IntToStr(LocalSIPPort);
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
  ListBoxLog.Lines.Add('Initialized the SDK.');

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

  ListBoxLog.Lines.Add('Set user information succeeded.');
  LoadDevice();
	InitDefaultAudioCodecs();
	initSettings();
  ListBoxLog.Lines.Add('Ready.');
  SpLine1.Down:=True;
end;
function PlayWaveFileToRemoteFinished(obj:Pointer; sessionID:integer; filePathName:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.filePathName := string(filePathName);
  PostMessage(Form4.Handle, WM_PLAYWAVEFILE_FINISHED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

procedure TForm4.PlayFileBtnClick(Sender: TObject);
var
  PlayFile : String;
begin
  if (Initialized = False)  then
  begin
    ShowMessage('Please initialize the SDK first.');
    Exit;
  end;
  if (length(PlayFileEdit.Text) = 0) then
  begin
    ShowMessage('The play file is empty.');
    Exit;
  end;
  PlayFile := PlayFileEdit.Text;
  PortSIP_setPlayWaveFileToRemote(PortSIPHandle,
                                  Sessions[CurrentLine].GetSessionID(),
                                  pansichar(ansistring(PlayFile)),
                                  true,
                                  0,
                                  8000,
                                  0,
                                  PlayWaveFileToRemoteFinished);
end;

procedure TForm4.PopUpMenusInitialization();
var
  CounterForLoop:integer;
begin
 for counterForLoop := 0 to ComboBoxMicrophone.Items.Count - 1 do
 begin
   MenuItemMic := TmenuItem.Create(PopupMenuMic);
   MenuItemMic.Caption := ComboBoxMicrophone.Items[counterForLoop];
   MenuItemMic.Tag := counterForLoop;
   MenuItemMic.OnClick := PopupMicItemClick;
   PopupMenuMic.Items.Add(MenuItemMic);
 end;
 for CounterForLoop := 0 to ComboBoxSpeaker.Items.Count - 1 do
 begin
   MenuItemSpeaker := TmenuItem.Create(PopupMenuSpeak);
   MenuItemSpeaker.Caption := ComboBoxSpeaker.Items[counterForLoop];
   MenuItemSpeaker.Tag := counterForLoop;
   MenuItemSpeaker.OnClick := PopupSpeakerItemClick;
   PopupMenuSpeak.Items.Add(MenuItemSpeaker);
 end;
end;
procedure TForm4.PopupSpeakerItemClick(Sender: TObject) ;
var
  menuItem : TMenuItem;
begin
  menuItem := TMenuItem(sender) ;
  ComboBoxSpeaker.ItemIndex := menuItem.Tag;
end;
procedure TForm4.PopupMicItemClick(Sender: TObject);
var
  menuItem : TMenuItem;
begin
  menuItem := TMenuItem(sender) ;
  ComboBoxMicrophone.ItemIndex:=menuItem.Tag;
end;
procedure TForm4.TrackBarMicrophoneChange(Sender: TObject);
begin
 if (Initialized = False) then
 begin
   Exit;
 end;
 PortSIP_setMicVolume(PortSIPHandle, TrackBarMicrophone.Position);
end;

procedure TForm4.TrackBarSpeakerChange(Sender: TObject);
begin
  if (Initialized = False) then
  begin
    Exit;
  end;
  PortSIP_setSpeakerVolume(PortSIPHandle, TrackBarSpeaker.Position);
end;

function registerSuccess(callbackObject: Pointer; statusCode:integer; statusText:PAnsiChar): integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.statusCode := statusCode;
  callbackMessage.statusText := string(statusText);
  PostMessage(Form4.Handle, WM_REGISTER_SUCCESS, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

procedure InitSettings();
var
   SRTPPolicy: integer;
begin
  if (Initialized = False) then
  begin
    Exit;
  end;
  AudioVideoSettingsFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Audio_Video_settings.ini');
  SRTPPolicy := SRTP_POLICY_NONE;
  PortSIP_setSrtpPolicy(PortSIPHandle, SRTPPolicy);
  PortSIP_enableAEC(PortSIPHandle, AudioVideoSettingsFile.ReadBool('Video','AEC',True));
  PortSIP_enableCNG(PortSIPHandle, AudioVideoSettingsFile.ReadBool('Video','CNG',False));
  PortSIP_enableVAD(PortSIPHandle, AudioVideoSettingsFile.ReadBool('Video','VAD',False));
  PortSIP_enableAGC(PortSIPHandle, AudioVideoSettingsFile.ReadBool('Video','AGC',True));
end;

procedure LoadDevice;
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
      Form4.ComboBoxSpeaker.Items.Add(deviceName);
    end;
  end;
   Form4.ComboBoxSpeaker.ItemIndex := 0;
   nums := PortSIP_getNumOfRecordingDevices(PortSIPHandle);
  for i := 0 to nums-1 do
  begin
    if PortSIP_getRecordingDeviceName(PortSIPHandle, i, @deviceName, 255) = 0 then
    begin
      Form4.ComboBoxMicrophone.Items.Add(deviceName);
    end;
  end;
  Form4.ComboBoxMicrophone.ItemIndex := 0;
  volume := PortSIP_getSpeakerVolume(PortSIPHandle);
  Form4.TrackBarSpeaker.Position := volume;
  volume := PortSIP_getMicVolume(PortSIPHandle);
  Form4.TrackBarMicrophone.Position := volume;
end;

function RegisterFailure(callbackObject: Pointer; statusCode:integer; statusText:PAnsiChar): integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.statusCode := statusCode;
  callbackMessage.statusText := string(statusText);
  PostMessage(Form4.Handle, WM_REGISTER_FAILURE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_INVITE_INCOMING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_INVITE_TRYING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_INVITE_RINGING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_INVITE_ANSWERED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_INVITE_FAILURE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function InviteClosed(callbackObject: Pointer; sessionId:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  PostMessage(Form4.Handle, WM_INVITE_CLOSED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_INVITE_UPDATED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_INVITE_UASCONNECTED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_INVITE_UACCONNECTED, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function InviteBeginingForward(callbackObject: Pointer; forwardingTo:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.forwardingTo :=  string(forwardingTo);
  PostMessage(Form4.Handle, WM_BEGINING_FORWARD, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function RemoteHold(callbackObject: Pointer; sessionId:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;
  PostMessage(Form4.Handle, WM_REMOTE_HOLD, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function RemoteUnHold(callbackObject: Pointer; sessionId:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;
  PostMessage(Form4.Handle, WM_REMOTE_UNHOLD, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function TransferTrying(callbackObject: Pointer; sessionId:integer; referTo:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;
  callbackMessage.referTo :=  string(referTo);
  PostMessage(Form4.Handle, WM_TRANSFER_TRYING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function TransferRinging(callbackObject: Pointer; sessionId:integer; hasVideo:boolean):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;
  callbackMessage.hasVideo := hasVideo;
  PostMessage(Form4.Handle, WM_TRANSFER_RINGING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function PASVTransferSuccess(callbackObject: Pointer; sessionId:integer; hasVideo:boolean):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;
  callbackMessage.hasVideo := hasVideo;
  PostMessage(Form4.Handle, WM_PASVTRANSFER_SUCCESS, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_PASVTRANSFER_FAILURE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function ACTVTransferSuccess(callbackObject: Pointer; sessionId:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId :=  sessionId;
  PostMessage(Form4.Handle, WM_ACTVTRANSFER_SUCCESS, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_ACTVTRANSFER_FAILURE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_RECV_MESSAGE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_SEND_PAGERMESSAGE_SUCCESS, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function SendPagerMessageFailure(callbackObject: Pointer; caller, callerDisplayName, callee, calleeDisplayName:PAnsiChar; statusCode:integer; statusText:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage:= TCallbackMessage.Create;
  callbackMessage.caller := caller;
  callbackMessage.callerDispalyName := string(callerDisplayName);
  callbackMessage.callee := string(callee);
  callbackMessage.calleeDisplayName := string(calleeDisplayName);
  callbackMessage.statusCode := statusCode;
  callbackMessage.statusText := statusText;
  PostMessage(Form4.Handle, WM_SEND_PAGERMESSAGE_FAILURE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function ArrivedSignaling(callbackObject: Pointer; sessionId:integer; signaling:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.sipMessage := signaling;
  PostMessage(Form4.Handle, WM_ARRIVED_SIGNALING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function SentSignaling(callbackObject: Pointer; signaling:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sipMessage := signaling;
  PostMessage(Form4.Handle, WM_SENT_SIGNALING, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function WaitingVoiceMessage(callbackObject: Pointer; messageAccount:PAnsiChar; urgentNewMessageCount, urgentOldMessageCount, newMessageCount, oldMessageCount: integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.messageAccount := string(messageAccount);
  PostMessage(Form4.Handle, WM_WAITING_VOICEMESSAGE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function WaitingFaxMessage(callbackObject: Pointer; messageAccount:PAnsiChar; urgentNewMessageCount, urgentOldMessageCount, newMessageCount, oldMessageCount:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.messageAccount := string(messageAccount);
  PostMessage(Form4.Handle, WM_WAITING_FAXMESSAGE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use intege
  result := 0;
end;

function RecvDtmfTone(callbackObject: Pointer; sessionId:integer; tone:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sessionId := sessionId;
  callbackMessage.dtmfTone := tone;
  PostMessage(Form4.Handle, WM_RECV_DTMFTONE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_PRESENCE_RECVSUBSCRIBE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
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
  PostMessage(Form4.Handle, WM_PRESENCE_ONLINE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function PresenceOffline(callbackObject: Pointer; from, fromDisplayName:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.from := string(from);
  callbackMessage.fromDisplayName := string(fromDisplayName);
  PostMessage(Form4.Handle, WM_PRESENCE_OFFLINE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function RecvOptions(callbackObject: Pointer; optionsMessage:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sipMessage := string(optionsMessage);
  PostMessage(Form4.Handle, WM_RECV_OPTION, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function RecvInfo(callbackObject: Pointer; sessionId:integer; infoMessage:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sipMessage := string(infoMessage);
  callbackMessage.sessionId := sessionId;
  PostMessage(Form4.Handle, WM_RECV_INFO, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function RecvMessage(callbackObject: Pointer; sessionId:integer; message:PAnsiChar):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sipMessage := string(message);
  callbackMessage.sessionId := sessionId;
  PostMessage(Form4.Handle, WM_RECV_MESSAGE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function RecvBinaryMessage(callbackObject: Pointer; sessionId:integer; message:PAnsiChar; data:Pointer; dataLength:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.sipMessage := string(message);
  callbackMessage.sessionId := sessionId;
  PostMessage(Form4.Handle, WM_RECV_BINARYMESSAGE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

function RecvBinaryPagerMessage(callbackObject: Pointer; from:PAnsiChar; fromDisplayName:PAnsiChar; data:Pointer; dataLength:integer):integer; stdcall;
var
  callbackMessage: TCallbackMessage;
begin
  callbackMessage := TCallbackMessage.Create;
  callbackMessage.fromDisplayName := string(fromDisplayName);
  callbackMessage.from := string(from);
  PostMessage(Form4.Handle, WM_RECV_BINARYPAGERMESSAGE, NativeUInt(callbackMessage), 0);  // NativeUInt is for the new x64-compilers. All compilers before use integer
  result := 0;
end;

procedure createCallbackHandler();
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


procedure TForm4.AnswBtnClick(Sender: TObject);
var
  Text : string;
begin
 if (Initialized = False) then
 begin
   Exit;
 end;
 SndPlaySound(nil,0);
 if (Sessions[CurrentLine].GetRecvCallState() = False) then
 begin
   ShowMessage('Current line have not the incoming call, please switch a line.');
   Exit;
 end;
 Sessions[CurrentLine].SetRecvCallState(False);
 Sessions[CurrentLine].SetSessionState(True);
 if (PortSIP_answerCall(PortSIPHandle, Sessions[CurrentLine].GetSessionID()) = 0) then
   begin
   Text := 'Line ';
   Text := Text + IntToStr(Currentline);
   Text := Text + ' : Call established';
   ListBoxLog.Lines.Add(Text);
   end
   else
   begin
   Sessions[CurrentLine].Reset();
   Text := 'Line ';
   Text := Text + IntToStr(Currentline);
   Text := Text + ' : Answer call failed!';
   ListBoxLog.Lines.Add(Text);
   end;
end;

procedure TForm4.ImageMicMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
  begin
    if (Initialized = False) then
    begin
      Exit;
    end;
    if MicMute = False then
    begin
      PortSIP_muteMicrophone(PortSIPHandle, true);
      ImageMic.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'microphone2mute.jpg');
      MicMute:=True;
    end
    else
    begin
      PortSIP_muteMicrophone(PortSIPHandle, false);
      ImageMic.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'microphone2.png');
      MicMute:=False;
    end;
  end else
  begin
  ImageMic.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end;
end;

procedure TForm4.ImageSpeakerMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Initialized = False) then
  begin
    Exit;
  end;
  if Button=mbLeft then
  begin
    if SpeakerMute = False then
    begin
      PortSIP_muteSpeaker(PortSIPHandle, true);
      ImageSpeaker.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'speakermute.jpg');
      SpeakerMute:=True;
    end
    else
    begin
      PortSIP_muteSpeaker(PortSIPHandle, false);
      ImageSpeaker.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'speaker.png');
      SpeakerMute:=False;
    end
  end else begin
    ImageSpeaker.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end;
end;

end.
