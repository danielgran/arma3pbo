private[

  "_return",
  "_inserts"

];

params[
  
  "_table",
  "_schema",
  "_object"

];


_return = format["INSERT INTO %1 (", _table];

// INSERT INTO hsn (
_inserts = "";
{
  if !(_forEachIndex isEqualTo (count _schema -1)) then
  {
    _inserts = _inserts + format["%1, ", _x select 0];
  } else
  {
    _inserts = _inserts + format["%1) ", _x select 0];
  };

} forEach _schema;

_return = _return + _inserts + "VALUES (";

// "INSERT INTO hsn (a,b,c) VALUES ("

_inserts = "";
{
  _newInsert = objNull;
  switch ((_schema select _forEachIndex) select 1) do
  {
    case "BOOL":
    {
      if(_x isEqualTo true) then
      {
        _newInsert = 1;
      } else
      {
        _newInsert = 0;
      };
    };
    case "DBARRAY":
    {
      _newInsert = [_x] call duc_core_fnc_mresArrayToString;
    };
    default
    {
      _newInsert = _x
    };
  };


  if !(_forEachIndex isEqualTo (count _schema - 1)) then
  {
    _return = _return + format["%1, ", _newInsert];
  } else
  {
    _return = _return + format["%1);", _newInsert];
  };

} forEach _object;

_return;