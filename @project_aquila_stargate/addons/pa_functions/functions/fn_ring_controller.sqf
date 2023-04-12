// pasg_fnc_ring_controller
// this function is used to control the ring animation of the gate
// params = [gate, remote gate, address with 7 logos]

private _gate = param [0];
private _remote_gate = param [1];
private _address_logos_list = param [2];

// check parameters is not nil
if (isNil "_gate") exitWith {hint "Undefined gate in parameters"};
if (isNil "_remote_gate") exitWith {hint "Undefined remote gate in parameters"};
if (isNil "_address_logos_list") exitWith {hint "Undefined address logos list in parameters"};

// check parameters is valid
if ((count _address_logos_list) != 7) exitWith {hint "Address logos list must have 6 elements"};

if ((typeOf _gate) == "PA_stargate_tauri") then { // if is the tauri gate
	if ((_gate getVariable ['is_in_setup_gate', false]) and !(_gate getVariable ['is_open_gate', false])) then { // if is in setup gate but not open gate
		sleep 0.5; // wait 1/2 second to start the ring animation

		// play animation of the ring for different logos
		[_gate, ((_address_logos_list select 0) select 2), 3] call pasg_fnc_play_ring_tauri;
		[_gate, ((_address_logos_list select 1) select 2), 5] call pasg_fnc_play_ring_tauri;
		[_gate, ((_address_logos_list select 2) select 2), 7] call pasg_fnc_play_ring_tauri;
		[_gate, ((_address_logos_list select 3) select 2), 13] call pasg_fnc_play_ring_tauri;
		[_gate, ((_address_logos_list select 4) select 2), 15] call pasg_fnc_play_ring_tauri;
		[_gate, ((_address_logos_list select 5) select 2), 17] call pasg_fnc_play_ring_tauri;
		[_gate, ((_address_logos_list select 6) select 2), 1] call pasg_fnc_play_ring_tauri;
	};
} 
else { // if is the goauld gate
	if ((_gate getVariable ['is_in_setup_gate', false]) and !(_gate getVariable ['is_open_gate', false])) then { // if is in setup gate but not open gate
		sleep 0.5; // wait 1/2 second to start the ring animation

		// play animation of the ring for different logos
		[_gate, ((_address_logos_list select 0) select 1), 8] call pasg_fnc_play_ring_goauld;
		[_gate, ((_address_logos_list select 1) select 1), 7] call pasg_fnc_play_ring_goauld;
		[_gate, ((_address_logos_list select 2) select 1), 6] call pasg_fnc_play_ring_goauld;
		[_gate, ((_address_logos_list select 3) select 1), 3] call pasg_fnc_play_ring_goauld;
		[_gate, ((_address_logos_list select 4) select 1), 2] call pasg_fnc_play_ring_goauld;
		[_gate, ((_address_logos_list select 5) select 1), 1] call pasg_fnc_play_ring_goauld;
		[_gate, ((_address_logos_list select 6) select 1), 0] call pasg_fnc_play_ring_goauld;
	};
};

