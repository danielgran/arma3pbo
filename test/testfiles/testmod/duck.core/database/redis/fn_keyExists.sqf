params[

  ["_databaseID", 0, [1]],
  ["_key", "", ["a"]]

];

private _stmt = format["exists:%1:%2", _databaseID, _key];
private _databaseResult = "A3Redis" callExtension _stmt;

private _check = call compile _databaseResult;

private _return = false;

if(_check) then {_return = true;};

_return;