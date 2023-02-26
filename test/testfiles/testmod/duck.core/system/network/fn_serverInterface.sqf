#include "duck.core/meta/macros.h"
params[
  ["_sender", objNull],
  ["_steamID64", "", [""]],
  ["_token", "", [""]],
  ["_requestModule", "", [""]],
  ["_requestID", "", ["", 1]],
  ["_content", "", ["", []]]
];

if (_sender isEqualTo objNull) exitWith {
  objNull;
};

#ifdef release
// todo should be equal inform admin if its not
if(_sender != remoteExecutedOwner) exitWith
{ 
  LOG("sender wasnt equal to remoteExecutedOwner", 2);
  false;
};
#endif


// Authentication
if(_token isEqualTo "") exitWith
{
  _generatedToken = _steamID64 call duc_core_sys_fnc_register;
  #ifdef release
  ["", "AUTH", 0, _generatedToken, remoteExecutedOwner] call DUC_CORE_NET_fnc_sendClient;
  #endif
  _generatedToken;
};

// Check for Valid Token
_key = format ["auth#%1", _steamID64];
_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata"] call DUC_CORE_fnc_getConfigEntry;
_databaseResult = [_databaseID, _key, "STRING"] call duc_core_redis_fnc_keyGet;
if (_token isNotEqualTo _databaseResult) exitWith
{
  objNull;
};

if (_content isEqualTo "") exitWith { objNull; };

switch (_requestModule) do {

  // todo every module has its own unique name with 3 chars
  case ("SYS"): {
      [_token, _sender, _steamID64, _requestID, _content] spawn duc_core_sys_fnc_handlerSystem;
  };

  case ("ECO"): {
      [_token, _sender, _steamID64, _requestID, _content] spawn DUC_life_eco_fnc_handlerEconomy;
  };

  // Handling for garages, vehicles on map, upgrading, etc
  case ("VEH"): {

  };

  case ("PTS"):
  {
    [_token, _sender, _steamID64, _requestID, _content] spawn DUC_CORE_PTS_FNC_handlerPTS;
  };
};
