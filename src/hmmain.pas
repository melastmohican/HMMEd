unit Hmmain;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Menus,
  HotPot,DirDlg, Spin, TabNotBk, ExtCtrls, ComCtrls, ABox;

type
  THMMForm = class(TForm)
    MainMenu1: TMainMenu;
    mFile: TMenuItem;
    mOpen: TMenuItem;
    N1: TMenuItem;
    mExit: TMenuItem;
    mHelp: TMenuItem;
    mAbout: TMenuItem;
    mSave: TMenuItem;
    mEdit: TMenuItem;
    mCopy: TMenuItem;
    mPaste: TMenuItem;
    GamePage: TPageControl;
    PlayersPage: TTabSheet;
    HeroesPage: TTabSheet;
    PlayerData: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Label18: TLabel;
    CrystalEd: TSpinEdit;
    GemEd: TSpinEdit;
    LumberEd: TSpinEdit;
    MercuryEd: TSpinEdit;
    SulferEd: TSpinEdit;
    GoldEd: TSpinEdit;
    OreEd: TSpinEdit;
    PlayerListBox: TListBox;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    HeroData: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    AttackEd: TSpinEdit;
    DefenceEd: TSpinEdit;
    SpellEd: TSpinEdit;
    KnowEd: TSpinEdit;
    ExpEd: TSpinEdit;
    Unit1Combo: TComboBox;
    Unit1Ed: TSpinEdit;
    Unit2Ed: TSpinEdit;
    Unit3Ed: TSpinEdit;
    Unit4Ed: TSpinEdit;
    Unit5Ed: TSpinEdit;
    Unit2Combo: TComboBox;
    Unit3Combo: TComboBox;
    Unit4Combo: TComboBox;
    Unit5Combo: TComboBox;
    SpellData: TGroupBox;
    SpellCombo: TComboBox;
    ArtfCombo: TComboBox;
    SpellNumEd: TSpinEdit;
    SpellBook: TCheckBox;
    SpellListBox: TListBox;
    ArtfListBox: TListBox;
    HeroNameCombo: TComboBox;
    AboutDlg: TAboutBox;

    procedure mOpenClick(Sender: TObject);
    procedure mExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PlayerListBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MainTabChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure ArtfListBoxClick(Sender: TObject);
    procedure SpellListBoxClick(Sender: TObject);
    procedure CrystalEdChange(Sender: TObject);
    procedure GemEdChange(Sender: TObject);
    procedure LumberEdChange(Sender: TObject);
    procedure MercuryEdChange(Sender: TObject);
    procedure SulferEdChange(Sender: TObject);
    procedure GoldEdChange(Sender: TObject);
    procedure mSaveClick(Sender: TObject);
    procedure OreEdChange(Sender: TObject);
    procedure AttackEdChange(Sender: TObject);
    procedure DefenceEdChange(Sender: TObject);
    procedure SpellEdChange(Sender: TObject);
    procedure KnowEdChange(Sender: TObject);
    procedure ExpEdChange(Sender: TObject);
    procedure Unit1EdChange(Sender: TObject);
    procedure Unit2EdChange(Sender: TObject);
    procedure Unit3EdChange(Sender: TObject);
    procedure Unit4EdChange(Sender: TObject);
    procedure Unit5EdChange(Sender: TObject);
    procedure Unit1ComboChange(Sender: TObject);
    procedure Unit2ComboChange(Sender: TObject);
    procedure Unit3ComboChange(Sender: TObject);
    procedure Unit4ComboChange(Sender: TObject);
    procedure Unit5ComboChange(Sender: TObject);
    procedure SpellNumEdChange(Sender: TObject);
    procedure SpellComboChange(Sender: TObject);
    procedure ArtfComboChange(Sender: TObject);
    procedure mCopyClick(Sender: TObject);
    procedure mPasteClick(Sender: TObject);
    procedure SpellBookClick(Sender: TObject);
    procedure GamePageChange(Sender: TObject);
    procedure HeroNameComboChange(Sender: TObject);
    procedure mAboutClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure ClearHeroData;
    procedure FillHeroRecord;
    procedure FillPLayerEdits;
    procedure SaveCurrentHero;
    procedure SaveCurrentPLayers;
  public
    { Public declarations }
    SavFil: string[255];
    bPSave: Boolean;
    bHSave: Boolean;
    procedure OpenGame;
    procedure SaveGame;
  end;

