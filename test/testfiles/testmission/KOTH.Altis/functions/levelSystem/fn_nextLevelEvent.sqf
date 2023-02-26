private["_player", "_exp"];

_exp = ducp_xp;
_player = player;


[_player, _exp] remoteExec ["DUCLVL_fnc_sendLevelinfoCl", 2];

call DUCSYNC_fnc_sendData;