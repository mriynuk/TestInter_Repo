object Form4: TForm4
  Left = 540
  Top = 263
  BorderStyle = bsSingle
  Caption = 'SIP P2P Test Client'
  ClientHeight = 447
  ClientWidth = 693
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
  object Label6: TLabel
    Left = 0
    Top = 30
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
    Left = 261
    Top = 50
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
    Left = 293
    Top = 326
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
    Left = 293
    Top = 354
    Width = 94
    Height = 22
    AllowAllUp = True
    GroupIndex = 1
    Caption = 'Auto Answer'
  end
  object ConSpBtn: TSpeedButton
    Left = 293
    Top = 382
    Width = 94
    Height = 22
    AllowAllUp = True
    GroupIndex = 3
    Caption = 'Conference'
    OnClick = ConSpBtnClick
  end
  object SpLine1: TSpeedButton
    Left = 0
    Top = 424
    Width = 81
    Height = 22
    GroupIndex = 9
    Caption = 'Line 1'
    OnClick = SpLine1Click
  end
  object SpLine2: TSpeedButton
    Left = 87
    Top = 424
    Width = 81
    Height = 22
    GroupIndex = 9
    Caption = 'Line 2'
    OnClick = SpLine2Click
  end
  object SpLine3: TSpeedButton
    Left = 174
    Top = 424
    Width = 81
    Height = 22
    GroupIndex = 9
    Caption = 'Line 3'
    OnClick = SpLine3Click
  end
  object SpLine4: TSpeedButton
    Left = 261
    Top = 424
    Width = 81
    Height = 22
    GroupIndex = 9
    Caption = 'Line 4'
    OnClick = SpLine4Click
  end
  object SpLine5: TSpeedButton
    Left = 348
    Top = 424
    Width = 81
    Height = 22
    GroupIndex = 9
    Caption = 'Line 5'
    OnClick = SpLine5Click
  end
  object SpLine6: TSpeedButton
    Left = 435
    Top = 424
    Width = 81
    Height = 22
    GroupIndex = 9
    Caption = 'Line 6'
    OnClick = SpLine6Click
  end
  object SpLine7: TSpeedButton
    Left = 522
    Top = 424
    Width = 81
    Height = 22
    GroupIndex = 9
    Caption = 'Line 7'
    OnClick = SpLine7Click
  end
  object SpLine8: TSpeedButton
    Left = 609
    Top = 424
    Width = 81
    Height = 22
    GroupIndex = 9
    Caption = 'Line 8'
    OnClick = SpLine8Click
  end
  object ImageSpeaker: TImage
    Left = 0
    Top = -1
    Width = 25
    Height = 25
    AutoSize = True
    Center = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000190000
      00190806000000C4E98563000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B000000
      06624B474400FF00FF00FFA0BDA7930000024A4944415478DAE595B14BEA5114
      C7BF424AA8A9E9904DD2E2A408A2836BFE0192052229093A86084260680A2929
      B4B91AA954838BE21FA0E0E0A08310BA3BAA69A9290622EFBD7B412DF3F5340B
      827796DFEFDEF3E37C7EE77CEF3997F1EB8FE19B8DF1FF42AEAEAE60B55AE7FA
      BADD2E783CDE6A90B5B535381C0E5C5E5EBEF3753A1D080402389DCE77FE8521
      2291088F8F8FF0F97CF07ABD73BF512A9528954A28140A50ABD5CB418442219E
      9E9EE8FB2CA45EAF432C16A3DD6E83CFE783C160D0FDD76129A4D7EBA1D96CD2
      72BC362E970BA9548A878787C9DE2CA4D168606B6B0BEBEBEB180C06B8BDBD85
      C964C2DDDD1D8C46E314120C06E172B916D2650C21E0FDFD7DE47239A4D369E8
      743A5C5F5FC362B1D06C241209AAD5EA14120E8761B7DB97829C9D9DE1FCFC7C
      1298C562D1CC896E641D8BC52625FB348418394DCFCFCF188D46F0783CF0FBFD
      34703299845EAF473E9F8746A3590D322E33099CCD66B1BBBB8B72B90C0E8783
      9D9D9D69F95681241209180C06AA0F396532998C6A2497CBB1B9B90912F7F8F8
      7835C8C5C5054E4F4F6926994C065AAD16954A056C36FBEB32D9D8D8C0CBCB0B
      86C321DC6E370281C0D76A320E1A8D4671747404269349E756ABD5A2EB783CFE
      F6747DA64FC8513D3838A0654AA552D8DBDBA381CD66F3FC3E59A5E36BB51AB6
      B7B7A90EFD7E1F37373714449E87878753C8BFFEFEA3D9351E2B64CC138DFE3A
      BB1629D3225358A150E0FEFE1EC562112A956A7908B18FEE133285496F9C9C9C
      20140ABDF12D7D33462211D86CB6B93EA209E9F659FB9977FC8F85FC066CB1AA
      C5DE5E62370000000049454E44AE426082}
    PopupMenu = PopupMenuSpeak
    OnMouseDown = ImageSpeakerMouseDown
  end
  object ImageMic: TImage
    Left = 219
    Top = -1
    Width = 25
    Height = 25
    AutoSize = True
    Center = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000190000
      00190806000000C4E985630000000467414D410000B18F0BFC61050000000970
      48597300000EC400000EC401952B0E1B0000001874455874536F667477617265
      005061696E742E4E45542076332E3232B791177D000002A84944415478DAB595
      BD4BB26114C62F33D314FB300B1B24086CA95D1A7216822068C916492583966A
      883E0821FA07B44224720843873E401CA2702970D0C9906A0843E9FBC306C1D4
      EC7DDF732078A7F231BDA687FB79EEFB77EE73AE731ED19F7F428D252A17F2F4
      F4848D8D0DBCBDBDC16030607878B8BA909D9D1D8C8D8D41A150A0AEAE0ED96C
      16BDBDBD383B3BAB0EE4F5F5156D6D6DD068340CF87FDD6AB5C2E572FD1E3235
      3585F5F57548241228954A48A552067C7C7CA0542AA19C6CFF08A183EEEEEEF8
      36E3E3E3383838C0E5E525643219C46231AFFF1AB2B2B282E5E5657E6E6A6A42
      6363231E1F1FF906F5F5F528168B95433C1E0FDADBDBD945E4A89696168C8E8E
      627F7F1FD7D7D79C3ABA2581CD6633363737192A08D2D7D7875C2E079D4E87DB
      DB5B343434E0E6E68623EFECECE40309D2D3D383DDDD5D3C3C3CA0A3A34318E4
      EAEA0AABABAB703A9D5C87D6D656ACADADE1F4F494A326A7C9E572F4F7F76372
      721281404078BAD2E934E6E7E731373707BFDF8FE6E666ECEDEDE1FCFC1CD3D3
      D30CA1DB994C26381C0E6C6D6D0987A452292C2D2DC166B3C1EBF532241C0E33
      7C6464842D4D200A64717191BF110C492693EC2CBD5E0FBBDDCE85A71EA183DF
      DFDFB91E854281C7CDC4C4047C3E9F700849AD56E3F9F9192291888BFAE51EDA
      4285A659F6F2F2C2EFA8FB2B82905DB7B7B7E176BBD1D5D5C5D113885C67B158
      D808DDDDDDECBEEFF46333CECECEE2E2E202A15008272727B8BFBFC7D0D010E2
      F13806060638753FA9AC297C7C7CCC0D473D43910783410C0E0E7E5B6CC1902F
      1D1E1E626666068944A2DC2DC221D168140B0B0B383A3AAA0D24128920168B71
      B753E39111C87D5585188D469E59344AC84D6459AA4B5521D49CF97C1E994C06
      5AAD162A958A81558590084216A654099120C8E7E727FF766930D60C52A9FE02
      274183C563D9C2250000000049454E44AE426082}
    PopupMenu = PopupMenuMic
    OnMouseDown = ImageMicMouseDown
  end
  object ListBoxLog: TMemo
    Left = 420
    Top = 191
    Width = 270
    Height = 227
    ReadOnly = True
    TabOrder = 0
  end
  object ComboBoxSpeaker: TComboBox
    Left = 161
    Top = 23
    Width = 23
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    Visible = False
    OnChange = ComboBoxSpeakerChange
  end
  object ComboBoxMicrophone: TComboBox
    Left = 190
    Top = 23
    Width = 23
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    Visible = False
    OnChange = ComboBoxMicrophoneChange
  end
  object TrackBarSpeaker: TTrackBar
    Left = 24
    Top = -1
    Width = 189
    Height = 25
    Ctl3D = True
    Max = 255
    ParentCtl3D = False
    Frequency = 100
    TabOrder = 4
    TickStyle = tsNone
    OnChange = TrackBarSpeakerChange
  end
  object TrackBarMicrophone: TTrackBar
    Left = 246
    Top = -1
    Width = 183
    Height = 25
    Ctl3D = True
    Max = 255
    ParentCtl3D = False
    Frequency = 100
    TabOrder = 1
    TickStyle = tsNone
    OnChange = TrackBarMicrophoneChange
  end
  object ClearBtn: TButton
    Left = 605
    Top = 160
    Width = 85
    Height = 25
    Caption = 'Clear Log'
    TabOrder = 5
    OnClick = ClearBtnClick
  end
  object CallBtn: TButton
    Left = 261
    Top = 72
    Width = 153
    Height = 110
    Caption = 'Call'
    TabOrder = 6
    OnClick = CallBtnClick
  end
  object AnswBtn: TButton
    Left = 261
    Top = 188
    Width = 153
    Height = 25
    Caption = 'Answer'
    TabOrder = 7
    OnClick = AnswBtnClick
  end
  object HungUpBtn: TButton
    Left = 261
    Top = 219
    Width = 153
    Height = 25
    Caption = 'Hung up'
    TabOrder = 8
    OnClick = HungUpBtnClick
  end
  object HoldBtn: TButton
    Left = 261
    Top = 250
    Width = 72
    Height = 25
    Caption = 'Hold'
    TabOrder = 9
    OnClick = HoldBtnClick
  end
  object UnHoldBtn: TButton
    Left = 339
    Top = 250
    Width = 75
    Height = 25
    Caption = 'UnHold'
    TabOrder = 10
    OnClick = UnHoldBtnClick
  end
  object ListBox1: TListBox
    Left = 0
    Top = 50
    Width = 255
    Height = 346
    Style = lbOwnerDrawVariable
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 30
    ParentFont = False
    TabOrder = 11
    OnClick = ListBox1Click
  end
  object PlayFileEdit: TEdit
    Left = 420
    Top = 65
    Width = 270
    Height = 21
    TabOrder = 12
    Visible = False
  end
  object PlayFileBtn: TButton
    Left = 420
    Top = 92
    Width = 270
    Height = 25
    Caption = 'Play file to remote'
    TabOrder = 13
    Visible = False
    OnClick = PlayFileBtnClick
  end
  object RecConversationBtn: TButton
    Left = 420
    Top = 129
    Width = 270
    Height = 25
    Caption = 'Record Conversation'
    TabOrder = 14
    OnClick = RecConversationBtnClick
  end
  object StopRecordBtn: TButton
    Left = 420
    Top = 160
    Width = 85
    Height = 25
    Caption = 'Stop Recording'
    TabOrder = 15
    OnClick = StopRecordBtnClick
  end
  object RecBtn: TButton
    Left = 431
    Top = -1
    Width = 114
    Height = 25
    Caption = 'Record Message'
    TabOrder = 16
    Visible = False
    OnClick = RecBtnClick
  end
  object StopSaveBtn: TButton
    Left = 431
    Top = 30
    Width = 114
    Height = 25
    Caption = 'Stop and Save'
    TabOrder = 17
    Visible = False
    OnClick = StopSaveBtnClick
  end
  object AddUserBtn: TButton
    Left = 0
    Top = 402
    Width = 81
    Height = 16
    Caption = 'Add'
    TabOrder = 18
    OnClick = AddUserBtnClick
  end
  object RemoveUserBtn: TButton
    Left = 174
    Top = 402
    Width = 81
    Height = 16
    Caption = 'Remove'
    TabOrder = 19
    OnClick = RemoveUserBtnClick
  end
  object PopupMenuMic: TPopupMenu
    Alignment = paCenter
    AutoPopup = False
    MenuAnimation = [maRightToLeft]
    Left = 576
    Top = 8
  end
  object PopupMenuSpeak: TPopupMenu
    Alignment = paCenter
    AutoPopup = False
    MenuAnimation = [maRightToLeft]
    Left = 640
    Top = 5
  end
end
