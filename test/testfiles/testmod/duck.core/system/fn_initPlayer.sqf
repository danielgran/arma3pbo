private[

  "_exists",
  "_playerBlueprint",
  "_schema"

];


params[

  ["_steamID64", "", [""]],
  ["_playerName", []]

];


diag_log "=========initPlayer========";
diag_log format["_steamID64 = %1", _steamID64];
diag_log format["_playerName = %1", _playerName];
diag_log "===========================";



// MySQL check player

_exists = _steamID64 call duc_core_mysql_fnc_playerCheck;

if (_exists) then {

  diag_log "[DUCK:POSTINIT] Player already exists in Database :-)";

} else
{
  // create new player
  [_steamID64, _playerName] call duc_core_mysql_fnc_playerNew;
  diag_log "[DUCK:POSTINIT] Player was created in MYSQL Database";
};


_schema = getArray(configFile >> "CfgSettings" >> "Classes" >> "player");
_schemaCfg = getArray(configFile >> "CfgSettings" >> "db_life" >> "Redis" >> "dbIDs");
_databaseID = [_schemaCfg, "playerdata"] call DUC_CORE_fnc_getConfigEntry;

// If player is in redis database
if ([_databaseID, _steamID64] call duc_core_redis_fnc_keyExists) then
{
  // save dump to mysql
  _playerSafe = [_databaseID, _steamID64, _schema] call duc_core_redis_fnc_listFetch;

  [_schema, _playerSafe, "players", format["steamid64 = '%1'", _steamID64]] call duc_core_mysql_fnc_datasetUpdate;

} else
{
  // Get Players info and put it into redis

  //Fetch playerdata from MySQL
  _dump = [_steamID64, _schema] call duc_core_mysql_fnc_datasetFetch;
//todo  [_databaseID, _steamID64, _dump] call duc_core_redis_fnc_listAdd;
};