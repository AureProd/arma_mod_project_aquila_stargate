// pasg_fnc_stargate_controller
// this function is the controller of the stargate and the remote gate when the gate is open or close
// params = [gate, remote gate]

private _gate = param [0];
private _remote_gate = param [1, nil];

if (isNil "_gate") throw "Undefined local gate in parameters";
if (isNil "_remote_gate") then {
	_remote_gate = (_gate getVariable ['remote_gate', nil]); // define remote gate if is not define in parameters

	if (isNil "_remote_gate") throw "Undefined remote gate in parameters and from local gate variable";
};

// get planets and address logos from the config file 'planets_config'
private _planets = (getArray (missionConfigFile >> "CfgPlanets" >> "gates"));
private _address_logos = (getArray (missionConfigFile >> "CfgPlanets" >> "liste_logos"));

// find the index of the gate in the planets array
private _gate_planet_index = _planets findIf {
	(call compile (_x select 2)) == _gate
};

// find the index of the remote gate in the planets array
private _remote_gate_planet_index = _planets findIf {
	(call compile (_x select 2)) == _remote_gate
};

// exit if the gate or the remote gate is not found
if ((_gate_planet_index == -1) or (_remote_gate_planet_index == -1)) throw "Undefined local gate or remote gate in parameters";

// get the gate and the remote gate from the planets config array
private _gate_planet = _planets select _gate_planet_index;
private _remote_gate_planet = _planets select _remote_gate_planet_index;

// create the array with the address logos for the remote gate
private _address_logos_list = [];

{
	private _id_address_logo = _x;

	// find the id of the address logo in the address logos config array
	private _address_logo_index = _address_logos findIf {
		_id_address_logo == (_x select 0)
	};

	// push the address logo to the array with the address logos for the remote gate
	_address_logos_list pushBack (_address_logos select _address_logo_index);
} forEach (_remote_gate_planet select 5);

if ((count _address_logos_list) != 7) throw "The remote gate address logos is not correct in the config file";

// get the dhd props from the planets config array
private _dhd = (call compile (_gate_planet select 4));