const
  cPNames: Array[0..3] of PChar = ('Player 1','Player 2', 'Player 3','Player 4');
var
  HMMForm: THMMForm;
  PLayers: TList;
  pRec: ^TPlayerRec;
  hRec: ^THeroRec;
  hCopyRec: ^THeroRec;
  fhandle: integer;

implementation

{$R *.DFM}
{$R HMMStr32.res}

uses Lic;

const
 STR_UNITS = 200;
 STR_ARTIF = 300;
 STR_SPELL = 400;

var
 secret: MSecret;

procedure THMMForm.FormCreate(Sender: TObject);
var
 i: integer;
begin
fhandle := -1;
bPSave := false;
bHSave := false;
Unit1Combo.Clear;
Unit2Combo.Clear;
Unit3Combo.Clear;
Unit4Combo.Clear;
Unit5Combo.Clear;
for i:=0 to 28 do
 begin
  Unit1Combo.Items.Add(LoadStr(STR_UNITS + i));
  Unit2Combo.Items.Add(LoadStr(STR_UNITS + i));
  Unit3Combo.Items.Add(LoadStr(STR_UNITS + i));
  Unit4Combo.Items.Add(LoadStr(STR_UNITS + i));
  Unit5Combo.Items.Add(LoadStr(STR_UNITS + i));
 end;
Unit1Combo.ItemIndex := 0;
Unit2Combo.ItemIndex := 0;
Unit3Combo.ItemIndex := 0;
Unit4Combo.ItemIndex := 0;
Unit5Combo.ItemIndex := 0;
for i:=0 to 12 do
 ArtfListBox.Items.Add('Artifact #' + IntToStr(i));
for i:=0 to 28 do
 SpellListBox.Items.Add('Spell  #' + IntToStr(i));
for i:=0 to 37 do
 ArtfCombo.Items.Add(LoadStr(STR_ARTIF + i));
ArtfCombo.ItemIndex := 0;
for i:=0 to 28 do
 SpellCombo.Items.Add(LoadStr(STR_SPELL + i));
SpellCombo.ItemIndex := 0;
end;

procedure THMMForm.FormDestroy(Sender: TObject);
begin
if hCopyRec <> nil then Dispose(hCopyRec);
Players.Free;
_lclose(fhandle);
end;

procedure THMMForm.mOpenClick(Sender: TObject);
begin
 OpenGame;
end;

procedure THMMForm.OpenGame;
var
  sb: TStringBuffer;
  pos: Longint;
  rec: Array[0..188] of Char;
  i: Integer;
begin
if bPSave then SaveCurrentPLayers;
if fhandle > 0 then _lclose(fhandle);
CDirDlg := TCDirDlg.Create(self);
CDirDlg.ShowModal;
CDirDlg.Free;
if CDirDlg.ModalResult = mrOk then
 begin
  if FileExists(ExpandFileName(SavFil)) then
   begin
    sb.str := ExpandFileName(SavFil) + #0;
    fhandle := _lopen(sb.cArray,OF_READWRITE + OF_SHARE_EXCLUSIVE);
   end;
 if(fhandle >0) and (GamePage.ActivePage.TabIndex = 0) then
  begin
   PLayers := TList.Create;
   PlayerListBox.Clear;
   for i:=0 to 3 do
    begin
     pos := FindStr(fhandle,cPNames[i]);
     _llseek(fhandle,pos,0);
     _lread(fhandle,@rec,SizeOf(TPlayerRec));
     New(pRec);
     StrMove(PChar(pRec),rec,SizeOf(TPlayerRec));
     Players.Add(pRec);
     PLayerListBox.Items.Add(StrPas(pRec^.Name));
    end;
   PlayerListBox.ItemIndex := 0;
   FillPlayerEdits;
   bPSave := false;
   bHSave := false;
  end;
 end;
end;

procedure THMMForm.SaveGame;
begin
if (bPSave) and (GamePage.ActivePage.TabIndex = 0) then SaveCurrentPLayers;
if (bHSave) and (GamePage.ActivePage.TabIndex = 1) then SaveCurrentHero;
end;

