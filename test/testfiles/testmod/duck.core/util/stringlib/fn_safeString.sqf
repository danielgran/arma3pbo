params[
  "_string"
];
private _whiteList = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,. ";

private _string = _string splitString "";
private _whiteList = _whiteList splitString "";

private _returnString = "";
{
  if (_x in _whiteList) then {
    _returnString = _returnString + _x;
  };
} forEach _string;

_returnString;