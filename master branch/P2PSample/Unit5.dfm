object TestFrmNew: TTestFrmNew
  Left = 0
  Top = 0
  Caption = 'SIP Test From begining'
  ClientHeight = 289
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object IniBtn: TButton
    Left = 368
    Top = 113
    Width = 75
    Height = 25
    Caption = 'Initialize'
    TabOrder = 0
    OnClick = IniBtnClick
  end
  object Memo1: TMemo
    Left = 368
    Top = 144
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
end
