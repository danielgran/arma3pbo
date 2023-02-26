private[

  "_stmt",
  "_result",
  "_check",
  "_return"

];


params[

  ["_databaseID", 0, [1]],
  ["_key", "", ["a"]]

];




_stmt = format["delete:%1:%2", _databaseID, _key];
_databaseResult = "A3Redis" callExtension _stmt;

_check = call compile _databaseResult;

_return = false;

if(_check) then {_return = true;};

_return;








































//
