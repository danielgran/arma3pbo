params[
  ["_databaseID", 0, [1]],
  ["_key", "", ["a"]],
  ["_className", []]
];

private _object = [_className] call duc_core_fnc_newObject;
private _schema = getArray(configFile >> "CfgSettings" >> "Classes" >> _className);

{
  _valueToAdd = objNull;
  _databaseResult = "A3Redis" callExtension format ["listget:%1:%2:%3", _databaseID, _key, _forEachIndex];
  _valueToAdd = [_databaseResult, _x select 1] call duc_core_redis_fnc_DBValToA3Val;
  _object set [_forEachIndex, _valueToAdd];
} forEach _schema;

_object;