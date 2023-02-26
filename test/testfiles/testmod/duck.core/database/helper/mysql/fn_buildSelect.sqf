private["_return", "_dataType", "_counter", "_arrayCount"];

_return = "SELECT ";

params[

  ["_array", []],
  ["_table", "", ["a"]],
  ["_where", "", ["a"]]

];

_arrayCount = count _array;

{
  _counter = _forEachIndex + 1;
  _value = _x select 0;
  _dataType = _x select 1;
  _return = _return + _value;

  if (_counter < _arrayCount) then {
      _return = _return + ", ";
  };

} forEach _array;

_return = _return + " FROM " + _table;
if !(_where isEqualTo "") then
{
  _return = _return + " WHERE " + _where;
};

_return;