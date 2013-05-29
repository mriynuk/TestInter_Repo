unit Unit3;


interface


type
  TSession = class
  private
    SessionState : Boolean;
    RecvCallState : Boolean;
    HoldState : Boolean;
    ConferenceState : Boolean;
    SessionID : Integer;
  public
    function GetSessionID: Integer;
    function GetSessionState: Boolean;
    function GetRecvCallState: Boolean;
    function GetHoldState: Boolean;
    function GetConferenceState: Boolean;

    procedure SetSessionID(Value: Integer);
    procedure SetSessionState(Value: Boolean);
    procedure SetHoldState(Value: Boolean);
    procedure SetRecvCallState(Value: Boolean);
    procedure SetConferenceState(Value: Boolean);

    procedure Reset();

  end;


implementation


{ TClassData }

function TSession.GetSessionID: Integer;
begin
  Result := SessionID;
end;

function TSession.GetSessionState: Boolean;
begin
  Result := SessionState;
end;

function TSession.GetRecvCallState: Boolean;
begin
  Result := RecvCallState;
end;

function TSession.GetHoldState: Boolean;
begin
  Result := HoldState;
end;


function TSession.GetConferenceState: Boolean;
begin
  Result := ConferenceState;
end;




procedure TSession.SetSessionID(Value: Integer);
begin
    SessionID := Value;
end;

procedure TSession.SetHoldState(Value: Boolean);
begin
    HoldState := Value;
end;

procedure TSession.SetSessionState(Value: Boolean);
begin
    SessionState := Value;
end;


procedure TSession.SetRecvCallState(Value: Boolean);
begin
    RecvCallState := Value;
end;


procedure TSession.SetConferenceState(Value: Boolean);
begin
    ConferenceState := Value;
end;

procedure TSession.Reset();
begin
    SessionID := 0;
    HoldState := False;
    SessionState := False;
    RecvCallState := False;
    ConferenceState := False;
end;

end.


