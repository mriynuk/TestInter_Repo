unit PortSipConsts;

interface

uses
  classes,SysUtils;

const

  LINE_BASE = 1;
  MAXLINE = 8;

// DTMF
  DTMF_0 = '0';
  DTMF_1 = '1';
  DTMF_2 = '2';
  DTMF_3 = '3';
  DTMF_4 = '4';
  DTMF_5 = '5';
  DTMF_6 = '6';
  DTMF_7 = '7';
  DTMF_8 = '8';
  DTMF_9 = '9';
  DTMF_star = '*';
  DTMF_count = '#';

// DTMF_NUM
  nDTMF_0 = 0;
  nDTMF_1 = 1;
  nDTMF_2 = 2;
  nDTMF_3 = 3;
  nDTMF_4 = 4;
  nDTMF_5 = 5;
  nDTMF_6 = 6;
  nDTMF_7 = 7;
  nDTMF_8 = 8;
  nDTMF_9 = 9;
  nDTMF_star = 10;
  nDTMF_count = 11;


// LogLevel for Initialize
  PORTSIP_LOG_NONE = -1;
  PORTSIP_LOG_INFO = 0;
  PORTSIP_LOG_WARNING = 1;
  PORTSIP_LOG_ERROR = 2;

// SRTP Policy
  SRTP_POLICY_NONE = 0;
  SRTP_POLICY_FORCE = 1;
  SRTP_POLICY_PREFER = 2;

// Transport type
  TRANSPORT_UDP= 0;
  TRANSPORT_TLS = 1;
  TRANSPORT_TCP = 2;

// for audio codecs

  AUDIOCODEC_G723		= 4;	//8KHZ
	AUDIOCODEC_G729		= 18;	//8KHZ
	AUDIOCODEC_PCMA		= 8;	//8KHZ
	AUDIOCODEC_PCMU		= 0;	//8KHZ
	AUDIOCODEC_GSM		= 3;	//8KHZ
	AUDIOCODEC_G722		= 9;	//16KHZ
	AUDIOCODEC_ILBC		= 97;	//8KHZ
	AUDIOCODEC_AMR		= 98;	//8KHZ
	AUDIOCODEC_AMRWB	= 99;	//16KHZ
	AUDIOCODEC_SPEEX	= 100;	//8KHZ
	AUDIOCODEC_SPEEXWB	= 102;	//16KHZ
	AUDIOCODEC_G7221	= 121;	//16KHZ
	AUDIOCODEC_ISACWB	= 103;	//16KHZ
	AUDIOCODEC_ISACSWB	= 104;	//32KHZ
	AUDIOCODEC_DTMF		= 101;


  // for video codecs
  VIDEOCODEC_I420 = 113;
  VIDEOCODEC_H263 = 34;
  VIDEOCODEC_H263_1998 = 115;
  VIDEOCODEC_H264 = 125;
  VIDEOCODEC_VP8 = 120;


  VIDEO_NONE	=	0;
  VIDEO_QCIF	=	1;		//	176X144		- for H263, H263-1998, H264
	VIDEO_CIF	=	2;		//	352X288		- for H263, H263-1998, H264
	VIDEO_VGA	=	3;		//	640X480		- for H264 only
	VIDEO_SVGA	=	4;		//	800X600		- for H264 only
	VIDEO_XVGA	=	5;		//	1024X768	- for H264 only
  VIDEO_720P = 6; // 1280X768 - for H264 only
  VIDEO_QVGA = 7; // 320x240 - for H264 only



// Audio record file format

  FILEFORMAT_WAVE = 1;
  FILEFORMAT_OGG = 2;
  FILEFORMAT_MP3 = 3;


// Audio stream callback mode

  AUDIOSTREAM_NONE = 0;     // Disable audio stream callback
  AUDIOSTREAM_LOCAL_MIX = 1;    // Callback local audio stream
  AUDIOSTREAM_LOCAL_PER_CHANNEL = 2;   //  Callback the audio stream from microphone for one channel base on the session ID
  AUDIOSTREAM_REMOTE_MIX = 3;   //	Callback the received audio stream that mixed including all channels
  AUDIOSTREAM_REMOTE_PER_CHANNEL = 4;   //  Callback the received audio stream for one channel base on the session ID

  // Access video stream callback mode

  VIDEOSTREAM_NONE = 0; // Disable video stream callback
  VIDEOSTREAM_LOCAL = 1; // Local video stream callback
  VIDEOSTREAM_REMOTE = 2; // Remote video stream callback
  VIDEOSTREAM_BOTH = 3; // Both of local and remote video stream callback


  // presence

	PRESENCE_P2P = 0;
	PRESENCE_AGENT = 1;