procedure THMMForm.mExitClick(Sender: TObject);
begin
if bPSave then SaveCurrentPLayers;
if (bHSave) then SaveCurrentHero;
Close;
end;

procedure THMMForm.ClearHeroData;
begin
 HeroData.Caption := '';
 AttackEd.Text := '0';
 DefenceEd.Text := '0';
 SpellEd.Text := '0';
 KnowEd.Text := '0';
 ExpEd.Text := '0';
 Unit1Combo.ItemIndex := 0;
 Unit2Combo.ItemIndex := 0;
 Unit3Combo.ItemIndex := 0;
 Unit4Combo.ItemIndex := 0;
 Unit5Combo.ItemIndex := 0;
 Unit1Ed.Text := '0';
 Unit2Ed.Text := '0';
 Unit3Ed.Text := '0';
 Unit4Ed.Text := '0';
 Unit5Ed.Text := '0';
 ArtfListBox.ItemIndex := 0;
 ArtfCombo.ItemIndex := 0;
 SpellListBox.ItemIndex := 0;
 SpellCombo.ItemIndex := 0;
end;

procedure THMMForm.FillHeroRecord;
begin
 HeroData.Caption := StrPas(hRec^.Name);
 AttackEd.Text := IntToStr(hRec^.Attack);
 DefenceEd.Text := IntToStr(hRec^.Defence);
 SpellEd.Text := IntToStr(hRec^.Spell);
 KnowEd.Text := IntToStr(hRec^.Knowledge);
 ExpEd.Text := IntToStr(hRec^.Experience);
 Unit1Combo.ItemIndex := hRec^.U1Type + 1;
 Unit2Combo.ItemIndex := hRec^.U2Type + 1;
 Unit3Combo.ItemIndex := hRec^.U3Type + 1;
 Unit4Combo.ItemIndex := hRec^.U4Type + 1;
 Unit5Combo.ItemIndex := hRec^.U5Type + 1;
 Unit1Ed.Text := IntToStr(hRec^.U1Num);
 Unit2Ed.Text := IntToStr(hRec^.U2Num);
 Unit3Ed.Text := IntToStr(hRec^.U3Num);
 Unit4Ed.Text := IntToStr(hRec^.U4Num);
 Unit5Ed.Text := IntToStr(hRec^.U5Num);
 ArtfListBox.ItemIndex := 0;
 ArtfCombo.ItemIndex := hRec^.Artifacts[0] + 1;
 SpellListBox.ItemIndex := 0;
 SpellCombo.ItemIndex := hRec^.Spells[0] + 1;
 SpellNumEd.Value := hRec^.SpellNum[0];
 if hRec^.SpellBook = $25 then SpellBook.State := cbChecked
 else SpellBook.State := cbUnchecked;
end;

procedure THMMForm.FillPLayerEdits;
begin
pRec := Players.Items[PlayerListBox.ItemIndex];
PlayerData.Caption := StrPas(pRec^.Name);
CrystalEd.Text := IntToStr(pRec^.Crystal);
GemEd.Text := IntToStr(pRec^.Gem);
LumberEd.Text := IntToStr(pRec^.Lumber);
MercuryEd.Text := IntToStr(pRec^.Mercury);
OreEd.Text := IntToStr(pRec^.Ore);
SulferEd.Text := IntToStr(pRec^.Sulfer);
GoldEd.Text := IntToStr(pRec^.Gold);
end;

procedure THMMForm.PlayerListBoxClick(Sender: TObject);
begin
FillPlayerEdits;
end;

procedure THMMForm.MainTabChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
var
  //sb: TStringBuffer;
  pos: Longint;
  rec: Array[0..188] of Char;
  i: Integer;
begin
if (NewTab = 0) then
 begin
  PLayers := TList.Create;
  PlayerListBox.Clear;
 end;
if(fhandle >0) and (NewTab = 0) then
  begin
   for i:=0 to 3 do
    begin
     pos := FindStr(fhandle,cPNames[i]);
     _llseek(fhandle,pos,0);
     _lread(fhandle,@rec,SizeOf(TPlayerRec));
     New(pRec);
     StrMove(PChar(pRec),rec,SizeOf(TPlayerRec));
     Players.Add(pRec);
     PlayerListBox.Items.Add(StrPas(pRec^.Name));
    end;
   PlayerListBox.ItemIndex := 0;
   FillPlayerEdits;
  end;
