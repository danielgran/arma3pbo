params[
	"_className",
	"_key"
];

_tableName = "";
_accessorName = "";

_tableMeta = getArray(configFile >> "CfgSettings" >> "mysqlmeta" >> "tableMeta");
{
  if ((_x select 0) isEqualTo _className) exitWith {
	_tableName = _x select 1;
	_accessorName = _x select 2;
  }
} forEach _tableMeta;

_query = format ["DELETE FROM %1 WHERE %2 = '%3'", _tableName, _accessorName, _key];
_result = _query call duc_core_mysql_fnc_queryHandler;

if (_result isNotEqualTo []) exitWith {
  false;
};
true;

