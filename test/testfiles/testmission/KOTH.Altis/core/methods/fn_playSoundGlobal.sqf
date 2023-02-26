private[

  "_placeholder01",
  "_placeholder02"

];

params[

  ["_location", [objNull], [[]]],
  ["_radius", 0, [0]],
  ["_cfgName", "", ["a"]]

];

if (_location isEqualTo objNull) exitWith { false; };

{
  if(isPlayer _x) then 
  {
    _distance = (_x distance _location);
    _vol = 1 - (_distance / _radius); // linear volume

    if (owner _x > 2) then
    {
      [_cfgName] remoteExec ["playSound", owner _x]; // TODO : "playSound" in der RemoteExec unter Anyone eintragen.
    };
  };
} forEach nearestObjects [_location, [], _radius, false];