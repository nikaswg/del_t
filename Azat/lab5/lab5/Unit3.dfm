object Form3: TForm3
  Left = 242
  Top = 160
  Width = 1044
  Height = 540
  Caption = 'Form3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object l1: TLabel
    Left = 16
    Top = 16
    Width = 181
    Height = 23
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1074#1077#1082#1090#1086#1088':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l3: TLabel
    Left = 13
    Top = 177
    Width = 432
    Height = 23
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1077#1085#1091#1083#1077#1074#1099#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1074#1077#1082#1090#1086#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bvlb: TBevel
    Left = 536
    Top = 92
    Width = 185
    Height = 161
  end
  object SG1: TStringGrid
    Left = 16
    Top = 56
    Width = 481
    Height = 105
    TabOrder = 0
  end
  object e1: TEdit
    Left = 16
    Top = 216
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object btnbaton21: TBitBtn
    Left = 544
    Top = 180
    Width = 171
    Height = 73
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Kind = bkClose
  end
  object btnbaton22: TBitBtn
    Left = 544
    Top = 96
    Width = 169
    Height = 73
    Caption = 'Back'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnbaton22Click
  end
end