end;

procedure THMMForm.ArtfListBoxClick(Sender: TObject);
var
 index: integer;
 bIndex: Byte;
begin
if hRec <> nil then
 begin
  index := ArtfListBox.ItemIndex;
  bIndex := hRec^.Artifacts[index]+ 1;
  ArtfCombo.ItemIndex := bIndex;
 end;
end;

procedure THMMForm.SpellListBoxClick(Sender: TObject);
var
 index: integer;
 bIndex: Byte;
begin
if hRec <> nil then
 begin
  index := SpellListBox.ItemIndex;
  bIndex := hRec^.Spells[index]+ 1;
  SpellCombo.ItemIndex := bIndex;
  if bIndex > 0 then
    SpellNumEd.Text := IntToStr(hRec^.SpellNum[index])
  else
    SpellNumEd.Text := '0';
 end;
end;

procedure THMMForm.CrystalEdChange(Sender: TObject);
begin
if pRec <> nil then
 begin
  bPSave := true;
  pRec^.Crystal := CrystalEd.Value;
 end;
end;

procedure THMMForm.GemEdChange(Sender: TObject);
begin
if pRec <> nil then
 begin
  bPSave := true;
  pRec^.Gem := GemEd.Value;
 end;
end;

procedure THMMForm.LumberEdChange(Sender: TObject);
begin
if pRec <> nil then
 begin
  bPSave := true;
  pRec^.Lumber := LumberEd.Value;
 end;
end;

procedure THMMForm.MercuryEdChange(Sender: TObject);
begin
if pRec <> nil then
 begin
  bPSave := true;
  pRec^.Mercury := MercuryEd.Value;
 end;
end;

procedure THMMForm.OreEdChange(Sender: TObject);
begin
if pRec <> nil then
 begin
  bPSave := true;
  pRec^.Ore := OreEd.Value;
 end;
end;

procedure THMMForm.SulferEdChange(Sender: TObject);
begin
if pRec <> nil then
 begin
  bPSave := true;
  pRec^.Sulfer := SulferEd.Value;
 end;
end;

procedure THMMForm.GoldEdChange(Sender: TObject);
begin
if pRec <> nil then
 begin
  bPSave := true;
  pRec^.Gold := GoldEd.Value;
 end;
end;

procedure THMMForm.SaveCurrentHero;
var
 //i: integer;
 pos: LongInt;
 hTmp: ^THeroRec;
 rec: Array[0..181] of Char;
begin
if hRec <> nil then
 begin
 if MessageDlg('Save changed hero data?',mtInformation,
    [mbYes, mbNo], 0) = mrYes then
   begin
    New(hTmp);
    hTmp^ := hRec^;
    pos := FindStr(fhandle,hTmp^.Name);
    {pos := }_llseek(fhandle,pos,0);
    StrMove(rec,PChar(hTmp),SizeOf(THeroRec));
    {pos := }_lwrite(fhandle,rec,SizeOf(THeroRec));
    Dispose(hTmp);
    bHSave := false;
   end;

 end;
end;

procedure THMMForm.SaveCurrentPLayers;
var
 i: integer;
 pos: LongInt;
 pTmp: ^TPlayerRec;
 rec: Array[0..188] of Char;
begin
if pRec <> nil then
 begin
 if MessageDlg('Save changed player data?',mtInformation,
    [mbYes, mbNo], 0) = mrYes then
   begin
    New(pTmp);
    for i:=0 to 3 do
     begin
      pTmp := Players.Items[i];
      pos := FindStr(fhandle,pTmp^.Name);
      {pos := }_llseek(fhandle,pos,0);
      StrMove(rec,PChar(pTmp),SizeOf(TPlayerRec));
      {pos := }_lwrite(fhandle,rec,SizeOf(TPlayerRec));
     end;
    Dispose(pTmp);
    bPSave := false;
   end;

 end;
end;

procedure THMMForm.mSaveClick(Sender: TObject);
begin
 SaveGame;
end;

