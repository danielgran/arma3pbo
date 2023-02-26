private[

  "_schema",
  "_content",
  "_moduleName"

];

_moduleName = "PTS";



params[

  ["_token", "", [""]],
  ["_sender", 0, [1]],
  ["_steamID64", "", [""]],
  ["_id", 0, [0]],
  ["_content", [], [[], ""]]

];

switch (_id) do {

    // Init Player so everything is loaded fine
    case (0): { // Send Player to other server

      // content: [_serverTarget, _vehicleName, _vehicleSkin, _playerVelocity]
      [_sender, _steamID64, _content select 0, _content select 1, _content select 2, _content select 3] call DUC_CORE_PTS_fnc_transactPlayer;
    };

    case (1): {

    };

    case (2): {

    };
};

// here return to client

[_token, _moduleName, _id, _content, _sender] call DUC_CORE_NET_fnc_sendClient;































//
