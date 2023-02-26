params[
	"_classname"
];

_blueprint = getArray(configFile >> "CfgSettings" >> "Classes" >> _classname);

private _return = [];
{
	switch (_x select 1) do {
		case "STRING": {
			_return pushBack "";
		 };
		case "SCALAR": {
			_return pushBack 0;
		};
		case "DBARRAY": {
			_return pushBack [];
		};
		case "BOOL": {
			_return pushBack false;
		};
		default {
			_return pushBack objNull;
		};
	};
	
} forEach _blueprint;

_return;