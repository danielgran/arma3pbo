private[

  "_result",
  "_getAnyMagazines",
  "_findRecurse",
  "_class"

];

params[
  ["_vehicle", objNull]
];

_result = [];
_findRecurse = {
    private ["_root", "_class", "_path", "_currentPath"];
    _root = (_this select 0);
    _path = +(_this select 1);
    for "_i" from 0 to count _root -1 do {
        _class = _root select _i;
        if (isClass _class) then {
            _currentPath = _path + [_i];
            {
                _result set [count _result, [_x, _currentPath]];
            } foreach getArray (_class >> "weapons");
            _class = _class >> "turrets";
            if (isClass _class) then {
               systemChat str(_currentPath);
                [_class, _currentPath] call _findRecurse;
            };
        };
    };
};

_class = (
    configFile >> "CfgVehicles" >> (
        switch (typeName _this) do {
            case "STRING" : {_this};
            case "OBJECT" : {typeOf _this};
            default {nil}
        }
    ) >> "turrets"
);

[_class, []] call _findRecurse;
_result;