// For the audio callback
  PORTSIP_LOCAL_MIX_ID = -1;
  PORTSIP_REMOTE_MIX_ID = -2;


  // Audio record mode
  RECORD_RECV = 1;
  RECORD_SEND = 2;
  RECORD_BOTH = 3;


  // Audio jitter buffer level

	JITTER_SIZE_0 = 0;
	JITTER_SIZE_5 = 1;
	JITTER_SIZE_10 = 2;	//default jitter buffer size
	JITTER_SIZE_20 = 3;


  // PRACK mode

	UAC_PRACK_NONE = 0;
	UAC_PRACK_SUPPORTED = 1;
	UAC_PRACK_REQUIRED = 2;
	UAS_PRACK_NONE = 3;
	UAS_PRACK_SUPPORTED = 4;
	UAS_PRACK_REQUIRED = 5;


  // session timer refresh mode
	SESSION_REFERESH_UAC = 0;
	SESSION_REFERESH_UAS = 1;




  // SIP Codes

  SIPCODE_TRYING = 100;	// Trying
  SIPCODE_RINGING = 180;	// Ringing
  SIPCODE_CALL_IS_BEING_FORWARDED = 181;	// Call Is Being Forwarded
  SIPCODE_QUEUED = 182;	// Queued
  SIPCODE_SESSION_PROGRESS = 183;	// Session Progress
  SIPCODE_OK = 200;	// OK
  SIPCODE_ACCEPTED = 202;	// accepted: Used for referrals
  SIPCODE_MULTIPLE_CHOICES = 300;	// Multiple Choices
  SIPCODE_MOVED_PERMANENTLY = 301;	// Moved Permanently
  SIPCODE_MOVED_TEMPORARILY = 302;	// Moved Temporarily
  SIPCODE_USE_PROXY = 305;	// Use Proxy
  SIPCODE_ALTERNATIVE_SERVICE = 380;	// Alternative Service
  SIPCODE_BAD_REQUEST = 400;	// Bad Request
  SIPCODE_UNAUTHORIZED = 401;	// Unauthorized: Used only by registrars. Proxys should use proxy authorization 407
  SIPCODE_PAYMENT_REQUIRED = 402;	// Payment Required (Reserved for future use)
  SIPCODE_FORBIDDEN = 403;	// Forbidden
  SIPCODE_NOT_FOUND = 404;	// Not Found: User not found
  SIPCODE_METHOD_NOT_ALLOWED = 405;	// Method Not Allowed
  SIPCODE_NOT_ACCEPTABLE = 406;	// Not Acceptable
  SIPCODE_PROXY_AUTHENTICATION_REQUIRED = 407;	// Proxy Authentication Required
  SIPCODE_REQUEST_TIMEOUT = 408;	// Request Timeout: Couldn't find the user in time
  SIPCODE_CONFLICT = 409;	// Conflict
  SIPCODE_GONE = 410;	// Gone: The user existed once, but is not available here any more.
  SIPCODE_REQUEST_ENTITY_TOO_LARGE = 413;	// Request Entity Too Large
  SIPCODE_REQUEST_URI_TOO_LONG = 414;	// Request-URI Too Long
  SIPCODE_UNSUPPORTED_MEDIA_TYPE = 415;	// Unsupported Media Type
  SIPCODE_UNSUPPORTED_URI_SCHEME = 416;	// Unsupported URI Scheme
  SIPCODE_BAD_EXTENSION = 420;	// Bad Extension: Bad SIP Protocol Extension used, not understood by the server
  SIPCODE_EXTENSION_REQUIRED = 421;	// Extension Required
  SIPCODE_SESSION_INTERVAL_TOO_SMALL = 422;	// Session Interval Too Small
  SIPCODE_INTERVAL_TOO_BRIEF = 423;	// Interval Too Brief
  SIPCODE_TEMPORARILY_UNAVAILABLE = 480;	// Temporarily Unavailable
  SIPCODE_TRANSACTION_DOES_NOT_EXIST = 481;	// Call/Transaction Does Not Exist
  SIPCODE_LOOP_DETECTED = 482;	// Loop Detected
  SIPCODE_TOO_MANY_HOPS = 483;	// Too Many Hops
  SIPCODE_ADDRESS_INCOMPLETE = 484;	// Address Incomplete
  SIPCODE_AMBIGUOUS = 485;	// Ambiguous
  SIPCODE_BUSY_HERE = 486;	// Busy Here
  SIPCODE_REQUEST_TERMINATED = 487;	// Request Terminated
  SIPCODE_NOT_ACCEPTABLE_HERE = 488;	// Not Acceptable Here
  SIPCODE_REQUEST_PENDING = 491;	// Request Pending
  SIPCODE_UNDECIPHERABLE = 493;	// Undecipherable: Could not decrypt S/MIME body part
  SIPCODE_SERVER_INTERNAL_ERROR = 500;	// Server Internal Error
  SIPCODE_NOT_IMPLEMENTED = 501;	// Not Implemented: The SIP request method is not implemented here
  SIPCODE_BAD_GATEWAY = 502;	// Bad Gateway
  SIPCODE_SERVICE_UNAVAILABLE = 503;	// Service Unavailable
  SIPCODE_SERVER_TIME_OUT = 504;	// Server Time-out
  SIPCODE_VERSION_NOT_SUPPORTED = 505;	// Version Not Supported: The server does not support this version of the SIP protocol
  SIPCODE_MESSAGE_TOO_LARGE = 513;	// Message Too Large
  SIPCODE_BUSY_EVERYWHERE = 600;	// Busy Everywhere
  SIPCODE_DECLINE = 603;	// Decline
  SIPCODE_DOES_NOT_EXIST_ANYWHERE = 604;	// Does Not Exist Anywhere
  SIPCODE_NOT_ACCEPTABLE_2 = 606;	// Not Acceptable

