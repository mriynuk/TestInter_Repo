object Form4: TForm4
  Left = 540
  Top = 263
  BorderStyle = bsSingle
  Caption = 'SIP P2P Test Client'
  ClientHeight = 432
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 254
    Top = 58
    Width = 55
    Height = 13
    Caption = 'Microphone'
  end
  object Label2: TLabel
    Left = 254
    Top = 31
    Width = 39
    Height = 13
    Caption = 'Speaker'
  end
  object Label3: TLabel
    Left = 481
    Top = 83
    Width = 28
    Height = 13
    Caption = 'Lines:'
  end
  object Label4: TLabel
    Left = 481
    Top = 160
    Width = 29
    Height = 13
  end
  object Label5: TLabel
    Left = 254
    Top = 363
    Width = 44
    Height = 13
    Caption = 'LocalPort'
  end
  object Label6: TLabel
    Left = 0
    Top = 8
    Width = 41
    Height = 16
    Caption = 'Users :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object CallLabel: TLabel
    Left = 254
    Top = 8
    Width = 51
    Height = 16
    Caption = 'CallLabel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DNDSpBtn: TSpeedButton
    Left = 374
    Top = 294
    Width = 94
    Height = 22
    Cursor = crHandPoint
    AllowAllUp = True
    GroupIndex = 1
    Caption = 'Do not disturbe'
    Layout = blGlyphBottom
    OnClick = DNDSpBtnClick
  end
  object AASpBtn: TSpeedButton
    Left = 374
    Top = 322
    Width = 94
    Height = 22
    AllowAllUp = True
    GroupIndex = 2
    Caption = 'Auto Answer'
  end
  object ConSpBtn: TSpeedButton
    Left = 374
    Top = 350
    Width = 94
    Height = 22
    AllowAllUp = True
    GroupIndex = 3
    Caption = 'Conference'
    OnClick = ConSpBtnClick
  end
  object SpLine1: TSpeedButton
    Left = 0
    Top = 409
    Width = 81
    Height = 22
    AllowAllUp = True
    GroupIndex = 9
    Caption = 'Line 1'
    OnClick = SpLine1Click
  end
  object SpLine2: TSpeedButton
    Left = 87
    Top = 409
    Width = 81
    Height = 22
    AllowAllUp = True
    GroupIndex = 9
    Caption = 'Line 2'
    OnClick = SpLine2Click
  end
  object SpLine3: TSpeedButton
    Left = 174
    Top = 409
    Width = 81
    Height = 22
    AllowAllUp = True
    GroupIndex = 9
    Caption = 'Line 3'
    OnClick = SpLine3Click
  end
  object SpLine4: TSpeedButton
    Left = 261
    Top = 409
    Width = 81
    Height = 22
    AllowAllUp = True
    GroupIndex = 9
    Caption = 'Line 4'
    OnClick = SpLine4Click
  end
  object SpLine5: TSpeedButton
    Left = 348
    Top = 409
    Width = 81
    Height = 22
    AllowAllUp = True
    GroupIndex = 9
    Caption = 'Line 5'
    OnClick = SpLine5Click
  end
  object SpLine6: TSpeedButton
    Left = 435
    Top = 409
    Width = 81
    Height = 22
    AllowAllUp = True
    GroupIndex = 9
    Caption = 'Line 6'
    OnClick = SpLine6Click
  end
  object SpLine7: TSpeedButton
    Left = 522
    Top = 409
    Width = 81
    Height = 22
    AllowAllUp = True
    GroupIndex = 9
    Caption = 'Line 7'
    OnClick = SpLine7Click
  end
  object SpLine8: TSpeedButton
    Left = 609
    Top = 409
    Width = 81
    Height = 22
    AllowAllUp = True
    GroupIndex = 9
    Caption = 'Line 8'
    OnClick = SpLine8Click
  end
  object SpMute: TSpeedButton
    Left = 464
    Top = 55
    Width = 76
    Height = 22
    AllowAllUp = True
    GroupIndex = 4
    Caption = 'Mute'
    OnClick = SpMuteClick
  end
  object ListBoxLog: TMemo
    Left = 481
    Top = 191
    Width = 209
    Height = 212
    ReadOnly = True
    TabOrder = 0
  end
  object IniBtn: TButton
    Left = 481
    Top = 129
    Width = 105
    Height = 25
    Caption = 'Initialize'
    TabOrder = 1
    OnClick = IniBtnClick
  end
  object UnIniBtn: TButton
    Left = 600
    Top = 129
    Width = 90
    Height = 25
    Caption = 'Uninitialize'
    TabOrder = 2
    OnClick = UnIniBtnClick
  end
  object ComboBoxSpeaker: TComboBox
    Left = 481
    Top = 7
    Width = 201
    Height = 21
    Style = csDropDownList
    TabOrder = 3
  end
  object ComboBoxMicrophone: TComboBox
    Left = 481
    Top = 28
    Width = 201
    Height = 21
    Style = csDropDownList
    TabOrder = 4
  end
  object TrackBarSpeaker: TTrackBar
    Left = 304
    Top = 31
    Width = 154
    Height = 18
    Max = 255
    Frequency = 10
    TabOrder = 5
    OnChange = TrackBarSpeakerChange
  end
  object TrackBarMicrophone: TTrackBar
    Left = 304
    Top = 61
    Width = 154
    Height = 18
    Max = 255
    Frequency = 100
    TabOrder = 6
    OnChange = TrackBarMicrophoneChange
  end
  object ComboBoxLines: TComboBox
    Left = 481
    Top = 102
    Width = 209
    Height = 21
    Style = csDropDownList
    TabOrder = 7
    OnChange = ComboBoxLinesChange
    Items.Strings = (
      'LINE-1'
      'LINE-2'
      'LINE-3'
      'LINE-4'
      'LINE-5'
      'LINE-6'
      'LINE-7'
      'LINE-8')
  end
  object EditLocalPort: TEdit
    Left = 254
    Top = 382
    Width = 214
    Height = 21
    TabOrder = 8
    Text = '5060'
  end
  object ClearBtn: TButton
    Left = 615
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Clear Log'
    TabOrder = 9
    OnClick = ClearBtnClick
  end
  object CallBtn: TButton
    Left = 315
    Top = 85
    Width = 153
    Height = 110
    Caption = 'Call'
    TabOrder = 10
    OnClick = CallBtnClick
  end
  object AnswBtn: TButton
    Left = 315
    Top = 201
    Width = 153
    Height = 25
    Caption = 'Answer'
    TabOrder = 11
    OnClick = AnswBtnClick
  end
  object ChecMicMuteBox: TCheckBox
    Left = 254
    Top = 77
    Width = 55
    Height = 17
    Caption = 'Mute'
    TabOrder = 12
    OnClick = ChecMicMuteBoxClick
  end
  object CheckDND: TCheckBox
    Left = 254
    Top = 294
    Width = 97
    Height = 17
    Caption = 'Do not disturbe'
    TabOrder = 13
  end
  object CheckAA: TCheckBox
    Left = 254
    Top = 317
    Width = 97
    Height = 17
    Caption = 'Auto Answer'
    TabOrder = 14
  end
  object HungUpBtn: TButton
    Left = 315
    Top = 232
    Width = 153
    Height = 25
    Caption = 'Hung up'
    TabOrder = 15
    OnClick = HungUpBtnClick
  end
  object ConferenceCheckbox: TCheckBox
    Left = 254
    Top = 340
    Width = 97
    Height = 17
    Caption = 'Conference'
    TabOrder = 16
  end
  object HoldBtn: TButton
    Left = 315
    Top = 263
    Width = 72
    Height = 25
    Caption = 'Hold'
    TabOrder = 17
    OnClick = HoldBtnClick
  end
  object UnHoldBtn: TButton
    Left = 393
    Top = 263
    Width = 75
    Height = 25
    Caption = 'UnHold'
    TabOrder = 18
    OnClick = UnHoldBtnClick
  end
  object ListBox1: TListBox
    Left = 0
    Top = 22
    Width = 248
    Height = 390
    Style = lbOwnerDrawVariable
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 30
    ParentFont = False
    TabOrder = 19
    OnClick = ListBox1Click
  end
end
