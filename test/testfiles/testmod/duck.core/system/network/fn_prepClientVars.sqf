private[

  "_schema",
  "_schemaCfg",
  "_databaseID",
  "_databaseResult",
  "_return"

];

_return = [];

params[

  ["_steamID64", "", [""]],
  ["_content", ""]

];

// Preperation of client vars related to the player figure (money, etc)

_schema = getArray(configFile >> "CfgSettings" >> "Classes" >> "player");
_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata"] call DUC_CORE_fnc_getConfigEntry;


_databaseResult = [_databaseID, _steamID64, _schema] call duc_core_redis_fnc_listFetch;
// returns ["Prof Bildungsstop",[],"3TLQ9BMS4",123,0,"",[],[],[],[],[],[],true,[],false,0,0,0,0,0,0,0,0,0,0,0,0]

{
    _return pushBack [_x select 0, _databaseResult select _forEachIndex];
} forEach _schema;


// Preperation of Server global vars
_return pushBack ["G_SERVERID", DEF_CORE_CONST_SERVERID];
_return pushBack ["G_SERVERLIST", uiNamespace getVariable "SDUC_V_SERVERLIST"];
_return pushBack ["G_MAPLIST", uiNamespace getVariable "SDUC_V_MAPLIST"];
_return pushBack ["G_LISTITEMS", uiNamespace getVariable "SUDC_V_LISTITEMS"];

_return;
