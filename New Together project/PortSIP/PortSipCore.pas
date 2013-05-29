
unit PortSipCore;
interface

uses
  Windows, SysUtils;

const
  PortSIPDLL='PortSIPCore.dll';
  SIPEventEXDLL='SIPEventEx.dll';

// Callbacks
Type
  TregisterSuccess=function (callbackObject: Pointer; statusCode:integer; statusText:PAnsiChar): integer; stdcall;
  TregisterFailure=function (callbackObject: Pointer; statusCode:integer; statusText:PAnsiChar): integer; stdcall;
  TInviteIncoming=function (callbackObject: Pointer;
                                sessionId:integer;
                                caller:PAnsiChar;
                                callerDisplayName:PAnsiChar;
                                callee:PAnsiChar;
                                calleeDisplayName:PAnsiChar;
                                audioCodecName:PAnsiChar;
                                videoCodecName:PAnsiChar;
                                hasVideo:boolean
                                ):integer; stdcall;
TInviteTrying=function (callbackObject: Pointer; sessionId:integer; Caller, callee:PAnsiChar): integer; stdcall;
TInviteRinging=function (callbackObject: Pointer;
                               sessionId:integer;
                               hasEarlyMedia:boolean;
                               hasVideo: boolean;
                               audioCodecName: PAnsiChar;
                               videoCodecName: PAnsiChar
                               ):integer; stdcall;
TInviteAnswered=function (callbackObject: Pointer;
                                sessionId:integer;
                                hasVideo:boolean;
                                statusCode: integer;
                                statusText:PANsiChar;
                                audioCodecName:PAnsiChar;
                                videoCodecName:PAnsiChar
                                ):integer; stdcall;
TInviteFailure=function (callbackObject: Pointer;
                               sessionId:integer;
                               statusCode:integer;
                               statusText:PAnsiChar):integer; stdcall;
TInviteClosed=function (callbackObject: Pointer; sessionId:integer):integer; stdcall;
TInviteUpdated=function (callbackObject: Pointer;
                               sessionId:integer;
                               hasVideo:boolean;
                               audioCodecName:PAnsiChar;
                               videoCodecName:PAnsiChar
                               ):integer; stdcall;
TInviteUASConnected=function(callbackObject: Pointer;
                                    sessionId:integer;
                                    statusCode:integer;
                                    statusText:PAnsiChar):integer; stdcall;
TInviteUACConnected=function(callbackObject: Pointer;
                                    sessionId:integer;
                                    statusCode:integer;
                                    statusText:PAnsiChar):integer; stdcall;
TInviteBeginingForward=function(callbackObject: Pointer; forwardingTo:PAnsiChar):integer; stdcall;
TRemoteHold=function(callbackObject: Pointer; sessionId:integer):integer; stdcall;
TRemoteUnHold=function(callbackObject: Pointer; sessionId:integer):integer; stdcall;
TTransferTrying=function(callbackObject: Pointer; sessionId:integer; referTo:PAnsiChar):integer; stdcall;
TTransferRinging=function(callbackObject: Pointer; sessionId:integer; hasVideo:boolean):integer; stdcall;
TPASVTransferSuccess=function(callbackObject: Pointer; sessionId:integer; hasVideo:boolean):integer; stdcall;
TPASVTransferFailure=function(callbackObject: Pointer; sessionId:integer; statusCode:integer; statusText:PAnsiChar):integer; stdcall;
TACTVTransferSuccess=function(callbackObject: Pointer; sessionId:integer):integer; stdcall;
TACTVTransferFailure=function(callbackObject: Pointer; sessionId:integer; statusCode:integer; statusText:PAnsiChar):integer; stdcall;
TRecvPagerMessage=function(callbackObject: Pointer; from, fromDisplayName, message:PAnsiChar):integer; stdcall;
TSendPagerMessageSuccess=function(callbackObject: Pointer; caller, callerDisplayName, callee, calleeDisplayName:PAnsiChar):integer; stdcall;
TSendPagerMessageFailure=function(callbackObject: Pointer; caller, callerDisplayName, callee, calleeDisplayName:PAnsiChar; statusCode:integer; statusText:PAnsiChar):integer; stdcall;
TArrivedSignaling=function(callbackObject: Pointer; sessionId:integer; signaling:PAnsiChar):integer; stdcall;
TSentSignaling=function(callbackObject: Pointer; signaling:PAnsiChar):integer; stdcall;
TWaitingVoiceMessage=function(callbackObject: Pointer; messageAccount:PAnsiChar; urgentNewMessageCount, urgentOldMessageCount, newMessageCount, oldMessageCount: integer):integer; stdcall;
TWaitingFaxMessage=function(callbackObject: Pointer; messageAccount:PAnsiChar; urgentNewMessageCount, urgentOldMessageCount, newMessageCount, oldMessageCount:integer):integer; stdcall;
TRecvDtmfTone=function(callbackObject: Pointer; sessionId:integer; tone:integer):integer; stdcall;
TPresenceRecvSubscribe=function(callbackObject: Pointer; subscribeId:integer; from, fromDisplayName, subject:PAnsiChar):integer; stdcall;
TPresenceOnline=function(callbackObject: Pointer; from, fromDisplayName, stateText:PAnsiChar):integer; stdcall;
TPresenceOffline=function(callbackObject: Pointer; from, fromDisplayName:PAnsiChar):integer; stdcall;
TRecvOptions=function(callbackObject: Pointer; optionsMessage:PAnsiChar):integer; stdcall;
TRecvInfo=function(callbackObject: Pointer; sessionId:integer; infoMessage:PAnsiChar):integer; stdcall;
TRecvMessage=function(callbackObject: Pointer; sessionId:integer; message:PAnsiChar):integer; stdcall;
TRecvBinaryMessage=function(callbackObject: Pointer; sessionId:integer; message:PAnsiChar; data:Pointer; dataLength:integer):integer; stdcall;
TRecvBinaryPagerMessage=function(callbackObject: Pointer; from:PAnsiChar; fromDisplayName:PAnsiChar; data:Pointer; dataLength:integer):integer; stdcall;