// Errors

  INVALID_SESSION_ID = -1;

  ECoreAlreadyInitialized = -60000;
  ECoreNotInitialized = -60001;
  ECoreSDKObjectNull = -60002;
  ECoreArgumentNull = -60003;
  ECoreInitializeWinsockFailure = -60004;
  ECoreUserNameAuthNameEmpty = -60005;
  ECoreInitiazeStackFailure = -60006;
  ECorePortOutOfRange = -60007;
  ECoreAddTcpTransportFailure = -60008;
  ECoreAddTlsTransportFailure = -60009;
  ECoreAddUdpTransportFailure = -60010;
  ECoreMiniAudioPortOutOfRange = -60011;
  ECoreMaxAudioPortOutOfRange = -60012;
  ECoreMiniVideoPortOutOfRange = -60013;
  ECoreMaxVideoPortOutOfRange = -60014;
  ECoreMiniAudioPortNotEvenNumber = -60015;
  ECoreMaxAudioPortNotEvenNumber = -60016;
  ECoreMiniVideoPortNotEvenNumber = -60017;
  ECoreMaxVideoPortNotEvenNumber = -60018;
  ECoreAudioVideoPortOverlapped = -60019;
  ECoreAudioVideoPortRangeTooSmall = -60020;
  ECoreAlreadyRegistered = -60021;
  ECoreSIPServerEmpty = -60022;
  ECoreExpiresValueTooSmall = -60023;
  ECoreCallIdNotFound = -60024;
  ECoreNotRegistered = -60025;
  ECoreCalleeEmpty = -60026;
  ECoreInvalidUri = -60027;
  ECoreAudioVideoCodecEmpty = -60028;
  ECoreNoFreeDialogSession = -60029;
  ECoreCreateAudioChannelFailed = -60030;
  ECoreSessionTimerValueTooSmall = -60040;
  ECoreAudioHandleNull = -60041;
  ECoreVideoHandleNull = -60042;
  ECoreCallIsClosed = -60043;
  ECoreCallAlreadyHold = -60044;
  ECoreCallNotEstablished = -60045;
  ECoreCallNotHold = -60050;
  ECoreSipMessaegEmpty = -60051;
  ECoreSipHeaderNotExist = -60052;
  ECoreSipHeaderValueEmpty = -60053;
  ECoreSipHeaderBadFormed = -60054;
  ECoreBufferTooSmall = -60055;
  ECoreSipHeaderValueListEmpty = -60056;
  ECoreSipHeaderParserEmpty = -60057;
  ECoreSipHeaderValueListNull = -60058;
  ECoreSipHeaderNameEmpty = -60059;
  ECoreAudioSampleNotmultiple = -60060;
  ECoreAudioSampleOutOfRange = -60061;
  ECoreInviteSessionNotFound = -60062;
  ECoreStackException = -60063;
  ECoreMimeTypeUnknown = -60064;
  ECoreDataSizeTooLarge = -60065;
  ECoreSessionNumsOutOfRange = -60066;
  ECoreNotSupportCallbackMode = -60067;
  ECoreNotFoundSubscribeId = -60068;
  ECoreCodecNotSupport  =	-60069;
  ECoreCodecParameterNotSupport =	-60070;
  ECorePayloadOutofRange = -60071;	//  Dynamic Payload range is 96 - 127
  ECorePayloadHasExist = -60072;	//  Duplicate Payload values are not allowed.
  ECoreFixPayloadCantChange = -60073;


  // audio
  EAudioFileNameEmpty = -70000;
  EAudioChannelNotFound = -70001;
  EAudioStartRecordFailure = -70002;
  EAudioRegisterRecodingFailure = -70003;
  EAudioRegisterPlaybackFailure = -70004;
  EAudioGetStatisticsFailure = -70005;
  EAudioIsPlaying = -70006;
  EAudioPlayObjectNotExist = -70007;
  EAudioPlaySteamNotEnabled = -70008;
  EAudioRegisterCallbackFailure = -70009;
  EAudioCreateAudioConferenceFailure =	-70010;
  EAudioOpenPlayFileFailure		=	-70011;
  EAudioPlayFileModeNotSupport =		-70012;
  EAudioPlayFileFormatNotSupport	=	-70013;
  EAudioPlaySteamAlreadyEnabled	=	-70014;
  EAudioCreateRecordFileFailure	=	-70015 ;
  EAudioCodecNotSupport			=	-70016 ;
  EAudioPlayFileNotEnabled	 =		-70017 ;
  EAudioPlayFileUnknowSeekOrigin	=	-70018 ;

  // video
  EVideoFileNameEmpty = -80000;
  EVideoGetDeviceNameFailure = -80001;
  EVideoGetDeviceIdFailure = -80002;
  EVideoStartCaptureFailure = -80003;
  EVideoChannelNotFound = -80004;
  EVideoStartSendFailure = -80005;
  EVideoGetStatisticsFailure = -80006;
  EVideoStartPlayAviFailure = -80007;
  EVideoSendAviFileFailure = -80008;
  EVideoRecordUnknowCodec		=	-80009;

  // Device
  EDeviceGetDeviceNameFailure = -90001;



  SIPCODEC_UNKNOWN='unknown codec %d';

  SIPAUDIO_PCMA = 'PCMA';
  SIPAUDIO_PCMU = 'PCMU';
  SIPAUDIO_G729 = 'G729';
  SIPAUDIO_G723 = 'G723';
  SIPAUDIO_ILBC = 'ILBC';
  SIPAUDIO_GSM = 'GSM';
  SIPAUDIO_DTMF = 'DTMF';
  SIPAUDIO_G722 = 'G722';
  SIPAUDIO_AMR = 'AMR';
  SIPAUDIO_AMRWB = 'AMRWB';
  SIPAUDIO_G7221 = 'G7221';
  SIPAUDIO_SPEEX = 'SPEEX';
  SIPAUDIO_SPEEXWB = 'SPEEXWB';
  SIPAUDIO_ISACWB = 'isac';
  SIPAUDIO_ISACSWB = 'isac';

  SIPVIDEO_I420 = 'I420';
  SIPVIDEO_H263 = 'H263';
  SIPVIDEO_H263_1998 = '1998';
  SIPVIDEO_H264 = 'H264';
  SIPVIDEO_VP8 = 'vp8';



