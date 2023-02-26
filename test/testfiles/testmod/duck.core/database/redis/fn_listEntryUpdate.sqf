params[
  ["_databaseID", 0, [0]],
  ["_key", "", [""]],
  ["_className", "", [""]],
  "_entry",
  "_newValue"
];

_schema = getArray(configFile >> "CfgSettings" >> "Classes" >> _classname);
_entryIndex = -1;
_datatype = "";
{
  if ((_x select 0) isEqualTo _entry) exitWith
  {
    _entryIndex = _forEachIndex;
    _datatype = (_x select 1);
  };
} foreach _schema;


_value = [_newValue, _datatype] call DUC_CORE_redis_fnc_A3ValToDBVal;

_stmt = format["listupdate:%1:%2:%3:%4", _databaseID, _key, _entryIndex, _value];
_databaseResult = "A3Redis" callExtension _stmt;

if (_databaseResult isEqualTo "TRUE") exitWith { true; };

false;