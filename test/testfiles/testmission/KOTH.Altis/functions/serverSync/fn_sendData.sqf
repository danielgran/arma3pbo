/*
  Sends Full Dataset to the Server
  Author: Duckfine

//<params> remoteExec ["DUCDB_fnc_syncDataDB", 2];


  0: name
  1: xp
  2: level
  3: money
  4: kills
  5: teamkills
  6: deaths
  
  
  
  1: player
  2: dataset
  
*/
private["_player", "_dataset"];
_player = player;

_dataset = [];
_dataset set [0, (name _player)];
_dataset set [1, ducp_xp];
_dataset set [2, ducp_level];
_dataset set [3, ducp_money];
_dataset set [4, ducp_kills];
_dataset set [5, ducp_teamkills];
_dataset set [6, ducp_deaths];

[_player, _dataset] remoteExec ["DUCDB_fnc_syncDataDB", 2];