// additional callbacks
// Audio and video callback function prototype
TAudioRawCallback=function(obj: Pointer; sessionId, _type: integer; data:Pointer; dataLength, samplingFreqHz:integer):integer; stdcall;
TVideoRawCallback=function(obj: Pointer; sessionId, _type: integer; width, height:integer; data:Pointer; dataLength:integer):integer; stdcall;

// Callback functioins for play wave file and AVI file to remote side
TPlayWaveFileToRemoteFinished=function(obj:Pointer; sessionID:integer; filePathName:PAnsiChar):integer; stdcall;
TPlayAviFileToRemoteFinished=function(obj:Pointer; sessionID:integer):integer; stdcall;


// Callback functions for received and sending RTP packets
TReceivedRTPPacket=function(obj:Pointer; sessionId: integer; state:boolean; RTPPacket:Pointer; var packetSize:integer):integer; stdcall;
TSendingRTPPacket=function(obj:Pointer; sessionId: integer; state:boolean; RTPPacket:Pointer; var packetSize:integer):integer; stdcall;

// SipEventEx
function SIPEV_createSIPCallbackHandle():THAndle; cdecl;
procedure SIPEV_shutdownSIPCallbackHandle(callbackHandle:THandle); cdecl;
procedure SIPEV_releaseSIPCallbackHandle(callbackHandle:THandle); cdecl;

procedure SIPEV_setRegisterSuccessHandler(callbackHandle:THandle; eventHandler: TRegisterSuccess; callbackObject: Pointer); cdecl;
procedure SIPEV_setRegisterFailureHandler(callbackHandle:THandle; eventHandler: TRegisterFailure; callbackObject: Pointer); cdecl;
procedure SIPEV_setInviteIncomingHandler(callbackHandle:THandle; eventHandler: TInviteIncoming; callbackObject: Pointer); cdecl;
procedure SIPEV_setInviteTryingHandler(callbackHandle:THandle; eventHandler: TInviteTrying; callbackObject: Pointer); cdecl;
procedure SIPEV_setInviteRingingHandler(callbackHandle:THandle; eventHandler: TInviteRinging; callbackObject: Pointer); cdecl;
procedure SIPEV_setInviteAnsweredHandler(callbackHandle:THandle; eventHandler: TInviteAnswered; callbackObject: Pointer); cdecl;
procedure SIPEV_setInviteFailureHandler(callbackHandle:THandle; eventHandler: TInviteFailure; callbackObject: Pointer); cdecl;
procedure SIPEV_setInviteClosedHandler(callbackHandle:THandle; eventHandler: TInviteClosed; callbackObject: Pointer); cdecl;
procedure SIPEV_setInviteUpdatedHandler(callbackHandle:THandle; eventHandler: TInviteUpdated; callbackObject: Pointer); cdecl;
procedure SIPEV_setInviteUASConnectedHandler(callbackHandle:THandle; eventHandler: TInviteUASConnected; callbackObject: Pointer); cdecl;
procedure SIPEV_setInviteUACConnectedHandler(callbackHandle:THandle; eventHandler: TInviteUACConnected; callbackObject: Pointer); cdecl;
procedure SIPEV_setInviteBeginingForwardHandler(callbackHandle:THandle; eventHandler: TInviteBeginingForward; callbackObject: Pointer); cdecl;
procedure SIPEV_setRemoteHoldHandler(callbackHandle:THandle; eventHandler: TRemoteHold; callbackObject: Pointer); cdecl;
procedure SIPEV_setRemoteUnHoldHandler(callbackHandle:THandle; eventHandler: TRemoteUnHold; callbackObject: Pointer); cdecl;
procedure SIPEV_setTransferTryingHandler(callbackHandle:THandle; eventHandler: TTransferTrying; callbackObject: Pointer); cdecl;
procedure SIPEV_setTransferRingingHandler(callbackHandle:THandle; eventHandler: TTransferRinging; callbackObject: Pointer); cdecl;
procedure SIPEV_setPASVTransferSuccessHandler(callbackHandle:THandle; eventHandler: TPASVTransferSuccess; callbackObject: Pointer); cdecl;
procedure SIPEV_setACTVTransferSuccessHandler(callbackHandle:THandle; eventHandler: TACTVTransferSuccess; callbackObject: Pointer); cdecl;
procedure SIPEV_setPASVTransferFailureHandler(callbackHandle:THandle; eventHandler: TPASVTransferFailure; callbackObject: Pointer); cdecl;
procedure SIPEV_setACTVTransferFailureHandler(callbackHandle:THandle; eventHandler: TACTVTransferFailure; callbackObject: Pointer); cdecl;
procedure SIPEV_setRecvPagerMessageHandler(callbackHandle:THandle; eventHandler: TRecvPagerMessage; callbackObject: Pointer); cdecl;
procedure SIPEV_setSendPagerMessageSuccessHandler(callbackHandle:THandle; eventHandler: TSendPagerMessageSuccess; callbackObject: Pointer); cdecl;
procedure SIPEV_setSendPagerMessageFailureHandler(callbackHandle:THandle; eventHandler: TSendPagerMessageFailure; callbackObject: Pointer); cdecl;
procedure SIPEV_setArrivedSignalingHandler(callbackHandle:THandle; eventHandler: TArrivedSignaling; callbackObject: Pointer); cdecl;
procedure SIPEV_setSentSignalingHandler(callbackHandle:THandle; eventHandler: TSentSignaling; callbackObject: Pointer); cdecl;
procedure SIPEV_setWaitingVoiceMessageHandler(callbackHandle:THandle; eventHandler: TWaitingVoiceMessage; callbackObject: Pointer); cdecl;
procedure SIPEV_setWaitingFaxMessageHandler(callbackHandle:THandle; eventHandler: TWaitingFaxMessage; callbackObject: Pointer); cdecl;
procedure SIPEV_setRecvDtmfToneHandler(callbackHandle:THandle; eventHandler: TRecvDtmfTone; callbackObject: Pointer); cdecl;
procedure SIPEV_setPresenceRecvSubscribeHandler(callbackHandle:THandle; eventHandler: TPresenceRecvSubscribe; callbackObject: Pointer); cdecl;
procedure SIPEV_setPresenceOnlineHandler(callbackHandle:THandle; eventHandler: TPresenceOnline; callbackObject: Pointer); cdecl;
procedure SIPEV_setPresenceOfflineHandler(callbackHandle:THandle; eventHandler: TPresenceOffline; callbackObject: Pointer); cdecl;
procedure SIPEV_setRecvOptionsHandler(callbackHandle:THandle; eventHandler: TRecvOptions; callbackObject: Pointer); cdecl;
procedure SIPEV_setRecvInfoHandler(callbackHandle:THandle; eventHandler: TRecvInfo; callbackObject: Pointer); cdecl;
procedure SIPEV_setRecvMessageHandler(callbackHandle:THandle; eventHandler: TRecvMessage; callbackObject: Pointer); cdecl;
procedure SIPEV_setRecvBinaryMessageHandler(callbackHandle:THandle; eventHandler: TRecvBinaryMessage; callbackObject: Pointer); cdecl;
procedure SIPEV_setRecvBinaryPagerMessageHandler(callbackHandle:THandle; eventHandler: TRecvBinaryPagerMessage; callbackObject: Pointer); cdecl;



