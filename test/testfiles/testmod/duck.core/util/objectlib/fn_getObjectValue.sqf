params[
  "_class",
  "_object",
  "_key"
];

_schema = getArray(configFile >> "CfgSettings" >> "Classes" >> _class);
// error trycatching
if (count _object < count _schema) exitWith { false; };

_index = -1;
{
  if ((_x select 0) isEqualTo _key) exitWith { _index = _forEachIndex};
} forEach _schema;

if (_index isEqualTo -1) exitWith { objNull; };

_object select _index;