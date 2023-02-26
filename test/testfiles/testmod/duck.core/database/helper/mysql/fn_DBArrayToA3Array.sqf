private[

  "_return",
  "_dataType",
  "_value",
  "_insert"

];

_return = [];

params[
  "_schema",
  "_dbarray"
];

diag_log "================================================";
diag_log "============MYSQLDBARRAYTOA3ARRAY===============";
diag_log format["_schema[%1] = %2", count _schema, _schema];
diag_log format["_dbarray[%1] = %2", count _dbarray, _dbarray];
diag_log "================================================";

//{
//  _dataType = (_x select 1);
//  _value = _dbarray select _forEachIndex;
//  _insert = "";
//
//
//  switch (_dataType) do
//  {
//
//    case ("STRING"): {
//      _insert = _value;
//    };
//
//    case ("SCALAR"): {
//      _insert = _value;
//    };
//
//    case ("BOOL"): {
//      if(_value isEqualTo 1) exitWith {_insert = true;};
//      _insert = false;
//    };
//
//
//    case ("DBARRAY"): {
//      //enogh here?
//      diag_log _value;
//      if(count (_value splitString "") < 8) exitWith {_insert = []};
//      _insert = [_value] call duc_core_fnc_mresStringToArray;
//    };
//
//    case ("DBENUM"):
//    {
//      _insert = str(_value);
//    };
//
//  };
//
//
//  _return pushBack _insert;
//
//} forEach _schema;


{
  _datatype = (_schema select _forEachIndex) select 1;
  diag_log _x;
  diag_log _datatype;
  
} forEach _dbarray;

diag_log _return;
_return;