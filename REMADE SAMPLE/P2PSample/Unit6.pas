unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles;

type
  TAddUserForm = class(TForm)
    UserNameEdit: TEdit;
    UserIPEdit: TEdit;
    UserPortEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    AddBtn: TButton;
    CancelBtn: TButton;
    procedure CancelBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddUserForm: TAddUserForm;
  UserFile: TiniFile;

implementation

{$R *.dfm}

uses Unit4;

procedure TAddUserForm.AddBtnClick(Sender: TObject);
var
  appINI: TiniFile;
  FilePath: string;
  PartLine: string;
  j, i: integer;
begin
  FilePath := ExtractFilePath(Application.ExeName) + 'Users.ini';
  UserFile := TiniFile.Create(FilePath);
  j := 1;
  Repeat
    PartLine := UserFile.ReadString('User' + IntToStr(j), 'UserName', '');
    Inc(j);
  Until PartLine = '';
  // appINI := TIniFile.Create(ChangeFileExt(Application.ExeName,'Users.ini')) ;
  try
    UserFile.WriteString('User' + IntToStr(j - 1), 'UserName', UserNameEdit.text);
    UserFile.WriteString('User' + IntToStr(j - 1), 'UserIP', UserIPEdit.text);
    UserFile.WriteString('User' + IntToStr(j - 1), 'UserPort', UserPortEdit.text);
  finally
    appINI.Free;
  end;

  // update users
  i := 1;
  Form4.ListBox1.Clear;
  Repeat
    PartLine := UserFile.ReadString('User' + IntToStr(i), 'UserName', '');
    Form4.ListBox1.Items.Add(PartLine);
    Inc(i);
  Until PartLine = '';
  Form4.ListBox1.Items[i-2]:='=========='
end;

procedure TAddUserForm.CancelBtnClick(Sender: TObject);
begin
   AddUserForm.Close;
end;

end.
