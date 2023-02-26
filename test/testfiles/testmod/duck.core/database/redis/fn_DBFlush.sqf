params[
  ["_databaseID", objNull, [objNull,0]]
];

_return = "";
if (_databaseID == objNull) then {
  for "_i" from 0 to 10 do {
    _return = "A3Redis" callExtension format["dbflush:%1",_i];
  };
} else {
  private _stmt = format["dbflush:%1", _databaseID];
  _return = "A3Redis" callExtension _stmt;
};

_return;