object Form1: TForm1
  Left = 212
  Top = 272
  Width = 1044
  Height = 540
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = main
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClick = FormClick
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 696
    Top = 48
    Width = 140
    Height = 25
    Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object l2: TLabel
    Left = 48
    Top = 456
    Width = 670
    Height = 13
    Caption = 
      #1040#1093#1090#1091#1085#1075', '#1074#1074#1086#1076#1080#1090#1077' '#1074#1077#1097#1077#1089#1090#1074#1077#1085#1085#1099#1081' '#1084#1072#1089#1089#1080#1074' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1087#1091#1085#1082#1090#1072' "'#1057#1074#1086#1077' '#1079#1072#1076#1072 +
      #1085#1080#1077'", '#1074' '#1086#1089#1090#1072#1083#1100#1085#1099#1093' '#1089#1083#1091#1095#1072#1103#1093' '#1094#1077#1083#1086#1095#1080#1089#1083#1077#1085#1085#1099#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object btn1: TBitBtn
    Left = 384
    Top = 392
    Width = 137
    Height = 57
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Kind = bkClose
  end
  object SG: TStringGrid
    Left = 56
    Top = 200
    Width = 401
    Height = 89
    RowCount = 2
    TabOrder = 1
    Visible = False
  end
  object baton1: TBitBtn
    Left = 688
    Top = 160
    Width = 217
    Height = 65
    Caption = #1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = baton1Click
  end
  object baton2: TBitBtn
    Left = 688
    Top = 224
    Width = 217
    Height = 65
    Caption = #1047#1072#1087#1080#1089#1100' '#1074' '#1092#1072#1081#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = baton2Click
  end
  object baton3: TBitBtn
    Left = 688
    Top = 288
    Width = 217
    Height = 65
    Caption = #1063#1090#1077#1085#1080#1077' '#1080#1079' '#1092#1072#1081#1083#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = baton3Click
  end
  object ud1: TUpDown
    Left = 793
    Top = 96
    Width = 16
    Height = 21
    Associate = e1
    TabOrder = 5
    Visible = False
  end
  object e1: TEdit
    Left = 704
    Top = 96
    Width = 89
    Height = 21
    TabOrder = 6
    Text = '0'
    Visible = False
  end
  object main: TMainMenu
    Left = 32
    Top = 56
    object N1: TMenuItem
      Caption = #1057#1091#1084#1084#1072
      object N2: TMenuItem
        Caption = #1042#1089#1077#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
        OnClick = N2Click
      end
      object iN3: TMenuItem
        Caption = #1054#1090#1088#1080#1094#1072#1090#1077#1083#1100#1085#1099#1093
        OnClick = iN3Click
      end
      object N3: TMenuItem
        Caption = #1063#1077#1090#1085#1099#1093
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1053#1077#1095#1077#1090#1085#1099#1093
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1055#1086#1083#1086#1078#1080#1090#1077#1083#1100#1085#1099#1093
        OnClick = N5Click
      end
      object N101: TMenuItem
        Caption = '>10'
        OnClick = N101Click
      end
      object N102: TMenuItem
        Caption = '<10'
        OnClick = N102Click
      end
      object N6: TMenuItem
        Caption = '>'#1089#1088#1077#1076#1085#1077#1075#1086' '#1072#1088#1080#1092#1084'.'
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = '<'#1089#1088#1077#1076#1085#1077#1075#1086' '#1072#1088#1080#1092#1084'.'
        OnClick = N7Click
      end
    end
    object M: TMenuItem
      Caption = 'MIn(max) '#1101#1083'-'#1090
      object max1: TMenuItem
        Caption = 'max'
        OnClick = max1Click
      end
      object min1: TMenuItem
        Caption = 'min'
        OnClick = min1Click
      end
    end
    object Sort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object Strue: TMenuItem
        Caption = #1055#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
        OnClick = StrueClick
      end
      object Sreve: TMenuItem
        Caption = #1055#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
        OnClick = SreveClick
      end
    end
    object my: TMenuItem
      Caption = #1057#1074#1086#1077' '#1079#1072#1076#1072#1085#1080#1077
      object mine: TMenuItem
        Caption = #1047#1072#1076#1072#1080#1085#1077' '#8470'1'
        OnClick = mineClick
      end
    end
    object Exit: TMenuItem
      Caption = #1042#1099#1093#1086#1076
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 584
    Top = 40
  end
  object SaveDialog1: TSaveDialog
    Left = 528
    Top = 48
  end
end