resourcestring
  SIPTEXT_TRYING = 'Trying';	 // code 100
  SIPTEXT_RINGING = 'Ringing';	 // code 180
  SIPTEXT_CALL_IS_BEING_FORWARDED = 'Call Is Being Forwarded';	 // code 181
  SIPTEXT_QUEUED = 'Queued';	 // code 182
  SIPTEXT_SESSION_PROGRESS = 'Session Progress';	 // code 183
  SIPTEXT_OK = 'OK';	 // code 200
  SIPTEXT_ACCEPTED = 'accepted: Used for referrals';	 // code 202
  SIPTEXT_MULTIPLE_CHOICES = 'Multiple Choices';	 // code 300
  SIPTEXT_MOVED_PERMANENTLY = 'Moved Permanently';	 // code 301
  SIPTEXT_MOVED_TEMPORARILY = 'Moved Temporarily';	 // code 302
  SIPTEXT_USE_PROXY = 'Use Proxy';	 // code 305
  SIPTEXT_ALTERNATIVE_SERVICE = 'Alternative Service';	 // code 380
  SIPTEXT_BAD_REQUEST = 'Bad Request';	 // code 400
  SIPTEXT_UNAUTHORIZED = 'Unauthorized: Used only by registrars. Proxys should use proxy authorization 407';	 // code 401
  SIPTEXT_PAYMENT_REQUIRED = 'Payment Required (Reserved for future use)';	 // code 402
  SIPTEXT_FORBIDDEN = 'Forbidden';	 // code 403
  SIPTEXT_NOT_FOUND = 'Not Found: User not found';	 // code 404
  SIPTEXT_METHOD_NOT_ALLOWED = 'Method Not Allowed';	 // code 405
  SIPTEXT_NOT_ACCEPTABLE = 'Not Acceptable';	 // code 406
  SIPTEXT_PROXY_AUTHENTICATION_REQUIRED = 'Proxy Authentication Required';	 // code 407
  SIPTEXT_REQUEST_TIMEOUT = 'Request Timeout: Couldn''t find the user in time';	 // code 408
  SIPTEXT_CONFLICT = 'Conflict';	 // code 409
  SIPTEXT_GONE = 'Gone: The user existed once, but is not available here any more.';	 // code 410
  SIPTEXT_REQUEST_ENTITY_TOO_LARGE = 'Request Entity Too Large';	 // code 413
  SIPTEXT_REQUEST_URI_TOO_LONG = 'Request-URI Too Long';	 // code 414
  SIPTEXT_UNSUPPORTED_MEDIA_TYPE = 'Unsupported Media Type';	 // code 415
  SIPTEXT_UNSUPPORTED_URI_SCHEME = 'Unsupported URI Scheme';	 // code 416
  SIPTEXT_BAD_EXTENSION = 'Bad Extension: Bad SIP Protocol Extension used, not understood by the server';	 // code 420
  SIPTEXT_EXTENSION_REQUIRED = 'Extension Required';	 // code 421
  SIPTEXT_SESSION_INTERVAL_TOO_SMALL = 'Session Interval Too Small';	 // code 422
  SIPTEXT_INTERVAL_TOO_BRIEF = 'Interval Too Brief';	 // code 423
  SIPTEXT_TEMPORARILY_UNAVAILABLE = 'Temporarily Unavailable';	 // code 480
  SIPTEXT_TRANSACTION_DOES_NOT_EXIST = 'Call/Transaction Does Not Exist';	 // code 481
  SIPTEXT_LOOP_DETECTED = 'Loop Detected';	 // code 482
  SIPTEXT_TOO_MANY_HOPS = 'Too Many Hops';	 // code 483
  SIPTEXT_ADDRESS_INCOMPLETE = 'Address Incomplete';	 // code 484
  SIPTEXT_AMBIGUOUS = 'Ambiguous';	 // code 485
  SIPTEXT_BUSY_HERE = 'Busy Here';	 // code 486
  SIPTEXT_REQUEST_TERMINATED = 'Request Terminated';	 // code 487
  SIPTEXT_NOT_ACCEPTABLE_HERE = 'Not Acceptable Here';	 // code 488
  SIPTEXT_REQUEST_PENDING = 'Request Pending';	 // code 491
  SIPTEXT_UNDECIPHERABLE = 'Undecipherable: Could not decrypt S/MIME body part';	 // code 493
  SIPTEXT_SERVER_INTERNAL_ERROR = 'Server Internal Error';	 // code 500
  SIPTEXT_NOT_IMPLEMENTED = 'Not Implemented: The SIP request method is not implemented here';	 // code 501
  SIPTEXT_BAD_GATEWAY = 'Bad Gateway';	 // code 502
  SIPTEXT_SERVICE_UNAVAILABLE = 'Service Unavailable';	 // code 503
  SIPTEXT_SERVER_TIME_OUT = 'Server Time-out';	 // code 504
  SIPTEXT_VERSION_NOT_SUPPORTED = 'Version Not Supported: The server does not support this version of the SIP protocol';	 // code 505
  SIPTEXT_MESSAGE_TOO_LARGE = 'Message Too Large';	 // code 513
  SIPTEXT_BUSY_EVERYWHERE = 'Busy Everywhere';	 // code 600
  SIPTEXT_DECLINE = 'Decline';	 // code 603
  SIPTEXT_DOES_NOT_EXIST_ANYWHERE = 'Does Not Exist Anywhere';	 // code 604
  SIPTEXT_NOT_ACCEPTABLE_2 = 'Not Acceptable';	 // code 606
  SIPTEXT_UNKNOWN = 'Unknown Code %d';

  ERRTXT_ECoreAlreadyInitialized          = 'Already Initialized';
  ERRTXT_ECoreNotInitialized              = 'Not Initialized';
  ERRTXT_ECoreSDKObjectNull               = 'SDK Object Null';
  ERRTXT_ECoreArgumentNull                = 'Argument Null';
  ERRTXT_ECoreInitializeWinsockFailure    = 'Initialize Winsock Failure';
  ERRTXT_ECoreUserNameAuthNameEmpty       = 'User Name Or Auth Name Empty';
  ERRTXT_ECoreInitiazeStackFailure        = 'Initialize Stack Failure';
  ERRTXT_ECorePortOutOfRange              = 'Port Out Of Range';
  ERRTXT_ECoreAddTcpTransportFailure      = 'Add Tcp Transport Failure';
  ERRTXT_ECoreAddTlsTransportFailure      = 'Add Tls Transport Failure';
  ERRTXT_ECoreAddUdpTransportFailure      = 'Add Udp Transport Failure';
  ERRTXT_ECoreMiniAudioPortOutOfRange     = 'Min Audio Port Out Of Range';
  ERRTXT_ECoreMaxAudioPortOutOfRange      = 'Max Audio Port Out Of Range';
  ERRTXT_ECoreMiniVideoPortOutOfRange     = 'Min Video Port Out Of Range';
  ERRTXT_ECoreMaxVideoPortOutOfRange      = 'Max Video Port Out Of Range';
  ERRTXT_ECoreMiniAudioPortNotEvenNumber  = 'Min Audio Port Not Even Number';
  ERRTXT_ECoreMaxAudioPortNotEvenNumber   = 'Max Audio Port Not Even Number';
  ERRTXT_ECoreMiniVideoPortNotEvenNumber  = 'Min Video Port Not Even Number';
  ERRTXT_ECoreMaxVideoPortNotEvenNumber   = 'Max Video Port Not Even Number';
  ERRTXT_ECoreAudioVideoPortOverlapped    = 'Audio Video Port Overlapped';
  ERRTXT_ECoreAudioVideoPortRangeTooSmall = 'Audio Video Port Range Too Small';
  ERRTXT_ECoreAlreadyRegistered           = 'Already Registered';
  ERRTXT_ECoreSIPServerEmpty              = 'SIP Server Empty';
  ERRTXT_ECoreExpiresValueTooSmall        = 'Expires Value Too Small';
  ERRTXT_ECoreCallIdNotFound              = 'Call Id Not Found';
  ERRTXT_ECoreNotRegistered               = 'Not Registered';
  ERRTXT_ECoreCalleeEmpty                 = 'Callee Empty';
  ERRTXT_ECoreInvalidUri                  = 'Invalid Uri';
  ERRTXT_ECoreAudioVideoCodecEmpty        = 'Audio Video Codec Empty';
  ERRTXT_ECoreNoFreeDialogSession         = 'No Free Dialog Session';
  ERRTXT_ECoreCreateAudioChannelFailed    = 'Create Audio Channel Failed';
  ERRTXT_ECoreSessionTimerValueTooSmall   = 'Session Timer Value Too Small';
  ERRTXT_ECoreAudioHandleNull             = 'Audio Handle Null';
  ERRTXT_ECoreVideoHandleNull             = 'Video Handle Null';
  ERRTXT_ECoreCallIsClosed                = 'Call Is Closed';
  ERRTXT_ECoreCallAlreadyHold             = 'Call Already Hold';
  ERRTXT_ECoreCallNotEstablished          = 'Call Not Established';
  ERRTXT_ECoreCallNotHold                 = 'Call Not Hold';
  ERRTXT_ECoreSipMessaegEmpty             = 'Sip Messaeg Empty';
  ERRTXT_ECoreSipHeaderNotExist           = 'Sip Header Not Exist';
  ERRTXT_ECoreSipHeaderValueEmpty         = 'Sip Header Value Empty';
  ERRTXT_ECoreSipHeaderBadFormed          = 'Sip Header Bad Formed';
  ERRTXT_ECoreBufferTooSmall              = 'Buffer Too Small';
  ERRTXT_ECoreSipHeaderValueListEmpty     = 'Sip Header Value List Empty';
  ERRTXT_ECoreSipHeaderParserEmpty        = 'Sip Header Parser Empty';
  ERRTXT_ECoreSipHeaderValueListNull      = 'Sip Header Value List Null';
  ERRTXT_ECoreSipHeaderNameEmpty          = 'Sip Header Name Empty';
  ERRTXT_ECoreAudioSampleNotmultiple      = 'Audio Sample Notmultiple';
  ERRTXT_ECoreAudioSampleOutOfRange       = 'Audio Sample Out Of Range';
  ERRTXT_ECoreInviteSessionNotFound       = 'Invite Session Not Found';
  ERRTXT_ECoreStackException              = 'Stack Exception';
  ERRTXT_ECoreMimeTypeUnknown             = 'Mime Type Unknown';
  ERRTXT_ECoreDataSizeTooLarge            = 'Data Size Too Large';
  ERRTXT_ECoreSessionNumsOutOfRange       = 'Session Nums Out Of Range';
  ERRTXT_ECoreNotSupportCallbackMode      = 'Not Support Callback Mode';
  ERRTXT_ECoreNotFoundSubscribeId         = 'Not Found Subscribe Id';
  ERRTXT_ECoreCodecNotSupport				      = 'Not Support Codec';
  ERRTXT_ECoreCodecParameterNotSupport		= 'Not Support Codec Parameter';
  ERRTEXT_UNKNOWN = 'Unknown Code %d';

  // audio                                // audio
  ERRTXT_EAudioFileNameEmpty              = 'File Name Empty';
  ERRTXT_EAudioChannelNotFound            = 'Channel Not Found';
  ERRTXT_EAudioStartRecordFailure         = 'Start Record Failure';
  ERRTXT_EAudioRegisterRecodingFailure    = 'Register Recoding Failure';
  ERRTXT_EAudioRegisterPlaybackFailure    = 'Register Playback Failure';
  ERRTXT_EAudioGetStatisticsFailure       = 'Get Statistics Failure';
  ERRTXT_EAudioIsPlaying                  = 'Is Playing';
  ERRTXT_EAudioPlayObjectNotExist         = 'Play Object Not Exist';
  ERRTXT_EAudioPlaySteamNotEnabled        = 'Play Stream Not Enabled';
  ERRTXT_EAudioRegisterCallbackFailure    = 'Register Callback Failure';

  // video                                // video
  ERRTXT_EVideoFileNameEmpty              = 'File Name Empty';
  ERRTXT_EVideoGetDeviceNameFailure       = 'Get Device Name Failure';
  ERRTXT_EVideoGetDeviceIdFailure         = 'Get Device Id Failure';
  ERRTXT_EVideoStartCaptureFailure        = 'Start Capture Failure';
  ERRTXT_EVideoChannelNotFound            = 'Channel Not Found';
  ERRTXT_EVideoStartSendFailure           = 'Start Send Failure';
  ERRTXT_EVideoGetStatisticsFailure       = 'Get Statistics Failure';
  ERRTXT_EVideoStartPlayAviFailure			  = 'Start Play Avi Failure';
  ERRTXT_EVideoSendAviFileFailure			    = 'Send Avi File Failure';

  // Device                               //  Device
  ERRTXT_EDeviceGetDeviceNameFailure      = 'Get Device Name Failure';



