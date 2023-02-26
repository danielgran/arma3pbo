params[
  ["_databaseID", 0, [1]],
  ["_key", "", [""]],
  ["_className", []],
  ["_entry", ""]
];

// Check if key exists in Redis DB
_stmt = format ["get:%1:%2", _databaseID, _key];
if !([_databaseID, _key] call DUC_CORE_redis_fnc_keyExists) exitWith { objNull; };

_schema = getArray(configFile >> "CfgSettings" >> "Classes" >> _classname);
_toAdd = [];

_entryIndex = -1;
_datatype = "";
{
  if ((_x select 0) isEqualTo _entry) exitWith
  {
    _entryIndex = _forEachIndex;
    _datatype = (_x select 1);
  };
} foreach _schema;


_databaseResult = "A3Redis" callExtension format ["listget:%1:%2:%3", _databaseID, _key, _entryIndex];
_databaseResult = [_databaseResult, _datatype] call duc_core_redis_fnc_DBValToA3Val;
_databaseResult;