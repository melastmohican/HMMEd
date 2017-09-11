
Unit HotPot;

{$MODE Delphi}

Interface

Uses 
SysUtils;

Type 
  THeroRec = Record
    Name: Array[0..16] Of Char;
    Short: Array[0..8] Of Char;
    NoIdea: Byte;
    HeroNum: Byte;
    Reserv1: Array[0..10] Of Byte;
    Experience: LongInt;
    Reserv2: Array[0..2] Of Byte;
    Attack: Byte;
    Defence: Byte;
    Spell: Byte;
    Knowledge: Byte;
    Reserv3: Array [0..34] Of Byte;
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
    Spells: Array[0..28] Of Byte;
    SpellNum: Array[0..28] Of Byte;
    SpellBook: Byte;
    Artifacts: Array[0..12] Of Byte;
    Rest: Array[0..9] Of Byte;
  End;

  TPlayerRec = Record
    Name: Array[0..7] Of Char;
    Reserv: Array[0..116] Of Byte;
    Crystal: Longint;
    Gem: Longint;
    Lumber: Longint;
    Mercury: Longint;
    Ore: Longint;
    Sulfer: Longint;
    Gold: Longint;
    Rest: Array[0..35] Of Byte;
  End;

Implementation


{End of file}
End.
