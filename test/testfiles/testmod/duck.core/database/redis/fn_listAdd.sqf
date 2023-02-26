params[
  ["_databaseID", 0, [1]],
  "_key",
  "_className",
  "_object"
];

_schema = getArray(configFile >> "CfgSettings" >> "Classes" >> _classname);
_toAdd = [];

{
  switch(_x select 1) do
  {
    case ("SCALAR"): {
      _toAdd pushBack ([(_object select _foreachIndex), 10] call duc_core_fnc_numberToString);
    };
    case ("STRING"): {
      _toAdd pushBack (_object select _foreachIndex);
    };
    case ("DBARRAY"): {
      _toAdd pushBack ([_object select _foreachIndex] call duc_core_fnc_mresArrayToString);
    };
    case ("BOOL"): {
      _value = (_object select _foreachIndex);
      if (_value) then {
        _toAdd pushBack "true";
      } else {
        _toAdd pushBack "false";
      };
    };
  };
} foreach _schema;

{
  _stmt = format["listadd:%1:%2:%3", _databaseID, _key, _x];
  "A3Redis" callExtension _stmt;
} forEach _toAdd;