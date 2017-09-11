
Unit About;

{$MODE Delphi}

Interface

Uses Classes, Graphics, Forms, Controls, StdCtrls,
Buttons, ExtCtrls;

Type 
  TAboutBox = Class(TForm)
    Panel1: TPanel;
    OKButton: TBitBtn;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    Private 
    { Private declarations }
    Public 
    { Public declarations }
  End;

Var 
  AboutBox: TAboutBox;

Implementation

{$R *.lfm}

End.
