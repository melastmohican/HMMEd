unit Dirdlg;

interface

uses
  WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, FileCtrl, Dialogs, SysUtils;

type
  TCDirDlg = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label1: TLabel;
    PathEd: TEdit;
    DirList: TDirectoryListBox;
    DriveComb: TDriveComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FileList: TFileListBox;
    RadioStd: TRadioButton;
    RadioCmg: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FileListChange(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure RadioCmgClick(Sender: TObject);
    procedure RadioStdClick(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CDirDlg: TCDirDlg;

implementation

uses HMMain;
{$R *.DFM}

procedure TCDirDlg.FormCreate(Sender: TObject);
begin
{PathEd.Text := MainForm.SavFil;}
PathEd.Text := '*.gm*';
FileList.Mask := '*.gm*';
RadioStd.Checked := true;
end;

procedure TCDirDlg.FileListChange(Sender: TObject);
begin
PathEd.Text := FileList.Filename;
end;

procedure TCDirDlg.OKBtnClick(Sender: TObject);
begin
HMMForm.SavFil := ExpandFileName(PathEd.Text);
end;

procedure TCDirDlg.RadioCmgClick(Sender: TObject);
begin
PathEd.Text := '*.cgm';
FileList.Mask := '*.cgm';
end;

procedure TCDirDlg.RadioStdClick(Sender: TObject);
begin
PathEd.Text := '*.gm*';
FileList.Mask := '*.gm*';
end;

end.
