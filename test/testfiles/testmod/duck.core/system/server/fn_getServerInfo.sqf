#include "duck.core/script_macros.hpp"
private
[

  "_query",
  "_databaseResult",
  "_toStore"

];



_query = "SELECT * FROM list_servers";
_databaseResult = _query call duc_core_mysql_fnc_queryHandler;

_toStore = [];


{
  _id = _x select 0;
  _name = _x select 1;
  _map = _x select 2;
  _ipv4 = _x select 3;
  _ipv6 = _x select 4;
  _port = _x select 5;

  _return = [_id, _name, _map, _ipv4, _ipv6, _port];

  _toStore pushBack _return;


} forEach _databaseResult;
uiNamespace setVariable ["SDUC_V_SERVERLIST", _toStore];
_query = "SELECT * FROM list_maps";

_databaseResult = [_query] call duc_core_mysql_fnc_queryHandler;


_toStore = [];
{
  _id = _x select 0;
  _name = _x select 1;

  _return = [_id, _name];

  _toStore pushBack _return;


} forEach _databaseResult;
uiNamespace setVariable ["SDUC_V_MAPLIST", _toStore];
