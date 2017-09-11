unit HotPot;

interface

uses
  SysUtils, WinTypes, WinProcs;
type
  { Common data types}
  { var sb: TStringBuffer;
  sb.Count := Byte( Actual lentgh of cArray)
  sb.cArray := address where charracters are copied
  }
  TStringBuffer = record
   case Integer of
     0: (bCount: Byte; cArray : Array[0..254] of Char;);
     1: (str: String[255]);
  end;

  THeroRec = record
   Name: Array[0..16] of Char;
   Short: Array[0..8] of Char;
   NoIdea: Byte;
   HeroNum: Byte;
   Reserv1: Array[0..10] of Byte;
   Experience: LongInt;
   Reserv2: Array[0..2] of Byte;
   Attack: Byte;
   Defence: Byte;
   Spell: Byte;
   Knowledge: Byte;
   Reserv3: Array [0..34] of Byte;
   U1Type: Byte;
   U2Type: Byte;
   U3Type: Byte;
   U4Type: Byte;
   U5Type: Byte;
   U1Num: SmallInt;
   U2Num: SmallInt;
   U3Num: SmallInt;
   U4Num: SmallInt;
   U5Num: SmallInt;
   Spells: Array[0..28] of Byte;
   SpellNum: Array[0..28] of Byte;
   SpellBook: Byte;
   Artifacts: Array[0..12] of Byte;
   Rest: Array[0..9] of Byte;
  end;

  TPlayerRec = record
   Name: Array[0..7] of Char;
   Reserv: Array[0..116] of Byte;
   Crystal: Longint;
   Gem: Longint;
   Lumber: Longint;
   Mercury: Longint;
   Ore: Longint;
   Sulfer: Longint;
   Gold: Longint;
   Rest: Array[0..35] of Byte;
  end;

function FindStr(hfile: Integer; fstr: PChar) : LongInt;

implementation

function FindStr(hfile: Integer; fstr: PChar) : Longint;
var
 sb: TStringBuffer;
 buff: Array[0..1023] of char;
 //P: PChar;
 i,j: integer;
 //pos: integer;
 bFound: Boolean;
 filpos,filmax: Longint;
begin
Result:= 0;
filmax := _llseek(hfile,0,2);
filpos := _llseek(hfile,0,0);
_lread(hfile,@buff,1024);
sb.str := StrPas(fstr);
while filmax > filpos do
begin
 i := 0;
 bFound := false;
 while i<1024 do
  begin
   if buff[i] = sb.cArray[0] then
    begin
     bFound := false;
     for j:= 0 to sb.bCount-1 do
       if buff[i+j] = sb.cArray[j] then bFound := true
       else bFound := false;
     if buff[i+j+1] <> #0 then bFound := false;
    end; {if buff[i] = sb.cArray[0]}
   if not bFound then
    inc(i)
   else
    begin
     Result:= (filpos + i);
     Exit;
    end;
 end; {while i<1024}
 filpos := _llseek(hfile,0,1);
 _lread(hfile,@buff,1024);
end; {while filmax > filpos}
end;

{End of file}
end.
