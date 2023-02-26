params[

  ["_steamID64",""]

];



private _query = format ["CALL spGetPlayerServerTransaction('%1');", _steamID64];
private _databaseResult = [_query] call duc_core_mysql_fnc_queryHandler;


_schema = getArray(configFile >> "CfgSettings" >> "db_life" >> "tblPlayerServerTransact" >> "schema");
_return = [_schema, _databaseResult] call duc_core_mysql_fnc_DBArrayToA3Array;