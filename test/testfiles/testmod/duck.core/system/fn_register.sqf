#include "duck.core/meta/macros.h"
params[
  ["_steamID64", "", [""]]
];

if (_steamID64 isEqualTo "") exitWith { objNull; };

private _pattern = "XXXX0000";
private _key = format ["auth#%1", _steamID64];

private _schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
private _databaseID = [_schemaCfg, "playerdata"] call DUC_CORE_fnc_getConfigEntry;

private _token = [_pattern] call duc_core_fnc_generateID;
[_databaseID, _key, _token] call duc_core_redis_fnc_keySet;

_token;