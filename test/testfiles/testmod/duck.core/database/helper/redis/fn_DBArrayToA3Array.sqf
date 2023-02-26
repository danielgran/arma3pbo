private [
  "_dataType",
  "_insert",
  "_return",
  "_value"

];

_return = [];

params[

  ["_schema", []],
  ["_playerSafe", []]

];

diag_log "================================================";
diag_log "============MYSQLDBARRAYTOA3ARRAY===============";
diag_log format["_schema = %1", _schema];
diag_log format["_playerSafe = %1", _playerSafe];
diag_log "================================================";

{

    _dataType = _x select 1;
    _insert = "";
    _value = _playerSafe select _forEachIndex;

    diag_log format["CORE:DBARRAYTOA3ARRAY: _value = %1", _value];
    diag_log format["CORE:DBARRAYTOA3ARRAY: _dataType = %1", _dataType];

    _insert = [_value, _dataType] call duc_core_redis_fnc_DBValToA3Val;

    _return pushBack _insert;

} forEach _schema;

diag_log _return;

_return;