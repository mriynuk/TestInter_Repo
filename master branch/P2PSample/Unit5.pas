unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TTestFrmNew = class(TForm)
    IniBtn: TButton;
    Memo1: TMemo;
    procedure IniBtnClick(Sender: TObject);
    function  PortSIP_initialize ();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestFrmNew: TTestFrmNew;

implementation

{$R *.dfm}

procedure TTestFrmNew.IniBtnClick(Sender: TObject);
begin

PortSIP_initialize(SIPCallbackEvent:THandle;
                            transportType: integer;
                            appLogLevel: integer;
                            logFilePath: PAnsiChar;
                            maximumLines: integer;
                            agent: PAnsiChar;
                            STUNServer: PAnsiChar;
                            STUNServerPort: integer;
                            var ErrorCode: integeruseVirtualAudioDevice: Boolean;
                            useVirtualVideoDevice: Boolean; ):THandle; cdecl;
end;

end.
