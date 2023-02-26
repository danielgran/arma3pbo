player sideChat "Data sent";

_dataSet = [];

_dataSet set [0, ducp_name];
_dataSet set [1, ducp_xp];
_dataSet set [2, ducp_level];
_dataSet set [3, ducp_money];
_dataSet set [4, ducp_kills];
_dataSet set [5, ducp_teamkills];
_dataSet set [6, ducp_deaths];

[player, _dataSet] remoteExec ["DUCDB_fnc_syncDataDB", 2];
_dataSet = [];