procedure THMMForm.AttackEdChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.Attack := AttackEd.Value;
 end;
end;

procedure THMMForm.DefenceEdChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.Defence := DefenceEd.Value;
 end;
end;

procedure THMMForm.SpellEdChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.Spell := SpellEd.Value;
 end;
end;

procedure THMMForm.KnowEdChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.Knowledge := KnowEd.Value;
 end;
end;

procedure THMMForm.ExpEdChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.Experience := ExpEd.Value;
 end;
end;

procedure THMMForm.Unit1EdChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.U1Num := Unit1Ed.Value;
 end;
end;

procedure THMMForm.Unit2EdChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.U2Num := Unit2Ed.Value;
 end;
end;

procedure THMMForm.Unit3EdChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.U3Num := Unit3Ed.Value;
 end;
end;

procedure THMMForm.Unit4EdChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.U4Num := Unit4Ed.Value;
 end;
end;

procedure THMMForm.Unit5EdChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.U5Num := Unit5Ed.Value;
 end;
end;

procedure THMMForm.Unit1ComboChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.U1Type := Byte(Unit1Combo.ItemIndex) - 1;
  if Unit1Combo.ItemIndex = 0 then
   begin
    Unit1Ed.Value := 0;
    hRec^.U1Num := Unit1Ed.Value;
   end;
 end;
end;

procedure THMMForm.Unit2ComboChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.U2Type := Byte(Unit2Combo.ItemIndex) - 1;
  if Unit2Combo.ItemIndex = 0 then
   begin
    Unit2Ed.Value := 0;
    hRec^.U2Num := Unit2Ed.Value;
   end;
 end;
end;

procedure THMMForm.Unit3ComboChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.U3Type := Byte(Unit3Combo.ItemIndex) - 1;
  if Unit3Combo.ItemIndex = 0 then
   begin
    Unit3Ed.Value := 0;
    hRec^.U3Num := Unit3Ed.Value;
   end;
 end;
end;

procedure THMMForm.Unit4ComboChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.U4Type := Byte(Unit4Combo.ItemIndex) - 1;
  if Unit4Combo.ItemIndex = 0 then
   begin
    Unit4Ed.Value := 0;
    hRec^.U4Num := Unit4Ed.Value;
   end;
 end;
end;

procedure THMMForm.Unit5ComboChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.U5Type := Byte(Unit5Combo.ItemIndex) - 1;
  if Unit5Combo.ItemIndex = 0 then
   begin
    Unit5Ed.Value := 0;
    hRec^.U5Num := Unit5Ed.Value;
   end;
 end;
end;

procedure THMMForm.SpellComboChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.Spells[SpellListBox.ItemIndex] := Byte(SpellCombo.ItemIndex) - 1;
  if SpellCombo.ItemIndex = 0 then
   begin
    SpellNumEd.Value := 0;
    hRec^.SpellNum[SpellListBox.ItemIndex] := SpellNumEd.Value;
   end;

 end;
end;

procedure THMMForm.SpellNumEdChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  if SpellCombo.ItemIndex > 0 then
    hRec^.SpellNum[SpellListBox.ItemIndex] := SpellNumEd.Value
  else
    hRec^.SpellNum[SpellListBox.ItemIndex] := 0;
 end;
end;

