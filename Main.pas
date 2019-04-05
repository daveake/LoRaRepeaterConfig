unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, StdCtrls, ExtCtrls, VaClasses, VaComm, Mask, AdvSpin,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, SyncObjs,
  Spin;

type
  TfrmMain = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    VaComm1: TVaComm;
    lstCommands: TListBox;
    tmrCommands: TTimer;
    lstPackets: TListBox;
    pnlFrequencyError: TPanel;
    Label9: TLabel;
    pnlPacketRSSI: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    pnlPacketSNR: TPanel;
    Label6: TLabel;
    Label17: TLabel;
    pnlRSSI: TPanel;
    pnlAverageRSSI: TPanel;
    Label8: TLabel;
    pnlVersion: TPanel;
    Panel1: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnSet: TButton;
    edtRxFrequency: TEdit;
    Panel4: TPanel;
    cmbRxMode: TComboBox;
    cmbRxCoding: TComboBox;
    cmbRxSpreading: TComboBox;
    cmbRxBandwidth: TComboBox;
    Label12: TLabel;
    chkRxImplicit: TCheckBox;
    Label7: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtTxFrequency: TEdit;
    Panel5: TPanel;
    cmbTxMode: TComboBox;
    cmbTxCoding: TComboBox;
    cmbTxSpreading: TComboBox;
    cmbTxBandwidth: TComboBox;
    Label22: TLabel;
    chkTxImplicit: TCheckBox;
    Label23: TLabel;
    Label27: TLabel;
    edtPPM: TSpinEdit;
    chkEnableRepeater: TCheckBox;
    pnlCommsStatus: TPanel;
    Button1: TButton;
    chkRxLowOpt: TCheckBox;
    chkTxLowOpt: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1CloseUp(Sender: TObject);
    procedure VaComm1RxChar(Sender: TObject; Count: Integer);
    procedure btnSetClick(Sender: TObject);
    procedure tmrCommandsTimer(Sender: TObject);
    procedure cmbRxModeCloseUp(Sender: TObject);
    procedure edtPPMChange(Sender: TObject);
    procedure edtRxFrequencyExit(Sender: TObject);
    procedure chkEnableRepeaterClick(Sender: TObject);
    procedure cmbRxCodingCloseUp(Sender: TObject);
    procedure cmbTxCodingCloseUp(Sender: TObject);
    procedure edtTxFrequencyExit(Sender: TObject);
    procedure chkRxImplicitClick(Sender: TObject);
    procedure chkTxImplicitClick(Sender: TObject);
    procedure cmbRxSpreadingCloseUp(Sender: TObject);
    procedure cmbTxSpreadingCloseUp(Sender: TObject);
    procedure cmbRxBandwidthCloseUp(Sender: TObject);
    procedure cmbTxBandwidthCloseUp(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chkRxLowOptClick(Sender: TObject);
    procedure chkTxLowOptClick(Sender: TObject);
    procedure cmbTxModeCloseUp(Sender: TObject);
  private
    { Private declarations }
    ChangingSettings : Boolean;
    procedure SendSetting(Command, Value: String);
    procedure ProcessLine(Line: AnsiString);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

function BoolToStr(Value: Boolean): String;
begin
    if Value then Result := '1' else Result := '0';
end;

procedure TfrmMain.btnSetClick(Sender: TObject);
begin
    lstCommands.Items.Add('~!');
    lstCommands.Items.Add('~?');
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
    lstCommands.Items.Add('~^');
    lstCommands.Items.Add('~?');
end;

procedure TfrmMain.chkEnableRepeaterClick(Sender: TObject);
begin
    SendSetting('R', BoolToStr(chkEnableRepeater.Checked));
end;

procedure TfrmMain.chkRxImplicitClick(Sender: TObject);
begin
    SendSetting('I', BoolToStr(chkRxImplicit.Checked));
end;

procedure TfrmMain.chkRxLowOptClick(Sender: TObject);
begin
    SendSetting('L', BoolToStr(chkRxLowOpt.Checked));
end;

procedure TfrmMain.chkTxImplicitClick(Sender: TObject);
begin
    SendSetting('i', BoolToStr(chkTxImplicit.Checked));
end;

procedure TfrmMain.chkTxLowOptClick(Sender: TObject);
begin
    SendSetting('l', BoolToStr(chkTxLowOpt.Checked));
end;

function DefaultCoding(Mode: Integer): Integer;
begin
    if Mode in [1,4,6,7,8] then begin
        Result := 5;
    end else if Mode = 3 then begin
        Result := 6;
    end else if Mode in [0,2,5] then begin
        Result := 8;
    end else begin
        Result := 5;
    end;

    Result := Result - 5;
end;

function DefaultBandwidth(Mode: Integer): Integer;
begin
    if Mode in [0,1,7] then begin
        Result := 3;    // 20K8
    end else if Mode in [5,6] then begin
        Result := 5;    // 41K7
    end else if Mode in [2,8] then begin
        Result := 6;    // 62K5
    end else if Mode in [3,4] then begin
        Result := 8;    // 250K
    end else begin
        Result := 3;    // 20K8
    end;
end;

function DefaultSpreading(Mode: Integer): Integer;
begin
    if Mode in [1,4,6,8] then begin
        Result := 6;
    end else if Mode in [3,7] then begin
        Result := 7;
    end else if Mode = 2 then begin
        Result := 8;
    end else if Mode in [0,5] then begin
        Result := 11;
    end else begin
        Result := 6;
    end;

    Result := Result - 6;
end;

procedure TfrmMain.cmbRxModeCloseUp(Sender: TObject);
begin
    if cmbRxMode.ItemIndex > 0 then begin
        cmbRxCoding.ItemIndex := DefaultCoding(cmbRxMode.ItemIndex - 1);
        cmbRxBandwidth.ItemIndex := DefaultBandwidth(cmbRxMode.ItemIndex - 1);
        cmbRxSpreading.ItemIndex := DefaultSpreading(cmbRxMode.ItemIndex - 1);
        chkRxImplicit.Checked := (cmbRxMode.ItemIndex - 1) in [1, 4, 6, 8];
        chkRxLowOpt.Checked := (cmbRxMode.ItemIndex - 1) = 0;

        cmbRxCodingCloseup(nil);
        cmbRxBandwidthCloseup(nil);
        cmbRxSpreadingCloseup(nil);
        chkRxImplicitClick(nil);
        chkRxLowOptClick(nil);
    end;
end;

procedure TfrmMain.cmbRxBandwidthCloseUp(Sender: TObject);
begin
    SendSetting('B', cmbTxBandwidth.Text);
end;

procedure TfrmMain.cmbRxCodingCloseUp(Sender: TObject);
begin
    SendSetting('E', IntToStr(cmbRxCoding.ItemIndex+5));
end;

procedure TfrmMain.cmbRxSpreadingCloseUp(Sender: TObject);
begin
    SendSetting('S', IntToStr(cmbRxSpreading.ItemIndex+6));
end;

procedure TfrmMain.cmbTxBandwidthCloseUp(Sender: TObject);
begin
    SendSetting('b', cmbTxBandwidth.Text);
end;

procedure TfrmMain.cmbTxCodingCloseUp(Sender: TObject);
begin
    SendSetting('e', IntToStr(cmbRxCoding.ItemIndex+5));
end;

procedure TfrmMain.cmbTxModeCloseUp(Sender: TObject);
begin
    if cmbTxMode.ItemIndex > 0 then begin
        cmbTxCoding.ItemIndex := DefaultCoding(cmbTxMode.ItemIndex - 1);
        cmbTxBandwidth.ItemIndex := DefaultBandwidth(cmbTxMode.ItemIndex - 1);
        cmbTxSpreading.ItemIndex := DefaultSpreading(cmbTxMode.ItemIndex - 1);
        chkTxImplicit.Checked := (cmbTxMode.ItemIndex - 1) in [1, 4, 6, 8];
        chkTxLowOpt.Checked := (cmbTxMode.ItemIndex - 1) = 0;

        cmbTxCodingCloseup(nil);
        cmbTxBandwidthCloseup(nil);
        cmbTxSpreadingCloseup(nil);
        chkTxImplicitClick(nil);
        chkTxLowOptClick(nil);
    end;
end;

procedure TfrmMain.cmbTxSpreadingCloseUp(Sender: TObject);
begin
    SendSetting('s', IntToStr(cmbTxSpreading.ItemIndex+6));
end;

procedure TfrmMain.ComboBox1CloseUp(Sender: TObject);
begin
    VaComm1.Close;
    if ComboBox1.ItemIndex >= 0 then begin
        try
            VaComm1.DeviceName := ComboBox1.Text;
            VaComm1.Open;
            pnlCommsStatus.Caption := VaComm1.DeviceName + ' open';
            VaComm1.WriteText('~?' + #10)
        except
            pnlCommsStatus.Caption := VaComm1.DeviceName + ' failed to open';
        end;
    end;
end;

procedure TfrmMain.edtRxFrequencyExit(Sender: TObject);
begin
    SendSetting('F', edtRxFrequency.Text);
end;

procedure TfrmMain.edtTxFrequencyExit(Sender: TObject);
begin
    SendSetting('f', edtTxFrequency.Text);
end;

procedure TfrmMain.SendSetting(Command, Value: String);
begin
    if (Value <> '') and (not ChangingSettings) then begin
        lstCommands.Items.Add('~' + Command + Value);
    end;
end;

procedure TfrmMain.edtPPMChange(Sender: TObject);
begin
    SendSetting('P', edtPPM.Text);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  reg: TRegistry;
  st: Tstrings;
  i: Integer;
begin
    ComboBox1.Items.Clear;

    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_LOCAL_MACHINE;
        reg.OpenKey('hardware\devicemap\serialcomm', False);
        st := TstringList.Create;
        try
            reg.GetValueNames(st);
            for i := 0 to st.Count - 1 do begin
                ComboBox1.Items.Add(reg.Readstring(st.strings[i]));
            end;
        finally
            st.Free;
        end;
        reg.CloseKey;
    finally
        reg.Free;
    end;
end;

function GetString(var Line: AnsiString; Delimiter: String=','): AnsiString;
var
    Position: Integer;
begin
    Position := Pos(Delimiter, string(Line));
    if Position > 0 then begin
        Result := Copy(Line, 1, Position-1);
        Line := Copy(Line, Position+Length(Delimiter), Length(Line));
    end else begin
        Result := '';
    end;
end;

procedure SetBandwidth(Combo: TComboBox; Value: String);
var
    i, Position: Integer;
begin
    Position := Pos('.', Value);
    if Position > 0 then Value[Position] := 'K';

    for i := 0 to Combo.Items.Count-1 do begin
        if Combo.Items[i] = Value then begin
            Combo.ItemIndex := i;
            Exit;
        end;
    end;
end;


procedure TfrmMain.ProcessLine(Line: AnsiString);
var
    Command, OriginalLine: AnsiString;
begin
    ChangingSettings := True;

    try
        while lstPackets.Items.Count > 50 do begin
            lstPackets.Items.Delete(0);
        end;

        if Length(Line) > 2 then begin
            OriginalLine := Line;
            Command := UpperCase(GetString(Line, '='));

            if Command = '' then begin
                lstPackets.Items.Add(OriginalLine);
                lstPackets.ItemIndex := lstPackets.Items.Count-1;
            // Live data
            end else if Command = 'CURRENTRSSI' then begin
                pnlRSSI.Caption := string(Line + 'dBm');
                if pnlAverageRSSI.Caption = '' then begin
                    pnlAverageRSSI.Caption := string(Line + 'dBm');
                end else begin
                    pnlAverageRSSI.Caption := IntToStr(Round(StrToFloat(Copy(pnlAverageRSSI.Caption, 1, Length(pnlAverageRSSI.Caption)-3)) * 0.8 + StrToFloat(Line) * 0.2)) + 'dBm';
                end;
            end else if Command = 'MESSAGE' then begin
                lstPackets.Items.Add(Line);
                lstPackets.ItemIndex := lstPackets.Items.Count-1;
            end else if Command = 'HEX' then begin
                lstPackets.Items.Add(Line);
                lstPackets.ItemIndex := lstPackets.Items.Count-1;
                if Copy(Line,1,2) = 'E6' then begin
                    Line[1] := '6';
                end;
            end else if Command = 'FREQERR' then begin
                pnlFrequencyError.Caption := Line + ' kHz';
            end else if Command = 'PACKETRSSI' then begin
                pnlPacketRSSI.Caption := Line;
            end else if Command = 'PACKETSNR' then begin
                pnlPacketSNR.Caption := Line;
            // Device info
            end else if Command = 'VERSION' then begin
                pnlVersion.Caption := Line;
            // Global settings
            end else if Command = 'PPM' then begin
                edtPPM.Text := IntToStr(Round(StrToFloat(Line)));
            end else if Command = 'ENABLEREPEATER' then begin
                chkEnableRepeater.Checked := Line <> '0';
            // Rx Settings
            end else if Command = 'RXFREQUENCY' then begin
                edtRxFrequency.Text := Line;
            end else if Command = 'RXERRORCODING' then begin
                cmbRxCoding.ItemIndex := StrToIntDef(Line, 5) - 5;
            end else if Command = 'RXBANDWIDTH' then begin
                SetBandwidth(cmbRxBandwidth, Line);
            end else if Command = 'RXSPREADINGFACTOR' then begin
                cmbRxSpreading.ItemIndex := StrToIntDef(Line, 6) - 6;
            end else if Command = 'RXIMPLICIT' then begin
                chkRxImplicit.Checked := Line <> '0';
            end else if Command = 'RXLOWDATARATEOPTIMIZE' then begin
                chkRxLowOpt.Checked := Line <> '0';
            // Tx Settings
            end else if Command = 'TXFREQUENCY' then begin
                edtTxFrequency.Text := Line;
            end else if Command = 'TXERRORCODING' then begin
                cmbTxCoding.ItemIndex := StrToIntDef(Line, 5) - 5;
            end else if Command = 'TXBANDWIDTH' then begin
                SetBandwidth(cmbTxBandwidth, Line);
            end else if Command = 'TXSPREADINGFACTOR' then begin
                cmbTxSpreading.ItemIndex := StrToIntDef(Line, 6) - 6;
            end else if Command = 'TXIMPLICIT' then begin
                chkTxImplicit.Checked := Line <> '0';
            end else if Command = 'TXLOWDATARATEOPTIMIZE' then begin
                chkTxLowOpt.Checked := Line <> '0';
            end else begin
                lstPackets.Items.Add('Unknown: ' + OriginalLine);
                lstPackets.ItemIndex := lstPackets.Items.Count-1;
            end;
        end;
    finally
        ChangingSettings := False;
    end;
end;

procedure TfrmMain.tmrCommandsTimer(Sender: TObject);
begin
    if lstCommands.Items.Count > 0 then begin
        VaComm1.WriteText(lstCommands.Items[0] + #13);
        lstCommands.Items.Delete(0);
    end;
end;

procedure TfrmMain.VaComm1RxChar(Sender: TObject; Count: Integer);
const
    Buffer: AnsiString = '';
var
    i: Integer;
    Character: AnsiChar;
begin
    for i := 1 to Count do begin
        VaComm1.ReadChar(Character);

        try
            if (Character = Chr(10)) or (Character = Chr(13)) then begin
                if Length(Buffer) > 0 then begin
                    ProcessLine(Buffer);
                    Buffer := '';
                end;
            end else begin
                if Length(Buffer) < 1000 then begin
                    Buffer := Buffer + Character;
                end;
            end;
        except
        end;
    end;
end;

end.