// PortSipCore
function PortSIP_initialize(SIPCallbackEvent:THandle;
						transportType: integer;
            appLogLevel: integer;
            logFilePath: PAnsiChar;
						maximumLines: integer;
						agent: PAnsiChar;
						STUNServer: PAnsiChar;
						STUNServerPort: integer;
            useVirtualAudioDevice: Boolean;
            useVirtualVideoDevice: Boolean;
            var ErrorCode: integer
            ):THandle; cdecl;

function PortSIP_setUserInfo(SIPCoreHandle:THandle;
						userName: PAnsiChar;
						displayName: PAnsiChar;
						authName: PAnsiChar;
						password: PAnsiChar;
						localIP: PAnsiChar;
						localSIPPort: integer;
						userDomain: PAnsiChar;
						SIPServer: PAnsiChar;
						SIPServerPort: integer;
						outboundServer: PAnsiChar;
						outboundServerPort: integer):integer; cdecl;

procedure PortSIP_unInitialize(SIPCoreHandle:THandle); cdecl;

function PortSIP_getLocalIP(SIPCoreHandle:THandle;
            index: integer;
            IP:PAnsiChar;
            ipLength:integer):integer; cdecl;

function PortSIP_getLocalIP6(SIPCoreHandle:THandle;
            index: integer;
            IP:PAnsiChar;
            ipLength:integer):integer; cdecl;

function PortSIP_getNICNums(SIPCoreHandle:THandle):integer; cdecl;

procedure PortSIP_setLicenseKey(SIPCoreHandle:THandle;
            key:PAnsiChar); cdecl;

function PortSIP_getVersion(SIPCoreHandle:THandle;
            var majorVersion:integer;
            var minorVersion:integer):integer; cdecl;

procedure PortSIP_enableStackLog(SIPCoreHandle:THandle;
            logFilePath:PAnsiChar); cdecl;

function PortSIP_enableSessionTimer(SIPCoreHandle:THandle;
            timerSeconds:integer; refreshMode:integer):integer; cdecl;

procedure PortSIP_disableSessionTimer(SIPCoreHandle:THandle); cdecl;

procedure PortSIP_setKeepAliveTime(SIPCoreHandle:THandle;
            keepAliveTime: integer); cdecl;

procedure PortSIP_setReliableProvisionalMode(SIPCoreHandle:THandle;
            provisonalMode: integer); cdecl;

procedure PortSIP_enableCheckMwi(SIPCoreHandle:THandle;
            state:boolean); cdecl;

procedure PortSIP_detectMwi(SIPCoreHandle:THandle); cdecl;

procedure PortSIP_setSrtpPolicy(SIPCoreHandle:THandle;
            srtPolicy:integer); cdecl;

function PortSIP_setRtpPortRange(SIPCoreHandle:THandle;
            minimumRtpAudioPort: integer;
            maximumRtpAudioPort: integer;
            minimumRtpVideoPort: integer;
            maximumRtpVideoPort: integer):integer; cdecl;


function PortSIP_setRtcpPortRange(SIPCoreHandle:THandle;
            minimumRtcpAudioPort: integer;
            maximumRtcpAudioPort: integer;
            minimumRtcpVideoPort: integer;
            maximumRtcpVideoPort: integer):integer; cdecl;




procedure PortSIP_setRtpKeepAlive(SIPCoreHandle:THandle;
            state:boolean;
            keepAlivePayloadType:integer;
            deltaTransmitTimeMS:integer); cdecl;

procedure PortSIP_setRtpCallback(SIPCoreHandle:THandle;
            callbackObj:THandle;
            receivedCallbackHandler:TReceivedRTPPacket;
            sendingCallbackHandler:TReceivedRTPPacket); cdecl;

