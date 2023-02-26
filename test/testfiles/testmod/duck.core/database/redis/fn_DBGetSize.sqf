params[
  ["_databaseID", 0, [1]]
];


private _stmt = format["dbsize:%1", _databaseID];
private _databaseResult = "A3Redis" callExtension _stmt;

private _databaseResult = [_databaseResult, "SCALAR"] call duc_core_redis_fnc_DBValToA3Val;
_databaseResult;