type
  TSIPTexts = class(TStringList)
  public
    function GetMessage(ID:integer):string;
    constructor create;
  end;

  TErrTexts = class(TStringList)
  public
    function GetMessage(ID:integer):string;
    constructor create;
  end;


  TSIPCodecs = class(TStringList)
  public
    function GetName(ID:integer):string;
    function GetID(const Name:string):integer;
  end;


  TSIPACodecs = class(TSIPCodecs)
  public
    constructor create;
  end;

  TSIPVCodecs = class(TSIPCodecs)
  public
    constructor create;
  end;


implementation

{ TSIPTexts }

constructor TSIPTexts.create;
begin
  inherited;
  AddObject(SIPTEXT_TRYING,Pointer(SIPCODE_TRYING));
  AddObject(SIPTEXT_RINGING,Pointer(SIPCODE_RINGING));
  AddObject(SIPTEXT_CALL_IS_BEING_FORWARDED,Pointer(SIPCODE_CALL_IS_BEING_FORWARDED));
  AddObject(SIPTEXT_QUEUED,Pointer(SIPCODE_QUEUED));
  AddObject(SIPTEXT_SESSION_PROGRESS,Pointer(SIPCODE_SESSION_PROGRESS));
  AddObject(SIPTEXT_OK,Pointer(SIPCODE_OK));
  AddObject(SIPTEXT_ACCEPTED,Pointer(SIPCODE_ACCEPTED));
  AddObject(SIPTEXT_MULTIPLE_CHOICES,Pointer(SIPCODE_MULTIPLE_CHOICES));
  AddObject(SIPTEXT_MOVED_PERMANENTLY,Pointer(SIPCODE_MOVED_PERMANENTLY));
  AddObject(SIPTEXT_MOVED_TEMPORARILY,Pointer(SIPCODE_MOVED_TEMPORARILY));
  AddObject(SIPTEXT_USE_PROXY,Pointer(SIPCODE_USE_PROXY));
  AddObject(SIPTEXT_ALTERNATIVE_SERVICE,Pointer(SIPCODE_ALTERNATIVE_SERVICE));
  AddObject(SIPTEXT_BAD_REQUEST,Pointer(SIPCODE_BAD_REQUEST));
  AddObject(SIPTEXT_UNAUTHORIZED,Pointer(SIPCODE_UNAUTHORIZED));
  AddObject(SIPTEXT_PAYMENT_REQUIRED,Pointer(SIPCODE_PAYMENT_REQUIRED));
  AddObject(SIPTEXT_FORBIDDEN,Pointer(SIPCODE_FORBIDDEN));
  AddObject(SIPTEXT_NOT_FOUND,Pointer(SIPCODE_NOT_FOUND));
  AddObject(SIPTEXT_METHOD_NOT_ALLOWED,Pointer(SIPCODE_METHOD_NOT_ALLOWED));
  AddObject(SIPTEXT_NOT_ACCEPTABLE,Pointer(SIPCODE_NOT_ACCEPTABLE));
  AddObject(SIPTEXT_PROXY_AUTHENTICATION_REQUIRED,Pointer(SIPCODE_PROXY_AUTHENTICATION_REQUIRED));
  AddObject(SIPTEXT_REQUEST_TIMEOUT,Pointer(SIPCODE_REQUEST_TIMEOUT));
  AddObject(SIPTEXT_CONFLICT,Pointer(SIPCODE_CONFLICT));
  AddObject(SIPTEXT_GONE,Pointer(SIPCODE_GONE));
  AddObject(SIPTEXT_REQUEST_ENTITY_TOO_LARGE,Pointer(SIPCODE_REQUEST_ENTITY_TOO_LARGE));
  AddObject(SIPTEXT_REQUEST_URI_TOO_LONG,Pointer(SIPCODE_REQUEST_URI_TOO_LONG));
  AddObject(SIPTEXT_UNSUPPORTED_MEDIA_TYPE,Pointer(SIPCODE_UNSUPPORTED_MEDIA_TYPE));
  AddObject(SIPTEXT_UNSUPPORTED_URI_SCHEME,Pointer(SIPCODE_UNSUPPORTED_URI_SCHEME));
  AddObject(SIPTEXT_BAD_EXTENSION,Pointer(SIPCODE_BAD_EXTENSION));
  AddObject(SIPTEXT_EXTENSION_REQUIRED,Pointer(SIPCODE_EXTENSION_REQUIRED));
  AddObject(SIPTEXT_SESSION_INTERVAL_TOO_SMALL,Pointer(SIPCODE_SESSION_INTERVAL_TOO_SMALL));
  AddObject(SIPTEXT_INTERVAL_TOO_BRIEF,Pointer(SIPCODE_INTERVAL_TOO_BRIEF));
  AddObject(SIPTEXT_TEMPORARILY_UNAVAILABLE,Pointer(SIPCODE_TEMPORARILY_UNAVAILABLE));
  AddObject(SIPTEXT_TRANSACTION_DOES_NOT_EXIST,Pointer(SIPCODE_TRANSACTION_DOES_NOT_EXIST));
  AddObject(SIPTEXT_LOOP_DETECTED,Pointer(SIPCODE_LOOP_DETECTED));
  AddObject(SIPTEXT_TOO_MANY_HOPS,Pointer(SIPCODE_TOO_MANY_HOPS));
  AddObject(SIPTEXT_ADDRESS_INCOMPLETE,Pointer(SIPCODE_ADDRESS_INCOMPLETE));
  AddObject(SIPTEXT_AMBIGUOUS,Pointer(SIPCODE_AMBIGUOUS));
  AddObject(SIPTEXT_BUSY_HERE,Pointer(SIPCODE_BUSY_HERE));
  AddObject(SIPTEXT_REQUEST_TERMINATED,Pointer(SIPCODE_REQUEST_TERMINATED));
  AddObject(SIPTEXT_NOT_ACCEPTABLE_HERE,Pointer(SIPCODE_NOT_ACCEPTABLE_HERE));
  AddObject(SIPTEXT_REQUEST_PENDING,Pointer(SIPCODE_REQUEST_PENDING));
  AddObject(SIPTEXT_UNDECIPHERABLE,Pointer(SIPCODE_UNDECIPHERABLE));
  AddObject(SIPTEXT_SERVER_INTERNAL_ERROR,Pointer(SIPCODE_SERVER_INTERNAL_ERROR));
  AddObject(SIPTEXT_NOT_IMPLEMENTED,Pointer(SIPCODE_NOT_IMPLEMENTED));
  AddObject(SIPTEXT_BAD_GATEWAY,Pointer(SIPCODE_BAD_GATEWAY));
  AddObject(SIPTEXT_SERVICE_UNAVAILABLE,Pointer(SIPCODE_SERVICE_UNAVAILABLE));
  AddObject(SIPTEXT_SERVER_TIME_OUT,Pointer(SIPCODE_SERVER_TIME_OUT));
  AddObject(SIPTEXT_VERSION_NOT_SUPPORTED,Pointer(SIPCODE_VERSION_NOT_SUPPORTED));
  AddObject(SIPTEXT_MESSAGE_TOO_LARGE,Pointer(SIPCODE_MESSAGE_TOO_LARGE));
  AddObject(SIPTEXT_BUSY_EVERYWHERE,Pointer(SIPCODE_BUSY_EVERYWHERE));
  AddObject(SIPTEXT_DECLINE,Pointer(SIPCODE_DECLINE));
  AddObject(SIPTEXT_DOES_NOT_EXIST_ANYWHERE,Pointer(SIPCODE_DOES_NOT_EXIST_ANYWHERE));
  AddObject(SIPTEXT_NOT_ACCEPTABLE_2,Pointer(SIPCODE_NOT_ACCEPTABLE_2));