function PortSIP_registerServer(SIPCoreHandle:THandle;
            expires:integer):integer; cdecl;

procedure PortSIP_unRegisterServer(SIPCoreHandle:THandle); cdecl;

procedure PortSIP_addAudioCodec(SIPCoreHandle:THandle;
            codecType:integer); cdecl;

procedure PortSIP_addVideoCodec(SIPCoreHandle:THandle;
            codecType:integer); cdecl;

function  PortSIP_setAudioCodecPayloadType(SIPCoreHandle:THandle;
            codecType:integer; payloadType: integer): integer; cdecl;

function  PortSIP_setVideoCodecPayloadType(SIPCoreHandle:THandle;
            codecType:integer; payloadType: integer): integer; cdecl;


function  PortSIP_setAudioCodecParameter(SIPCoreHandle:THandle;
             codecType:integer; parameter:PAnsiChar): integer; cdecl;

function  PortSIP_setVideoCodecParameter(SIPCoreHandle:THandle;
             codecType:integer; parameter:PAnsiChar): integer; cdecl;

procedure PortSIP_clearAudioCodec(SIPCoreHandle:THandle); cdecl;

procedure PortSIP_clearVideoCodec(SIPCoreHandle:THandle); cdecl;

function PortSIP_isAudioCodecEmpty(SIPCoreHandle:THandle): boolean; cdecl;

function PortSIP_isVideoCodecEmpty(SIPCoreHandle:THandle): boolean; cdecl;

function PortSIP_setAudioDeviceId(SIPCoreHandle:THandle;
            recordingDeviceId:integer;
            playoutDeviceId:integer): integer; cdecl;

function PortSIP_setVideoDeviceId(SIPCoreHandle:THandle;
            deviceId:integer): integer; cdecl;

procedure PortSIP_setVideoBitrate(SIPCoreHandle:THandle;
            bitrateKbps:integer); cdecl;

procedure PortSIP_setVideoFrameRate(SIPCoreHandle:THandle;
            frameRate:integer); cdecl;

procedure PortSIP_setVideoResolution(SIPCoreHandle:THandle;
            resolution:integer); cdecl;

procedure PortSIP_setLocalVideoWindow(SIPCoreHandle:THandle;
            localVideoWindow:THandle); cdecl;

function PortSIP_setRemoteVideoWindow(SIPCoreHandle:THandle;
            sessionId: integer;
            remoteVideoWindow:THandle):integer; cdecl;

function PortSIP_viewLocalVideo(SIPCoreHandle:THandle;
            state:boolean):integer; cdecl;

function PortSIP_startVideoSending(SIPCoreHandle:THandle;
            sessionId:integer;
            state:boolean):integer; cdecl;

function PortSIP_call(SIPCoreHandle:THandle; callTo:PAnsiChar;
            sendSdp:boolean;
            var errorcode:integer):integer; cdecl;

function PortSIP_rejectCall(SIPCoreHandle:THandle;
            sessionId:integer;
            code:integer;
            reason:PAnsiChar):integer; cdecl;

function PortSIP_answerCall(SIPCoreHandle:THandle;
            sessionId:integer):integer; cdecl;

function PortSIP_terminateCall(SIPCoreHandle:THandle;
            sessionId:integer):integer; cdecl;

function PortSIP_forwardCall(SIPCoreHandle:THandle;
            sessionId:integer;
            forwardTo:PAnsiChar):integer; cdecl;

function PortSIP_enableCallForwarding(SIPCoreHandle:THandle;
            forBusyOnly:Boolean;
            forwardingTo:PAnsiChar):integer; cdecl;

procedure PortSIP_disableCallForwarding(SIPCoreHandle:THandle); cdecl;

function PortSIP_updateInvite(SIPCoreHandle:THandle;
            sessionId:integer):integer; cdecl;

function PortSIP_hold(SIPCoreHandle:THandle;
            sessionId:integer):integer; cdecl;

function PortSIP_unHold(SIPCoreHandle:THandle;
            sessionId:integer):integer; cdecl;

function PortSIP_refer(SIPCoreHandle:THandle; sessionId:integer;
            referTo:PAnsiChar):integer; cdecl;

function PortSIP_attendedRefer(SIPCoreHandle:THandle;
            sessionId, replaceSessionId:integer; referTo:PAnsiChar):integer; cdecl;

function PortSIP_setAudioJitterBufferLevel(SIPCoreHandle:THandle;
            jitterBufferLevel:Integer):integer; cdecl;


function PortSIP_getNetworkStatistics(SIPCoreHandle:THandle;
            sessionId:integer;
						var currentBufferSize,
             preferredBufferSize,
             currentPacketLossRate,
            currentDiscardRate,
            currentExpandRate,
            currentPreemptiveRate,
            currentAccelerateRate: integer):integer; cdecl;


function PortSIP_getAudioRtpStatistics(SIPCoreHandle:THandle;
            sessionId:integer;
						var averageJitterMs, maxJitterMs, discardedPackets:integer):integer; cdecl;

function PortSIP_getAudioRtcpStatistics(SIPCoreHandle:THandle;
						sessionId:integer;
						var bytesSent, packetsSent, bytesReceived,
						packetsReceived:integer):integer; cdecl;

function PortSIP_getVideoRtpStatistics(SIPCoreHandle:THandle;
						sessionId:integer;
						var bytesSent, packetsSent, bytesReceived,
						packetsReceived:integer):integer; cdecl;

procedure PortSIP_enableVAD(SIPCoreHandle:THandle;
            state:boolean); cdecl;

