private[
  "_return",
  "_dataType",
  "_counter",
  "_arrayCount",
  "_mysqlvar",
  "_dbArray"
];

_return = "UPDATE ";

params[

  ["_schema", []],
  ["_dataSet", []], // the dataset according to the schema
  ["_table", "", ["a"]], // the table
  ["_where", "", ["a"]] // where statement

];

_return = _return + _table + " SET ";

_arrayCount = count _schema;

_dbArray = [_schema, _dataSet] call duc_core_mysql_fnc_A3ArrayToDBArray;


{
  _mysqlvar = _x select 0;
  _dataType = _x select 1;

  _value = _dbArray select _forEachIndex;
  _insert = "";
  _counter = _forEachIndex + 1;

  _insert = _insert + _mysqlvar + " = ";

  if (_dataType isEqualTo "STRING" || _dataType isEqualTo "DBENUM" || _dataType isEqualTo "DBARRAY") then
  {
    _insert = _insert + "'" + _value + "'";
  } else
  {
    _insert = _insert + _value;
  };



  if (_counter < _arrayCount) then {
      _insert = _insert + ", ";
  };

  _return = _return + _insert;



} forEach _schema;

_return = _return + " WHERE " + _where;

diag_log _return;


_return;