end;


function TSIPTexts.GetMessage(ID: integer): string;
var
  ThisIndex:integer;
begin
  ThisIndex:=IndexofObject(Pointer(ID));
  if ThisIndex>=0 then
    result:=strings[ThisIndex]
  else
    result:=Format(SIPTEXT_UNKNOWN, [ID]);
end;

{ TSIPCodecs }

function TSIPCodecs.GetID(const Name: string): integer;
var
  index:integer;
begin
  index:=IndexOf(Name);
  if index>=0 then
    result:=integer(Objects[index])
  else
    result:=-1;
end;

function TSIPCodecs.GetName(ID: integer): string;
var
  ThisIndex:integer;
begin
  ThisIndex:=IndexofObject(Pointer(ID));
  if ThisIndex>=0 then
    result:=strings[ThisIndex]
  else
    result:=Format(SIPCODEC_UNKNOWN,[ID]);
end;

{ TSIPACodecs }

constructor TSIPACodecs.create;
begin
  inherited;
  AddObject(SIPAUDIO_PCMA,Pointer(AUDIOCODEC_PCMA));
  AddObject(SIPAUDIO_PCMU,Pointer(AUDIOCODEC_PCMU));
  AddObject(SIPAUDIO_G729,Pointer(AUDIOCODEC_G729));
  AddObject(SIPAUDIO_G723,Pointer(AUDIOCODEC_G723));
  AddObject(SIPAUDIO_ILBC,Pointer(AUDIOCODEC_ILBC));
  AddObject(SIPAUDIO_GSM,Pointer(AUDIOCODEC_GSM));
  AddObject(SIPAUDIO_DTMF,Pointer(AUDIOCODEC_DTMF));
  AddObject(SIPAUDIO_G722,Pointer(AUDIOCODEC_G722));
  AddObject(SIPAUDIO_AMR,Pointer(AUDIOCODEC_AMR));
  AddObject(SIPAUDIO_AMRWB,Pointer(AUDIOCODEC_AMRWB));
  AddObject(SIPAUDIO_G7221,Pointer(AUDIOCODEC_G7221));
  AddObject(SIPAUDIO_SPEEX,Pointer(AUDIOCODEC_SPEEX));
  AddObject(SIPAUDIO_SPEEXWB,Pointer(AUDIOCODEC_SPEEXWB));
  AddObject(SIPAUDIO_ISACWB,Pointer(AUDIOCODEC_ISACWB));
  AddObject(SIPAUDIO_ISACSWB,Pointer(AUDIOCODEC_ISACSWB));