procedure PortSIP_enableAEC(SIPCoreHandle:THandle;
            state:boolean); cdecl;

procedure PortSIP_enableCNG(SIPCoreHandle:THandle;
            state:boolean); cdecl;

procedure PortSIP_enableAGC(SIPCoreHandle:THandle;
            state:boolean); cdecl;

procedure PortSIP_enableANS(SIPCoreHandle:THandle;
            state:boolean); cdecl;

function PortSIP_setAudioSamples(SIPCoreHandle:THandle;
            ptime, maxPtime:integer):integer; cdecl;

procedure PortSIP_setDTMFSamples(SIPCoreHandle:THandle;
            samples:integer); cdecl;

procedure PortSIP_enableDTMFOfRFC2833(SIPCoreHandle:THandle;
            RTPPayloadOf2833:integer); cdecl; // Usually the payload is 101

procedure PortSIP_enableDTMFOfInfo(SIPCoreHandle:THandle); cdecl;

function PortSIP_sendDTMF(SIPCoreHandle:THandle;
            sessionId: integer;
            code:AnsiChar):integer; cdecl;

function PortSIP_startAudioRecording(SIPCoreHandle:THandle;
						recordFilePath, fileName:PAnsiChar;
            appendTimestamp:boolean;
						fileFormat:integer;
            recordMode:integer):integer; cdecl;

function PortSIP_stopAudioRecording(SIPCoreHandle:THandle):integer; cdecl;

function PortSIP_startVideoRecording(SIPCoreHandle:THandle;
            recordFilePath, fileName:PAnsiChar;
            appendTimestamp:boolean;
            codecType:integer;
            recordMode:integer):integer; cdecl;

function PortSIP_stopVideoRecording(SIPCoreHandle:THandle):integer; cdecl;

procedure PortSIP_muteMicrophone(SIPCoreHandle:THandle;
            mute:boolean); cdecl;

procedure PortSIP_muteSpeaker(SIPCoreHandle:THandle;
            mute:boolean); cdecl;

function PortSIP_getExtensionHeaderValue(SIPCoreHandle:THandle;
            sipMessage, headerName, headerValue:PAnsiChar;
            headerValueLength:integer):integer; cdecl;

function PortSIP_addExtensionHeader(SIPCoreHandle:THandle;
            headerName, headerValue:PAnsiChar):integer; cdecl;

procedure PortSIP_clearAddExtensionHeaders(SIPCoreHandle:THandle); cdecl;

function PortSIP_modifyHeaderValue(SIPCoreHandle:THandle;
            headerName, headerValue:PAnsiChar):integer; cdecl;

procedure PortSIP_clearModifyHeaders(SIPCoreHandle:THandle); cdecl;

procedure PortSIP_enableCallbackSentSignaling(SIPCoreHandle:THandle; enable:boolean); cdecl;

function PortSIP_setAudioQos(SIPCoreHandle:THandle;
            enable:boolean;
            DSCPValue, priority:integer):integer; cdecl;

function PortSIP_setVideoQos(SIPCoreHandle:THandle;
            enable:boolean;
            DSCPValue:integer):integer; cdecl;

procedure PortSIP_getDynamicVolumeLevel(SIPCoreHandle:THandle;
            var speakerVolume:integer;
            var microphoneVolume:integer); cdecl;


function PortSIP_enableSendPcmStreamToRemote(SIPCoreHandle:THandle;
            sessionId:integer;
            state:boolean;
            streamSamplesPerSec:integer):integer; cdecl;

function PortSIP_sendPcmStreamToRemote(SIPCoreHandle:THandle;
            sessionId:integer;
            data:Pointer;
            dataLength:integer):integer; cdecl;

procedure PortSIP_discardAudio(SIPCoreHandle:THandle;
            discardIncomingAudio:boolean;
            discardOutgoing:boolean); cdecl;

procedure PortSIP_setPlayWaveFileToRemote(SIPCoreHandle:THandle;
            sessionID: integer;
            waveFile:PAnsiChar;
            enableState:boolean;
            playMode:integer;
            fileSamplesPerSec: integer;
            CallbackObject:Pointer;
            callbackHandler:TplayWaveFileToRemoteFinished); cdecl;

function PortSIP_setPlayAviFileToRemote(SIPCoreHandle:THandle;
            sessionID: integer;
            aviFile:PAnsiChar;
            enableState:boolean;
            loop: boolean;
            PlayAudio: boolean;
            CallBackObject:Pointer;
            callbackHandler:TplayAviFileToRemoteFinished):integer; cdecl;

function PortSIP_enableAudioStreamCallback(SIPCoreHandle:THandle;
            sessionID: integer;
            enable: boolean;
            callbackType:integer;
            CallbackObject:Pointer;
            callbackHandler:TaudioRawCallback):integer; cdecl;

function PortSIP_enableVideoStreamCallback(SIPCoreHandle:THandle;
            sessionId: integer;
            enable: boolean;
            callbackType:integer;
            CallbackObject:Pointer;
            callbackHandler:TvideoRawCallback):integer; cdecl;

function PortSIP_createConference(SIPCoreHandle:THandle;
            conferenceVideoWindow:THandle;
            videoResolution: integer;
            viewLocalVideo:boolean):integer; cdecl;

function PortSIP_createConferenceEx(SIPCoreHandle:THandle;
            conferenceVideoWindow:THandle;
            videoResolution: integer;
            viewLocalVideo:boolean;
            sessionIds: Pointer;
            sessionIdNums:integer):integer; cdecl;

procedure PortSIP_destroyConference(SIPCoreHandle:THandle); cdecl;

function PortSIP_joinToConference(SIPCoreHandle:THandle;
            sessionId:integer):integer; cdecl;