// if the local gate and the remote gate are not open and not in the initialization
if (!(_gate getVariable ['is_open_gate', false]) and !(_remote_gate getVariable ['is_open_gate', false]) and !(_gate getVariable ['is_in_setup_gate', false]) and !(_remote_gate getVariable ['is_in_setup_gate', false])) then {
	[_gate, _remote_gate, _dhd, _address_logos_list] call pasg_fnc_dhd_controller; // run dhd controller function

	[_gate, _remote_gate, _address_logos_list] call pasg_fnc_ring_controller;

	sleep 0.3; // wait 300 miliseconds

	[_gate, ["open_gate", 50]] remoteExec ["say3D", 0]; // play sound in 3D for all players of server of the openning gate for local gate
	[_remote_gate, ["open_gate", 50]] remoteExec ["say3D", 0]; // play sound in 3D for all players of server of the openning gate for remote gate

	if ((_gate animationPhase 'anim_iris1') == 0) then { // if iris is open
		[_gate] remoteExec ["pasg_fnc_play_kawoosh", 0]; // play kawoosh animation for local gate
		[_gate] remoteExec ["pasg_fnc_create_gate_light", 0]; // create light for local gate
	};

	if ((_remote_gate animationPhase 'anim_iris1') == 0) then { // if iris is open
		[_remote_gate] remoteExec ["pasg_fnc_play_kawoosh", 0]; // play kawoosh animation for remote gate
		[_remote_gate] remoteExec ["pasg_fnc_create_gate_light", 0]; // create light for remote gate
	};

	// define variable of local and entry gate (is_in_setup_gate / remote_gate / is_entry_gate)
	_gate setVariable ["is_in_setup_gate", true, true];
	_gate setVariable ['remote_gate', _remote_gate, true];
	_gate setVariable ['is_entry_gate', true, true];

	// define variable of remote gate (is_in_setup_gate / remote_gate)
	_remote_gate setVariable ["is_in_setup_gate", true, true];
	_remote_gate setVariable ['remote_gate', _remote_gate, true];

	for "_i" from 1 to 17 step 1 do {
		if ((typeOf _gate) == "PA_stargate_tauri") then { // if the gate object if type of the tauri gate
			// set texture for all players in the texture layer number 18 for the local
			[_gate, [18, format ["\pa_functions\pictures\stargate\init_%1.paa", _i]]] remoteExec ["setObjectTexture", 0];
		} 
		else {
			// set texture for all players in the texture layer number 9 for the local
			[_gate, [9, format ["\pa_functions\pictures\stargate\init_%1.paa", _i]]] remoteExec ["setObjectTexture", 0];
		};

		if ((typeOf _remote_gate) == "PA_stargate_tauri") then { // if the gate object if type of the tauri gate
			// set texture for all players in the texture layer number 18 for the remote gate
			[_remote_gate, [18, format ["\pa_functions\pictures\stargate\init_%1.paa", _i]]] remoteExec ["setObjectTexture", 0];
		} 
		else {
			// set texture for all players in the texture layer number 9 for the remote gate
			[_remote_gate, [18, format ["\pa_functions\pictures\stargate\init_%1.paa", _i]]] remoteExec ["setObjectTexture", 0];
		};

		sleep 0.05; // wait 50 miliseconds
	};

	if ((typeOf _gate) == "PA_stargate_tauri") then { // if the gate object if type of the tauri gate
		// set video of event_horizon in texture for all players in the texture layer number 18 for the local
		[_gate, [18, "\pa_videos\horison_events.ogv"]] remoteExec ["setObjectTexture", 0];
	} 
	else {
		// set video of event_horizon in texture for all players in the texture layer number 9 for the local
		[_gate, [9, "\pa_videos\horison_events.ogv"]] remoteExec ["setObjectTexture", 0];
	};

	if ((typeOf _remote_gate) == "PA_stargate_tauri") then { // if the gate object if type of the tauri gate
		// set video of event_horizon in texture for all players in the texture layer number 18 for the remote gate
		[_remote_gate, [18, "\pa_videos\horison_events.ogv"]] remoteExec ["setObjectTexture", 0];
	} 
	else {
		// set video of event_horizon in texture for all players in the texture layer number 9 for the remote gate
		[_remote_gate, [9, "\pa_videos\horison_events.ogv"]] remoteExec ["setObjectTexture", 0];
	};
	
	// define variable of local and entry gate (is_in_setup_gate / is_open_gate)
	_gate setVariable ["is_in_setup_gate", false, true];
	_gate setVariable ['is_open_gate', true, true];

	// define variable of remote gate (is_in_setup_gate / is_open_gate)
	_remote_gate setVariable ["is_in_setup_gate", false, true];
	_remote_gate setVariable ['is_open_gate', true, true];

	// loop while the gate is open
	[] spawn {
		while { (_gate getVariable ['is_open_gate', false]) } do {
			if (missionNamespace getVariable ["stop_video_gate_tunnel", true]) then { // don't re-run the video if player is in the gate tunnel
				// play the video on the gate for the event horizon
				["\pa_videos\horison_events.ogv", [10, 10], [1,1,1,1], "stop_video_gate_event_horizon", [0,0,0,0], false] remoteExec ["BIS_fnc_playVideo", 0]; // check if this function need to run in server side and not in client side 
			};

			sleep (60 * 4); // wait the time of the video (4 minutes)
		}; 
	};
} 
else { // if the local gate or the remote gate are open or in the initialization
	// if the local gate are not open and not in the initialization
	if (!(_gate getVariable ['is_open_gate', false]) and !(_gate getVariable ['is_in_setup_gate', false])) then {
		[_gate, _remote_gate, _dhd, _address_logos_list] call pasg_fnc_dhd_controller; // play dhd animation

		[_gate, _remote_gate, _address_logos_list] call pasg_fnc_ring_controller; // play ring animation

		sleep 1; // wait 1 seconde

		[_gate, ["close_gate", 50]] remoteExec ["say3D", 0]; // sound in 3D for all players of server of the closing gate for local gate 

		if ((_gate animationPhase 'anim_iris1') == 0) then { // if iris is open
			[_gate, false] remoteExec ["pasg_fnc_create_gate_light", 0]; // create light for the local gate
		};

		// reset all variables of the local gate
		_gate setVariable ["is_in_setup_gate", false, true];
		_gate setVariable ['is_open_gate', false, true];
		_gate setVariable ['remote_gate', nil, true];
		_gate setVariable ['is_entry_gate', false, true];

		hint "The stargate is open"; // print text for explain to player why the gate cant open
	} 
	else { // if the local gate and the remote gate are open or in the initialization
		sleep 0.5; // wait 1/2 second

		{ // delete all lightpoint links with the local gate
			if((typeOf _x) == "#lightpoint") then {
				deleteVehicle _x;
			};
		} forEach (attachedObjects _gate);

		{ // delete all lightpoint links with the remote gate
			if((typeOf _x) == "#lightpoint") then {
				deleteVehicle _x;
			};
		} forEach (attachedObjects _remote_gate);

		private _light_location = _gate selectionPosition ["ring", "Memory"]; // get the location of the light from the gate object
		private _remote_light_location = _remote_gate selectionPosition ["ring", "Memory"]; // get the location of the remote light from the remote gate object
		private _light = nil;
		private _remote_light = nil;

		if ((_gate animationPhase 'anim_iris1') == 0) then { // if iris is open
			// create the local light at the local light location
			_light = "#lightpoint" createVehicleLocal (getPos _gate);  
			_light setLightBrightness 0.1;  
			_light setLightAmbient [1, 1, 1];  
			_light setLightColor [1, 1, 1];  
			_light setLightDayLight true;
			_light lightAttachObject [_gate, _light_location];
		};

		if ((_remote_gate animationPhase 'anim_iris1') == 0) then { // if iris is open
			// create the remote light at the remote light location
			_remote_light = "#lightpoint" createVehicleLocal (getPos _remote_gate);  
			_remote_light setLightBrightness 0.1;  
			_remote_light setLightAmbient [1, 1, 1];  
			_remote_light setLightColor [1, 1, 1];  
			_remote_light setLightDayLight true;
			_remote_light lightAttachObject [_remote_gate, _remote_light_location];
		};

		[_gate, ["close_gate", 50]] remoteExec ["say3D", 0]; // play sound of close the local gate in 3D and for all players
		
		[_remote_gate, ["close_gate", 50]] remoteExec ["say3D", 0]; // play sound of close the remote gate in 3D and for all players

		for "_i" from 17 to 1 step -1 do {
			if ((typeOf _gate) == "PA_stargate_tauri") then { // if the gate object if type of the tauri gate
				// set texture for all players in the texture layer number 18 for the local gate
				[_gate, [18, format ["\pa_functions\pictures\stargate\init_%1.paa", _i]]] remoteExec ["setObjectTexture", 0];
			} 
			else {
				// set texture for all players in the texture layer number 18 for the local gate
				[_gate, [9, format ["\pa_functions\pictures\stargate\init_%1.paa", _i]]] remoteExec ["setObjectTexture", 0];
			};

			if ((typeOf _remote_gate) == "PA_stargate_tauri") then { // if the gate object if type of the tauri gate
				// set texture for all players in the texture layer number 18 for the remote gate
				[_remote_gate, [18, format ["\pa_functions\pictures\stargate\init_%1.paa", _i]]] remoteExec ["setObjectTexture", 0];
			} 
			else {
				// set texture for all players in the texture layer number 18 for the remote gate
				[_remote_gate, [9, format ["\pa_functions\pictures\stargate\init_%1.paa", _i]]] remoteExec ["setObjectTexture", 0];
			};

			sleep 0.1; // wait 100 milliseconds
		};

		// delete created light after the close of local gate
		if (!(isNil "_light")) then {
			deleteVehicle _light;
		};

		// delete created light after the close of remote gate
		if (!(isNil "_lightBis")) then {
			deleteVehicle _remote_light;
		};

		[_gate] call pasg_fnc_disabled_chevrons_lights; // disable chevrons lights for the local gate
		[_remote_gate] call pasg_fnc_disabled_chevrons_lights; // disable chevrons lights for the remote gate

		if ((typeOf _gate) == "PA_stargate_tauri") then { // if the gate object if type of the tauri gate
			// clear the texture for all players in the texture layer number 18 for the local gate
			[_gate, [18, ""]] remoteExec ["setObjectTexture", 0];
		} 
		else {
			// clear the texture for all players in the texture layer number 9 for the local gate
			[_gate, [9, ""]] remoteExec ["setObjectTexture", 0];
		};

		if ((typeOf _remote_gate) == "PA_stargate_tauri") then { // if the gate object if type of the tauri gate
			// clear the texture for all players in the texture layer number 18 for the remote gate
			[_remote_gate, [18, ""]] remoteExec ["setObjectTexture", 0];
		} 
		else {
			// clear the texture for all players in the texture layer number 9 for the remote gate
			[_remote_gate, [9, ""]] remoteExec ["setObjectTexture", 0];
		};

		// reset all variables of the local gate
		_gate setVariable ["is_in_setup_gate", false, true];
		_gate setVariable ['is_open_gate', false, true];
		_gate setVariable ['remote_gate', nil, true];
		_gate setVariable ['is_entry_gate', false, true];

		// reset all variables of the remote gate
		_remote_gate setVariable ["is_in_setup_gate", false, true];
		_remote_gate setVariable ['is_open_gate', false, true];
		_remote_gate setVariable ['remote_gate', nil, true];
		_remote_gate setVariable ['is_entry_gate', false, true];
	};
};



