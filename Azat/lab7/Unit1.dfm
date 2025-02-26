object Form1: TForm1
  Left = 237
  Top = 256
  Align = alClient
  BorderStyle = bsDialog
  BorderWidth = 1
  Caption = 'Form1'
  ClientHeight = 600
  ClientWidth = 1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = [fsItalic]
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 23
  object l1: TLabel
    Left = 48
    Top = 8
    Width = 195
    Height = 33
    Caption = #1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l2: TLabel
    Left = 488
    Top = 8
    Width = 331
    Height = 33
    Caption = #1042#1099#1074#1086#1076' '#1091#1089#1083#1086#1074#1080#1103' '#1079#1072#1076#1072#1095#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l3: TLabel
    Left = 48
    Top = 248
    Width = 284
    Height = 33
    Caption = #1042#1099#1074#1086#1076' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object m1: TMemo
    Left = 48
    Top = 48
    Width = 313
    Height = 193
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 0
  end
  object m2: TMemo
    Left = 48
    Top = 280
    Width = 313
    Height = 193
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 1
  end
  object cb1: TComboBox
    Left = 488
    Top = 48
    Width = 193
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemHeight = 25
    ParentFont = False
    TabOrder = 2
    OnChange = cb1Change
    Items.Strings = (
      #1047#1072#1076#1072#1095#1072' 1'
      #1047#1072#1076#1072#1095#1072' 2')
  end
  object rg1: TRadioGroup
    Left = 488
    Top = 128
    Width = 185
    Height = 137
    Caption = #1047#1072#1076#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object txt1: TStaticText
    Left = 64
    Top = 488
    Width = 38
    Height = 23
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BorderStyle = sbsSunken
    Caption = 'txt1'
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object rb1: TRadioButton
    Left = 504
    Top = 168
    Width = 113
    Height = 17
    Caption = #1047#1072#1076#1072#1095#1072' 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = rb1Click
  end
  object rb2: TRadioButton
    Left = 504
    Top = 216
    Width = 113
    Height = 17
    Caption = #1047#1072#1076#1072#1095#1072' 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = rb2Click
  end
end