function PortSIP_removeFromConference(SIPCoreHandle:THandle;
            sessionId:integer):integer; cdecl;

function PortSIP_addSupportedMimeType(SIPCoreHandle:THandle;
            methodName, mimeType, subMimeType:PAnsiChar):integer; cdecl;

function PortSIP_sendInfo(SIPCoreHandle:THandle;
            sessionId:integer;
            mimeType, subMimeType, infoContents:PAnsiChar):integer; cdecl;

function PortSIP_sendOptions(SIPCoreHandle:THandle;
            _to, sdp:PAnsiChar):integer; cdecl;

function PortSIP_sendMessage(SIPCoreHandle:THandle;
            sessionId:integer;
            mimeType, subMimeType, message:PAnsiChar):integer; cdecl;

function PortSIP_sendMessageEx(SIPCoreHandle:THandle;
            sessionId:integer;
            mimeType, subMimeType:PAnsiChar;
            message:PByteArray;
            messageLength:integer):integer; cdecl;

function PortSIP_sendOutOfDialogMessage(SIPCoreHandle:THandle;
            _to, mimeType, subMimeType, message:PAnsiChar):integer; cdecl;

function PortSIP_sendOutOfDialogMessageEx(SIPCoreHandle:THandle;
            _to, mimeType, subMimeType: PAnsiChar;
            message: PByteArray;
            messageLength:integer):integer; cdecl;

function PortSIP_sendPagerMessage(SIPCoreHandle:THandle;
            _to, message:PAnsiChar):integer; cdecl;

function PortSIP_presenceSubscribeContact(SIPCoreHandle:THandle;
            contact, subject:PAnsiChar):integer; cdecl;

function PortSIP_presenceRejectSubscribe(SIPCoreHandle:THandle;
            subscribeId:integer):integer; cdecl;

function PortSIP_presenceAcceptSubscribe(SIPCoreHandle:THandle;
            subscribeId:integer):integer; cdecl;

function PortSIP_presenceOffline(SIPCoreHandle:THandle;
            subscribeId:integer):integer; cdecl;

function PortSIP_presenceOnline(SIPCoreHandle:THandle;
            subscribeId:integer;
            stateText:PAnsiChar):integer; cdecl;

function PortSIP_getNumOfRecordingDevices(SIPCoreHandle:THandle):integer; cdecl;

function PortSIP_getNumOfPlayoutDevices(SIPCoreHandle:THandle):integer; cdecl;

function PortSIP_getRecordingDeviceName(SIPCoreHandle:THandle;
				    index:integer;
						nameUTF8:PAnsiChar;
						nameUTF8Length:integer
            ):integer; cdecl;

function PortSIP_getPlayoutDeviceName(SIPCoreHandle:THandle;
						index:integer;
						nameUTF8:PAnsiChar;
						nameUTF8Length:integer
            ):integer; cdecl;

function PortSIP_setSpeakerVolume(SIPCoreHandle:THandle;
            volume:integer):integer; cdecl;

function PortSIP_getSpeakerVolume(SIPCoreHandle:THandle):integer; cdecl;

function PortSIP_setSystemOutputMute(SIPCoreHandle:THandle;
            enable:boolean):integer; cdecl;

function PortSIP_getSystemOutputMute(SIPCoreHandle:THandle):boolean; cdecl;

function PortSIP_setMicVolume(SIPCoreHandle:THandle;
            volume:integer):integer; cdecl;

function PortSIP_getMicVolume(SIPCoreHandle:THandle):integer; cdecl;

function PortSIP_setSystemInputMute(SIPCoreHandle:THandle;
            enable:boolean):integer; cdecl;

function PortSIP_getSystemInputMute(SIPCoreHandle:THandle):boolean; cdecl;

function PortSIP_playLocalWaveFile(SIPCoreHandle:THandle;
            waveFile:PAnsiChar;
            loop:boolean):integer; cdecl;

procedure PortSIP_audioPlayLoopbackTest(SIPCoreHandle:THandle;
            enable:boolean); cdecl;

function PortSIP_getNumOfVideoCaptureDevices(SIPCoreHandle:THandle):integer; cdecl;

function PortSIP_getVideoCaptureDeviceName(SIPCoreHandle:THandle;
						index:integer;
						uniqueIdUTF8:PAnsiChar;
						uniqueIdUTF8Length:integer;
						deviceNameUTF8:PAnsiChar;
						deviceNameUTF8Length:integer):integer; cdecl;

function PortSIP_showVideoCaptureSettingsDialogBox(SIPCoreHandle:THandle;
						uniqueIdUTF8:PAnsiChar;
						uniqueIdUTF8Length:integer;
						dialogTitle:PAnsiChar;
            parentWindow:THandle;
						x:integer;
						y:integer):integer; cdecl;

implementation

