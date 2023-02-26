params[
  "_classname",
  "_array",
  "_key",
  "_value"
];


_schema = getArray(configFile >> "CfgSettings" >> "Classes" >> _classname);
// error trycatching
if (count _array > count _schema) exitWith { false; };

_index = -1;
{
  // if schemas name is equal to the searched name
  if ((_x select 0) isEqualTo _key) exitWith
  {
    _array set [_forEachIndex, _value];
    _index = _forEachIndex;
  };
} forEach _schema;
// not found
if (_index isEqualTo -1) exitWith { false; };

_array;