program Hmmed;

{$MODE Delphi}

uses
  Forms, Interfaces,
  Hmmain in 'src/hmmain.pas' {MainForm},
  Hotpot in 'src/hotpot.pas',
  DskUtil in 'src/dskutil.pas',
  About in 'src/about.pas' {AboutBox};

{$R *.res}

begin
  Application.Title := 'Heroes of M&M Save Editor';
  Application.CreateForm(THMMForm, HMMForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