// SipEventEx
function SIPEV_createSIPCallbackHandle; External SIPEventEXDLL;
procedure SIPEV_shutdownSIPCallbackHandle; External SIPEventEXDLL;
procedure SIPEV_releaseSIPCallbackHandle; External SIPEventEXDLL;
procedure SIPEV_setRegisterSuccessHandler; External SIPEventEXDLL;
procedure SIPEV_setRegisterFailureHandler; External SIPEventEXDLL;
procedure SIPEV_setInviteIncomingHandler; External SIPEventEXDLL;
procedure SIPEV_setInviteTryingHandler; External SIPEventEXDLL;
procedure SIPEV_setInviteRingingHandler; External SIPEventEXDLL;
procedure SIPEV_setInviteAnsweredHandler; External SIPEventEXDLL;
procedure SIPEV_setInviteFailureHandler; External SIPEventEXDLL;
procedure SIPEV_setInviteClosedHandler; External SIPEventEXDLL;
procedure SIPEV_setInviteUpdatedHandler; External SIPEventEXDLL;
procedure SIPEV_setInviteUASConnectedHandler; External SIPEventEXDLL;
procedure SIPEV_setInviteUACConnectedHandler; External SIPEventEXDLL;
procedure SIPEV_setInviteBeginingForwardHandler; External SIPEventEXDLL;
procedure SIPEV_setRemoteHoldHandler; External SIPEventEXDLL;
procedure SIPEV_setRemoteUnHoldHandler; External SIPEventEXDLL;
procedure SIPEV_setTransferTryingHandler; External SIPEventEXDLL;
procedure SIPEV_setTransferRingingHandler; External SIPEventEXDLL;
procedure SIPEV_setPASVTransferSuccessHandler; External SIPEventEXDLL;
procedure SIPEV_setACTVTransferSuccessHandler; External SIPEventEXDLL;
procedure SIPEV_setPASVTransferFailureHandler; External SIPEventEXDLL;
procedure SIPEV_setACTVTransferFailureHandler; External SIPEventEXDLL;
procedure SIPEV_setRecvPagerMessageHandler; External SIPEventEXDLL;
procedure SIPEV_setSendPagerMessageSuccessHandler; External SIPEventEXDLL;
procedure SIPEV_setSendPagerMessageFailureHandler; External SIPEventEXDLL;
procedure SIPEV_setArrivedSignalingHandler; External SIPEventEXDLL;
procedure SIPEV_setSentSignalingHandler; External SIPEventEXDLL;
procedure SIPEV_setWaitingVoiceMessageHandler; External SIPEventEXDLL;
procedure SIPEV_setWaitingFaxMessageHandler; External SIPEventEXDLL;
procedure SIPEV_setRecvDtmfToneHandler; External SIPEventEXDLL;
procedure SIPEV_setPresenceRecvSubscribeHandler; External SIPEventEXDLL;
procedure SIPEV_setPresenceOnlineHandler; External SIPEventEXDLL;
procedure SIPEV_setPresenceOfflineHandler; External SIPEventEXDLL;
procedure SIPEV_setRecvOptionsHandler; External SIPEventEXDLL;
procedure SIPEV_setRecvInfoHandler; External SIPEventEXDLL;
procedure SIPEV_setRecvMessageHandler; External SIPEventEXDLL;
procedure SIPEV_setRecvBinaryMessageHandler; External SIPEventEXDLL;
procedure SIPEV_setRECVBinaryPagerMessageHandler; External SIPEventEXDLL;

