object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'LoRa Repeater Configuration Tool V1.0'
  ClientHeight = 559
  ClientWidth = 1112
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    1112
    559)
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 79
    Height = 19
    Alignment = taRightJustify
    Caption = 'Serial Port:'
  end
  object Label9: TLabel
    Left = 26
    Top = 512
    Width = 83
    Height = 19
    Alignment = taRightJustify
    Caption = 'Freq. Error:'
  end
  object Label10: TLabel
    Left = 231
    Top = 512
    Width = 90
    Height = 19
    Alignment = taRightJustify
    Caption = 'Packet RSSI:'
  end
  object Label11: TLabel
    Left = 459
    Top = 512
    Width = 36
    Height = 19
    Alignment = taRightJustify
    Caption = 'SNR:'
  end
  object Label6: TLabel
    Left = 15
    Top = 469
    Width = 98
    Height = 19
    Alignment = taRightJustify
    Caption = 'Current RSSI:'
  end
  object Label17: TLabel
    Left = 395
    Top = 469
    Width = 103
    Height = 19
    Alignment = taRightJustify
    Caption = 'Average RSSI:'
  end
  object Label8: TLabel
    Left = 423
    Top = 24
    Width = 64
    Height = 19
    Alignment = taRightJustify
    Caption = ' Version:'
  end
  object lstPackets: TListBox
    Left = 612
    Top = 20
    Width = 492
    Height = 526
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 18
    ParentFont = False
    TabOrder = 2
  end
  object lstCommands: TListBox
    Left = 720
    Top = 298
    Width = 147
    Height = 40
    ItemHeight = 19
    TabOrder = 1
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 120
    Top = 21
    Width = 125
    Height = 27
    Style = csDropDownList
    TabOrder = 0
    OnCloseUp = ComboBox1CloseUp
  end
  object pnlFrequencyError: TPanel
    Left = 118
    Top = 508
    Width = 89
    Height = 27
    BevelOuter = bvLowered
    TabOrder = 3
  end
  object pnlPacketRSSI: TPanel
    Left = 327
    Top = 508
    Width = 89
    Height = 27
    BevelOuter = bvLowered
    TabOrder = 4
  end
  object pnlPacketSNR: TPanel
    Left = 504
    Top = 508
    Width = 89
    Height = 27
    BevelOuter = bvLowered
    TabOrder = 5
  end
  object pnlRSSI: TPanel
    Left = 119
    Top = 465
    Width = 89
    Height = 27
    BevelOuter = bvLowered
    TabOrder = 6
  end
  object pnlAverageRSSI: TPanel
    Left = 504
    Top = 465
    Width = 89
    Height = 27
    BevelOuter = bvLowered
    TabOrder = 7
  end
  object pnlVersion: TPanel
    Left = 503
    Top = 20
    Width = 89
    Height = 27
    BevelOuter = bvLowered
    TabOrder = 8
  end
  object Panel1: TPanel
    Left = 8
    Top = 62
    Width = 585
    Height = 391
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 9
    object Label14: TLabel
      Left = 16
      Top = 144
      Width = 78
      Height = 19
      Alignment = taRightJustify
      Caption = 'Frequency:'
    end
    object Label15: TLabel
      Left = 202
      Top = 144
      Width = 30
      Height = 19
      Caption = 'MHz'
    end
    object Label2: TLabel
      Left = 197
      Top = 105
      Width = 116
      Height = 19
      Alignment = taRightJustify
      Caption = 'Quick Set Mode:'
    end
    object Label3: TLabel
      Left = 261
      Top = 144
      Width = 56
      Height = 19
      Alignment = taRightJustify
      Caption = 'Coding:'
    end
    object Label4: TLabel
      Left = 240
      Top = 177
      Width = 77
      Height = 19
      Alignment = taRightJustify
      Caption = 'Spreading:'
    end
    object Label5: TLabel
      Left = 14
      Top = 177
      Width = 80
      Height = 19
      Alignment = taRightJustify
      Caption = 'Bandwidth:'
    end
    object Label12: TLabel
      Left = 11
      Top = 105
      Width = 159
      Height = 19
      Caption = 'RECEIVE SETTINGS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 12
      Top = 268
      Width = 78
      Height = 19
      Alignment = taRightJustify
      Caption = 'Frequency:'
    end
    object Label16: TLabel
      Left = 198
      Top = 268
      Width = 30
      Height = 19
      Caption = 'MHz'
    end
    object Label18: TLabel
      Left = 193
      Top = 229
      Width = 116
      Height = 19
      Alignment = taRightJustify
      Caption = 'Quick Set Mode:'
    end
    object Label19: TLabel
      Left = 257
      Top = 268
      Width = 56
      Height = 19
      Alignment = taRightJustify
      Caption = 'Coding:'
    end
    object Label20: TLabel
      Left = 236
      Top = 301
      Width = 77
      Height = 19
      Alignment = taRightJustify
      Caption = 'Spreading:'
    end
    object Label21: TLabel
      Left = 10
      Top = 301
      Width = 80
      Height = 19
      Alignment = taRightJustify
      Caption = 'Bandwidth:'
    end
    object Label22: TLabel
      Left = 7
      Top = 229
      Width = 177
      Height = 19
      Caption = 'TRANSMIT SETTINGS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 63
      Top = 48
      Width = 36
      Height = 19
      Alignment = taRightJustify
      Caption = 'PPM:'
    end
    object Label27: TLabel
      Left = 11
      Top = 9
      Width = 163
      Height = 19
      Caption = 'COMMON SETTINGS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object btnSet: TButton
      Left = 319
      Top = 344
      Width = 253
      Height = 34
      Caption = 'Save In EEPROM'
      TabOrder = 0
      WordWrap = True
      OnClick = btnSetClick
    end
    object edtRxFrequency: TEdit
      Left = 111
      Top = 141
      Width = 85
      Height = 27
      TabOrder = 1
      OnExit = edtRxFrequencyExit
    end
    object Panel4: TPanel
      Left = 4
      Top = 91
      Width = 568
      Height = 5
      BevelOuter = bvLowered
      TabOrder = 2
    end
    object cmbRxMode: TComboBox
      Left = 323
      Top = 102
      Width = 249
      Height = 27
      DropDownCount = 10
      ItemIndex = 0
      TabOrder = 3
      Text = 'Choose Mode ...'
      OnCloseUp = cmbRxModeCloseUp
      Items.Strings = (
        'Choose Mode ...'
        '0 - Slow'
        '1 - Fast'
        '2 - Repeater'
        '3 - Turbo'
        '4 - TurboX'
        '5 - Calling'
        '6 - Uplink'
        '7 - Telnet'
        '8 - SSDV Repeater')
    end
    object cmbRxCoding: TComboBox
      Left = 323
      Top = 141
      Width = 85
      Height = 27
      TabOrder = 4
      OnCloseUp = cmbRxCodingCloseUp
      Items.Strings = (
        '5'
        '6'
        '7'
        '8')
    end
    object cmbRxSpreading: TComboBox
      Left = 323
      Top = 174
      Width = 85
      Height = 27
      TabOrder = 5
      OnCloseUp = cmbRxSpreadingCloseUp
      Items.Strings = (
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12')
    end
    object cmbRxBandwidth: TComboBox
      Left = 111
      Top = 174
      Width = 85
      Height = 27
      TabOrder = 6
      OnCloseUp = cmbRxBandwidthCloseUp
      Items.Strings = (
        '7K8'
        '10K4'
        '15K6'
        '20K8'
        '31K25'
        '41K7'
        '62K5'
        '125K'
        '250K'
        '500K')
    end
    object chkRxImplicit: TCheckBox
      Left = 435
      Top = 146
      Width = 145
      Height = 17
      Caption = 'Implicit Headers'
      TabOrder = 7
      OnClick = chkRxImplicitClick
    end
    object edtTxFrequency: TEdit
      Left = 107
      Top = 265
      Width = 85
      Height = 27
      TabOrder = 8
      OnExit = edtTxFrequencyExit
    end
    object Panel5: TPanel
      Left = 0
      Top = 215
      Width = 568
      Height = 5
      BevelOuter = bvLowered
      TabOrder = 9
    end
    object cmbTxMode: TComboBox
      Left = 319
      Top = 226
      Width = 249
      Height = 27
      DropDownCount = 10
      ItemIndex = 0
      TabOrder = 10
      Text = 'Choose Mode ...'
      OnCloseUp = cmbTxModeCloseUp
      Items.Strings = (
        'Choose Mode ...'
        '0 - Slow'
        '1 - Fast'
        '2 - Repeater'
        '3 - Turbo'
        '4 - TurboX'
        '5 - Calling'
        '6 - Uplink'
        '7 - Telnet'
        '8 - SSDV Repeater')
    end
    object cmbTxCoding: TComboBox
      Left = 319
      Top = 265
      Width = 85
      Height = 27
      TabOrder = 11
      OnCloseUp = cmbTxCodingCloseUp
      Items.Strings = (
        '5'
        '6'
        '7'
        '8')
    end
    object cmbTxSpreading: TComboBox
      Left = 319
      Top = 298
      Width = 85
      Height = 27
      TabOrder = 12
      OnCloseUp = cmbTxSpreadingCloseUp
      Items.Strings = (
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12')
    end
    object cmbTxBandwidth: TComboBox
      Left = 107
      Top = 298
      Width = 85
      Height = 27
      TabOrder = 13
      OnCloseUp = cmbTxBandwidthCloseUp
      Items.Strings = (
        '7K8'
        '10K4'
        '15K6'
        '20K8'
        '31K25'
        '41K7'
        '62K5'
        '125K'
        '250K'
        '500K')
    end
    object chkTxImplicit: TCheckBox
      Left = 435
      Top = 270
      Width = 145
      Height = 17
      Caption = 'Implicit Headers'
      TabOrder = 14
      OnClick = chkTxImplicitClick
    end
    object edtPPM: TSpinEdit
      Left = 116
      Top = 45
      Width = 80
      Height = 29
      MaxValue = 15
      MinValue = -15
      TabOrder = 15
      Value = 0
      OnChange = edtPPMChange
    end
    object chkEnableRepeater: TCheckBox
      Left = 323
      Top = 50
      Width = 145
      Height = 17
      Caption = 'Enable Repeater'
      TabOrder = 16
      OnClick = chkEnableRepeaterClick
    end
    object Button1: TButton
      Left = 11
      Top = 344
      Width = 254
      Height = 34
      Caption = 'Reset to current EEPROM settings'
      TabOrder = 17
      WordWrap = True
      OnClick = Button1Click
    end
    object chkRxLowOpt: TCheckBox
      Left = 435
      Top = 179
      Width = 145
      Height = 17
      Caption = 'Low Speed Opt.'
      TabOrder = 18
      OnClick = chkRxLowOptClick
    end
    object chkTxLowOpt: TCheckBox
      Left = 435
      Top = 303
      Width = 145
      Height = 17
      Caption = 'Low Speed Opt.'
      TabOrder = 19
      OnClick = chkTxLowOptClick
    end
  end
  object pnlCommsStatus: TPanel
    Left = 259
    Top = 20
    Width = 146
    Height = 27
    BevelOuter = bvLowered
    TabOrder = 10
  end
  object VaComm1: TVaComm
    Baudrate = br115200
    FlowControl.OutCtsFlow = False
    FlowControl.OutDsrFlow = False
    FlowControl.ControlDtr = dtrEnabled
    FlowControl.ControlRts = rtsEnabled
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    FlowControl.DsrSensitivity = False
    FlowControl.TxContinueOnXoff = False
    DeviceName = 'COM%d'
    SettingsStore.RegRoot = rrCURRENTUSER
    SettingsStore.Location = slINIFile
    OnRxChar = VaComm1RxChar
    Version = '2.0.4.0'
    Left = 148
    Top = 684
  end
  object tmrCommands: TTimer
    Interval = 100
    OnTimer = tmrCommandsTimer
    Left = 616
    Top = 84
  end
end
