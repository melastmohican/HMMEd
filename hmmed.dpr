program Hmmed;

uses
  Forms,
  Hmmain in 'src/hmmain.pas' {MainForm},
  Dirdlg in 'src/dirdlg.pas' {CDirDlg},
  Hotpot in 'src/hotpot.pas',
  About in 'src/about.pas' {AboutBox};

{$R *.RES}

begin
  Application.Title := 'Heroes of M&M Save Editor';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCDirDlg, CDirDlg);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