//PortSIPCore
function PortSIP_initialize; external PortSIPDLL;
function PortSIP_setUserInfo; external PortSIPDLL;
procedure PortSIP_unInitialize; external PortSIPDLL;
function PortSIP_getLocalIP; external PortSIPDLL;
function PortSIP_getLocalIP6; external PortSIPDLL;
function PortSIP_getNICNums;  external PortSIPDLL;
procedure PortSIP_setLicenseKey; external PortSIPDLL;
function PortSIP_getVersion; external PortSIPDLL;
procedure PortSIP_enableStackLog; external PortSIPDLL;
function PortSIP_enableSessionTimer; external PortSIPDLL;
procedure PortSIP_disableSessionTimer; external PortSIPDLL;
procedure PortSIP_setKeepAliveTime; external PortSIPDLL;
procedure PortSIP_setReliableProvisionalMode; external PortSIPDLL;
procedure PortSIP_enableCheckMwi; external PortSIPDLL;
procedure PortSIP_detectMwi; external PortSIPDLL;
procedure PortSIP_setSrtpPolicy; external PortSIPDLL;
function PortSIP_setRtpPortRange; external PortSIPDLL;
function PortSIP_setRtcpPortRange; external PortSIPDLL;
procedure PortSIP_setRtpKeepAlive; external PortSIPDLL;
procedure PortSIP_setRtpCallback; external PortSIPDLL;
function PortSIP_registerServer; external PortSIPDLL;
procedure PortSIP_unRegisterServer; external PortSIPDLL;
procedure PortSIP_addAudioCodec; external PortSIPDLL;
procedure PortSIP_addVideoCodec; external PortSIPDLL;
function PortSIP_setAudioCodecPayloadType; external PortSIPDLL;
function PortSIP_setVideoCodecPayloadType; external PortSIPDLL;
function PortSIP_setAudioCodecParameter; external PortSIPDLL;
function PortSIP_setVideoCodecParameter; external PortSIPDLL;
procedure PortSIP_clearAudioCodec; external PortSIPDLL;
procedure PortSIP_clearVideoCodec; external PortSIPDLL;
function PortSIP_isAudioCodecEmpty; external PortSIPDLL;
function PortSIP_isVideoCodecEmpty; external PortSIPDLL;
function PortSIP_setAudioDeviceId; external PortSIPDLL;
function PortSIP_setVideoDeviceId; external PortSIPDLL;
procedure PortSIP_setVideoBitrate; external PortSIPDLL;
procedure PortSIP_setVideoFrameRate; external PortSIPDLL;
procedure PortSIP_setVideoResolution; external PortSIPDLL;
procedure PortSIP_setLocalVideoWindow; external PortSIPDLL;
function PortSIP_setRemoteVideoWindow; external PortSIPDLL;
function PortSIP_viewLocalVideo; external PortSIPDLL;
function PortSIP_startVideoSending; external PortSIPDLL;
function PortSIP_call; external PortSIPDLL;
function PortSIP_rejectCall; external PortSIPDLL;
function PortSIP_answerCall; external PortSIPDLL;
function PortSIP_terminateCall; external PortSIPDLL;
function PortSIP_forwardCall; external PortSIPDLL;
function PortSIP_enableCallForwarding; external PortSIPDLL;
procedure PortSIP_disableCallForwarding; external PortSIPDLL;
function PortSIP_updateInvite; external PortSIPDLL;
function PortSIP_hold; external PortSIPDLL;
function PortSIP_unHold; external PortSIPDLL;
function PortSIP_refer; external PortSIPDLL;
function PortSIP_attendedRefer; external PortSIPDLL;
function PortSIP_setAudioJitterBufferLevel; external PortSIPDLL;
function PortSIP_getNetworkStatistics; external PortSIPDLL;
function PortSIP_getAudioRtpStatistics; external PortSIPDLL;
function PortSIP_getAudioRtcpStatistics; external PortSIPDLL;
function PortSIP_getVideoRtpStatistics; external PortSIPDLL;
procedure PortSIP_enableVAD; external PortSIPDLL;
procedure PortSIP_enableAEC; external PortSIPDLL;
procedure PortSIP_enableCNG; external PortSIPDLL;
procedure PortSIP_enableAGC; external PortSIPDLL;
procedure PortSIP_enableANS; external PortSIPDLL;
function PortSIP_setAudioSamples; external PortSIPDLL;
procedure PortSIP_setDTMFSamples; external PortSIPDLL;
procedure PortSIP_enableDTMFOfRFC2833; external PortSIPDLL;
procedure PortSIP_enableDTMFOfInfo; external PortSIPDLL;
function PortSIP_sendDTMF; external PortSIPDLL;
function PortSIP_startAudioRecording; external PortSIPDLL;
function PortSIP_stopAudioRecording; external PortSIPDLL;
function PortSIP_startVideoRecording; external PortSIPDLL;
function PortSIP_stopVideoRecording; external PortSIPDLL;
procedure PortSIP_muteMicrophone; external PortSIPDLL;
procedure PortSIP_muteSpeaker; external PortSIPDLL;
function PortSIP_getExtensionHeaderValue; external PortSIPDLL;
function PortSIP_addExtensionHeader; external PortSIPDLL;
procedure PortSIP_clearAddExtensionHeaders; external PortSIPDLL;
function PortSIP_modifyHeaderValue; external PortSIPDLL;
procedure PortSIP_clearModifyHeaders; external PortSIPDLL;
procedure PortSIP_enableCallbackSentSignaling; external PortSIPDLL;
function PortSIP_setAudioQos; external PortSIPDLL;
function PortSIP_setVideoQos; external PortSIPDLL;
procedure PortSIP_getDynamicVolumeLevel; external PortSIPDLL;
function PortSIP_enableSendPcmStreamToRemote; external PortSIPDLL;
function PortSIP_sendPcmStreamToRemote; external PortSIPDLL;
procedure PortSIP_discardAudio; external PortSIPDLL;
procedure PortSIP_setPlayWaveFileToRemote; external PortSIPDLL;
function PortSIP_setPlayAviFileToRemote; external PortSIPDLL;
function PortSIP_enableAudioStreamCallback; external PortSIPDLL;
function PortSIP_enableVideoStreamCallback; external PortSIPDLL;
function PortSIP_createConference; external PortSIPDLL;
function PortSIP_createConferenceEx; external PortSIPDLL;
procedure PortSIP_destroyConference; external PortSIPDLL;
function PortSIP_joinToConference; external PortSIPDLL;
function PortSIP_removeFromConference; external PortSIPDLL;
function PortSIP_addSupportedMimeType; external PortSIPDLL;
function PortSIP_sendInfo; external PortSIPDLL;
function PortSIP_sendOptions; external PortSIPDLL;
function PortSIP_sendMessage; external PortSIPDLL;
function PortSIP_sendMessageEx; external PortSIPDLL;
function PortSIP_sendOutOfDialogMessage; external PortSIPDLL;
function PortSIP_sendOutOfDialogMessageEx; external PortSIPDLL;
function PortSIP_sendPagerMessage; external PortSIPDLL;
function PortSIP_presenceSubscribeContact; external PortSIPDLL;
function PortSIP_presenceRejectSubscribe; external PortSIPDLL;
function PortSIP_presenceAcceptSubscribe; external PortSIPDLL;
function PortSIP_presenceOffline; external PortSIPDLL;
function PortSIP_presenceOnline; external PortSIPDLL;
function PortSIP_getNumOfRecordingDevices; external PortSIPDLL;
function PortSIP_getNumOfPlayoutDevices; external PortSIPDLL;
function PortSIP_getRecordingDeviceName; external PortSIPDLL;
function PortSIP_getPlayoutDeviceName; external PortSIPDLL;
function PortSIP_setSpeakerVolume; external PortSIPDLL;
function PortSIP_getSpeakerVolume; external PortSIPDLL;
function PortSIP_setSystemOutputMute; external PortSIPDLL;
function PortSIP_getSystemOutputMute; external PortSIPDLL;
function PortSIP_setMicVolume; external PortSIPDLL;
function PortSIP_getMicVolume; external PortSIPDLL;
function PortSIP_setSystemInputMute; external PortSIPDLL;
function PortSIP_getSystemInputMute; external PortSIPDLL;
function PortSIP_playLocalWaveFile; external PortSIPDLL;
procedure PortSIP_audioPlayLoopbackTest; external PortSIPDLL;
function PortSIP_getNumOfVideoCaptureDevices; external PortSIPDLL;
function PortSIP_getVideoCaptureDeviceName; external PortSIPDLL;
function PortSIP_showVideoCaptureSettingsDialogBox; external PortSIPDLL;

initialization
System.Set8087CW($133f);

end.


