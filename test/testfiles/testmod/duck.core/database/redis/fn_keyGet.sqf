private[

  "_stmt",
  "_databaseResult"

];

params[

  ["_databaseID", 0, [1]],
  ["_key", "", [""]],
  ["_dataType", "", [""]]

];


_stmt = format ["get:%1:%2", _databaseID, _key];
_databaseResult = "A3Redis" callExtension _stmt;

_databaseResult = [_databaseResult, _dataType] call duc_core_redis_fnc_DBValToA3Val;
_databaseResult;