end;

{ TSIPVCodecs }

constructor TSIPVCodecs.create;
begin
  inherited;
  AddObject(SIPVIDEO_I420,Pointer(VIDEOCODEC_I420));
  AddObject(SIPVIDEO_H263,Pointer(VIDEOCODEC_H263));
  AddObject(SIPVIDEO_H263_1998,Pointer(VIDEOCODEC_H263_1998));
  AddObject(SIPVIDEO_H264,Pointer(VIDEOCODEC_H264));
  AddObject(SIPVIDEO_VP8,Pointer(VIDEOCODEC_VP8));
end;

{ TErrTexts }

constructor TErrTexts.create;
begin
  inherited;
  AddObject(ERRTXT_ECoreAlreadyInitialized,Pointer(ECoreAlreadyInitialized));
  AddObject(ERRTXT_ECoreNotInitialized,Pointer(ECoreNotInitialized));
  AddObject(ERRTXT_ECoreSDKObjectNull,Pointer(ECoreSDKObjectNull));
  AddObject(ERRTXT_ECoreArgumentNull,Pointer(ECoreArgumentNull));
  AddObject(ERRTXT_ECoreInitializeWinsockFailure,Pointer(ECoreInitializeWinsockFailure));
  AddObject(ERRTXT_ECoreUserNameAuthNameEmpty,Pointer(ECoreUserNameAuthNameEmpty));
  AddObject(ERRTXT_ECoreInitiazeStackFailure,Pointer(ECoreInitiazeStackFailure));
  AddObject(ERRTXT_ECorePortOutOfRange,Pointer(ECorePortOutOfRange));
  AddObject(ERRTXT_ECoreAddTcpTransportFailure,Pointer(ECoreAddTcpTransportFailure));
  AddObject(ERRTXT_ECoreAddTlsTransportFailure,Pointer(ECoreAddTlsTransportFailure));
  AddObject(ERRTXT_ECoreAddUdpTransportFailure,Pointer(ECoreAddUdpTransportFailure));
  AddObject(ERRTXT_ECoreMiniAudioPortOutOfRange,Pointer(ECoreMiniAudioPortOutOfRange));
  AddObject(ERRTXT_ECoreMaxAudioPortOutOfRange,Pointer(ECoreMaxAudioPortOutOfRange));
  AddObject(ERRTXT_ECoreMiniVideoPortOutOfRange,Pointer(ECoreMiniVideoPortOutOfRange));
  AddObject(ERRTXT_ECoreMaxVideoPortOutOfRange,Pointer(ECoreMaxVideoPortOutOfRange));
  AddObject(ERRTXT_ECoreMiniAudioPortNotEvenNumber,Pointer(ECoreMiniAudioPortNotEvenNumber));
  AddObject(ERRTXT_ECoreMaxAudioPortNotEvenNumber,Pointer(ECoreMaxAudioPortNotEvenNumber));
  AddObject(ERRTXT_ECoreMiniVideoPortNotEvenNumber,Pointer(ECoreMiniVideoPortNotEvenNumber));
  AddObject(ERRTXT_ECoreMaxVideoPortNotEvenNumber,Pointer(ECoreMaxVideoPortNotEvenNumber));
  AddObject(ERRTXT_ECoreAudioVideoPortOverlapped,Pointer(ECoreAudioVideoPortOverlapped));
  AddObject(ERRTXT_ECoreAudioVideoPortRangeTooSmall,Pointer(ECoreAudioVideoPortRangeTooSmall));
  AddObject(ERRTXT_ECoreAlreadyRegistered,Pointer(ECoreAlreadyRegistered));
  AddObject(ERRTXT_ECoreSIPServerEmpty,Pointer(ECoreSIPServerEmpty));
  AddObject(ERRTXT_ECoreExpiresValueTooSmall,Pointer(ECoreExpiresValueTooSmall));
  AddObject(ERRTXT_ECoreCallIdNotFound,Pointer(ECoreCallIdNotFound));
  AddObject(ERRTXT_ECoreNotRegistered,Pointer(ECoreNotRegistered));
  AddObject(ERRTXT_ECoreCalleeEmpty,Pointer(ECoreCalleeEmpty));
  AddObject(ERRTXT_ECoreInvalidUri,Pointer(ECoreInvalidUri));
  AddObject(ERRTXT_ECoreAudioVideoCodecEmpty,Pointer(ECoreAudioVideoCodecEmpty));
  AddObject(ERRTXT_ECoreNoFreeDialogSession,Pointer(ECoreNoFreeDialogSession));
  AddObject(ERRTXT_ECoreCreateAudioChannelFailed,Pointer(ECoreCreateAudioChannelFailed));
  AddObject(ERRTXT_ECoreSessionTimerValueTooSmall,Pointer(ECoreSessionTimerValueTooSmall));
  AddObject(ERRTXT_ECoreAudioHandleNull,Pointer(ECoreAudioHandleNull));
  AddObject(ERRTXT_ECoreVideoHandleNull,Pointer(ECoreVideoHandleNull));
  AddObject(ERRTXT_ECoreCallIsClosed,Pointer(ECoreCallIsClosed));
  AddObject(ERRTXT_ECoreCallAlreadyHold,Pointer(ECoreCallAlreadyHold));
  AddObject(ERRTXT_ECoreCallNotEstablished,Pointer(ECoreCallNotEstablished));
  AddObject(ERRTXT_ECoreCallNotHold,Pointer(ECoreCallNotHold));
  AddObject(ERRTXT_ECoreSipMessaegEmpty,Pointer(ECoreSipMessaegEmpty));
  AddObject(ERRTXT_ECoreSipHeaderNotExist,Pointer(ECoreSipHeaderNotExist));
  AddObject(ERRTXT_ECoreSipHeaderValueEmpty,Pointer(ECoreSipHeaderValueEmpty));
  AddObject(ERRTXT_ECoreSipHeaderBadFormed,Pointer(ECoreSipHeaderBadFormed));
  AddObject(ERRTXT_ECoreBufferTooSmall,Pointer(ECoreBufferTooSmall));
  AddObject(ERRTXT_ECoreSipHeaderValueListEmpty,Pointer(ECoreSipHeaderValueListEmpty));
  AddObject(ERRTXT_ECoreSipHeaderParserEmpty,Pointer(ECoreSipHeaderParserEmpty));
  AddObject(ERRTXT_ECoreSipHeaderValueListNull,Pointer(ECoreSipHeaderValueListNull));
  AddObject(ERRTXT_ECoreSipHeaderNameEmpty,Pointer(ECoreSipHeaderNameEmpty));
  AddObject(ERRTXT_ECoreAudioSampleNotmultiple,Pointer(ECoreAudioSampleNotmultiple));
  AddObject(ERRTXT_ECoreAudioSampleOutOfRange,Pointer(ECoreAudioSampleOutOfRange));
  AddObject(ERRTXT_ECoreInviteSessionNotFound,Pointer(ECoreInviteSessionNotFound));
  AddObject(ERRTXT_ECoreStackException,Pointer(ECoreStackException));
  AddObject(ERRTXT_ECoreMimeTypeUnknown,Pointer(ECoreMimeTypeUnknown));
  AddObject(ERRTXT_ECoreDataSizeTooLarge,Pointer(ECoreDataSizeTooLarge));
  AddObject(ERRTXT_ECoreSessionNumsOutOfRange,Pointer(ECoreSessionNumsOutOfRange));
  AddObject(ERRTXT_ECoreNotSupportCallbackMode,Pointer(ECoreNotSupportCallbackMode));
  AddObject(ERRTXT_ECoreNotFoundSubscribeId,Pointer(ECoreNotFoundSubscribeId));
  AddObject(ERRTXT_ECoreCodecNotSupport,Pointer(ECoreCodecNotSupport));
  AddObject(ERRTXT_ECoreCodecParameterNotSupport,Pointer(ECoreCodecParameterNotSupport));
  AddObject(ERRTXT_EAudioFileNameEmpty,Pointer(EAudioFileNameEmpty));
  AddObject(ERRTXT_EAudioChannelNotFound,Pointer(EAudioChannelNotFound));
  AddObject(ERRTXT_EAudioStartRecordFailure,Pointer(EAudioStartRecordFailure));
  AddObject(ERRTXT_EAudioRegisterRecodingFailure,Pointer(EAudioRegisterRecodingFailure));
  AddObject(ERRTXT_EAudioRegisterPlaybackFailure,Pointer(EAudioRegisterPlaybackFailure));
  AddObject(ERRTXT_EAudioGetStatisticsFailure,Pointer(EAudioGetStatisticsFailure));
  AddObject(ERRTXT_EAudioIsPlaying,Pointer(EAudioIsPlaying));
  AddObject(ERRTXT_EAudioPlayObjectNotExist,Pointer(EAudioPlayObjectNotExist));
  AddObject(ERRTXT_EAudioPlaySteamNotEnabled,Pointer(EAudioPlaySteamNotEnabled));
  AddObject(ERRTXT_EAudioRegisterCallbackFailure,Pointer(EAudioRegisterCallbackFailure));
  AddObject(ERRTXT_EVideoFileNameEmpty,Pointer(EVideoFileNameEmpty));
  AddObject(ERRTXT_EVideoGetDeviceNameFailure,Pointer(EVideoGetDeviceNameFailure));
  AddObject(ERRTXT_EVideoGetDeviceIdFailure,Pointer(EVideoGetDeviceIdFailure));
  AddObject(ERRTXT_EVideoStartCaptureFailure,Pointer(EVideoStartCaptureFailure));
  AddObject(ERRTXT_EVideoChannelNotFound,Pointer(EVideoChannelNotFound));
  AddObject(ERRTXT_EVideoStartSendFailure,Pointer(EVideoStartSendFailure));
  AddObject(ERRTXT_EVideoGetStatisticsFailure,Pointer(EVideoGetStatisticsFailure));
  AddObject(ERRTXT_EVideoStartPlayAviFailure,Pointer(EVideoStartPlayAviFailure));
  AddObject(ERRTXT_EVideoSendAviFileFailure,Pointer(EVideoSendAviFileFailure));
  AddObject(ERRTXT_EDeviceGetDeviceNameFailure,Pointer(EDeviceGetDeviceNameFailure));
end;

function TErrTexts.GetMessage(ID: integer): string;
var
  ThisIndex:integer;
begin
  ThisIndex:=IndexofObject(Pointer(ID));
  if ThisIndex>=0 then
    result:=strings[ThisIndex]
  else
    result:=Format(SIPCODEC_UNKNOWN,[ID]);
end;

end.