procedure THMMForm.ArtfComboChange(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  hRec^.Artifacts[ArtfListBox.ItemIndex] := Byte(ArtfCombo.ItemIndex) - 1;
 end;
end;

procedure THMMForm.mCopyClick(Sender: TObject);
begin
if hRec <> nil then
  begin
   New(hCopyRec);
   hCopyRec^ := hRec^;
  end;
end;

procedure THMMForm.mPasteClick(Sender: TObject);
var
 i: integer;
begin
 if hCopyRec <> nil then
  begin
    hRec^.Attack := hCopyRec^.Attack;;
    hRec^.Defence := hCopyRec^.Defence;
    hRec^.Spell := hCopyRec^.Spell;
    hRec^.Knowledge := hCopyRec^.Knowledge;
    hRec^.Experience := hCopyRec^.Experience;
    hRec^.U1Type := hCopyRec^.U1Type;
    hRec^.U2Type := hCopyRec^.U2Type;
    hRec^.U3Type := hCopyRec^.U3Type;
    hRec^.U4Type := hCopyRec^.U4Type;
    hRec^.U5Type := hCopyRec^.U5Type;
    hRec^.U1Num := hCopyRec^.U1Num;
    hRec^.U2Num := hCopyRec^.U2Num;
    hRec^.U3Num := hCopyRec^.U3Num;
    hRec^.U4Num := hCopyRec^.U4Num;
    hRec^.U5Num := hCopyRec^.U5Num;
    for i:=0 to 12 do hRec^.Artifacts[i] := hCopyRec^.Artifacts[i];
    for i:=0 to 28 do hRec^.Spells[i] := hCopyRec^.Spells[i];
    for i:=0 to 28 do hRec^.SpellNum[i] := hCopyRec^.SpellNum[i];
    hRec^.SpellBook := hCopyRec^.SpellBook;
    FillHeroRecord;
    bHSave := true;
  end;
end;

procedure THMMForm.SpellBookClick(Sender: TObject);
begin
if hRec <> nil then
 begin
  bHSave := true;
  if SpellBook.Checked then
    hRec^.SpellBook := $25
  else
    hRec^.SpellBook := $FF;
 end;
end;

procedure THMMForm.GamePageChange(Sender: TObject);
var
  //sb: TStringBuffer;
  pos: Longint;
  rec: Array[0..188] of Char;
  i: Integer;
begin
with Sender as TPageControl do
 begin
  if (ActivePage.TabIndex = 0) then
   begin
    PLayers := TList.Create;
    PlayerListBox.Clear;
   end;
  if(fhandle >0) and (ActivePage.TabIndex = 0) then
    begin
     for i:=0 to 3 do
      begin
       pos := FindStr(fhandle,cPNames[i]);
       _llseek(fhandle,pos,0);
       _lread(fhandle,@rec,SizeOf(TPlayerRec));
       New(pRec);
       StrMove(PChar(pRec),rec,SizeOf(TPlayerRec));
       Players.Add(pRec);
       PlayerListBox.Items.Add(StrPas(pRec^.Name));
      end;
     PlayerListBox.ItemIndex := 0;
     FillPlayerEdits;
    end;
 end;
end;

procedure THMMForm.HeroNameComboChange(Sender: TObject);
var
  sb: TStringBuffer;
  pos: longint;
  rec: Array[0..181] of Char;
  HeroName: Array[0..16] of Char;
  //x: integer;
begin
if (bHSave) then SaveCurrentHero;
if fhandle <0 then
 begin
  CDirDlg := TCDirDlg.Create(self);
  CDirDlg.ShowModal;
  CDirDlg.Free;
  if CDirDlg.ModalResult = mrOk then
   begin
    if FileExists(ExpandFileName(SavFil)) then
     begin
      sb.str := ExpandFileName(SavFil) + #0;
      fhandle := _lopen(sb.cArray,OF_READWRITE + OF_SHARE_EXCLUSIVE);
     end;
   end;
end;
if(fhandle > 0) then
 begin
  ClearHeroData;
  StrPCopy(HeroName,HeroNameCombo.Items[HeroNameCombo.ItemIndex]);
  pos := FindStr(fhandle,HeroName);
  if pos > 0 then
  begin
   _llseek(fhandle,pos,0);
   _lread(fhandle,@rec,SizeOf(THeroRec));
   New(hRec);
   StrMove(PChar(hRec),rec,SizeOf(THeroRec));
   FillHeroRecord;
   bHSave := false;
  end
 end;
end;

procedure THMMForm.mAboutClick(Sender: TObject);
begin
 AboutDlg.Execute(secret);
end;

procedure THMMForm.FormActivate(Sender: TObject);
begin
 if (GetStartDate=0) then SetStartDate(Date);
 if (not IsRegistered(secret)) and (IsExpired) then
  MessageDlg('Your' +IntToStr(Period) + ' days evaluation period has expired!', mtInformation, [mbOk], 0);
end;

initialization
  secret := secret + 'H' + 'M' + 'M';   // Product - HMM
  secret := secret + '7' + 'C' + 'D';   // Year - 1997
  secret := secret + '3' + 'F' + 'C';   // Month and Day - 1020
end.
