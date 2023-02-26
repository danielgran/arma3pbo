private["_dataSet", "_playerID","_rank","_banned","_xp","_level","_money","_inventory","_loadouts"];

_dataSet = _this select 0;

if (_dataSet isEqualTo false) exitWith {}; // Daten


hint str(_dataSet);

ducp_ID     = _dataSet select 0; // internal player identification
ducp_name     = _dataSet select 1; // name
ducp_rank     = _dataSet select 2; // rank
ducp_banned   = _dataSet select 3; // banned
ducp_xp     = _dataSet select 4; // xp
ducp_level     = _dataSet select 5; //level
ducp_money     = _dataSet select 6; //money
ducp_kills     = _dataSet select 7; //kills
ducp_teamkills   = _dataSet select 8; //teamkills
ducp_deaths   = _dataSet select 9; //deaths
