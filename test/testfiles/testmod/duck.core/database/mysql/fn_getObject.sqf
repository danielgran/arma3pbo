params[
	"_className",
	"_key",
	"_valueName"
];

_classMeta = getArray(configFile >> "CfgSettings" >> "Classes" >> _classname);
_query = "SELECT ";
{
  _query = _query + (_x select 0) + ", ";
} forEach _classMeta;
_queryArray = toArray _query;
_queryArray resize (count _queryArray - 2);
_query = toString _queryArray;
_query = _query + " FROM ";

_tableName = "";
_accessorName = "";
_tableMeta = getArray(configFile >> "CfgSettings" >> "mysqlmeta" >> "tableMeta");
{
  if ((_x select 0) isEqualTo _className) exitWith {
	_tableName = _x select 1;
	_accessorName = _x select 2;
  }
} forEach _tableMeta;
_query = _query + _tableName + " WHERE " + _accessorName + " = '" + _key + "'";
_result = _query call duc_core_mysql_fnc_queryHandler;

_result = [_classMeta, _result select 0] call duc_core_mysql_fnc_DBArrayToA3Array;
_result;