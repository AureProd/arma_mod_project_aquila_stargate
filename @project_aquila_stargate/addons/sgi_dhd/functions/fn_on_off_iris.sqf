// pasg_fnc_on_off_iris
// this function is called for play the animation of the iris in the gate for open or close it
// params = [gate]

private _gate = param [0];

if (!(((typeOf _gate) == "PA_stargate_tauri") or ((typeOf _gate) == "PA_stargate_goauld_iris"))) exitWith {}; // if the gate is not a stargate tauri or goauld with iris, exit

private _animation = 0; // animation level : 0 = open, 1 = close

if ((_gate animationPhase "anim_iris1") == 0) then { // if iris is open
	_animation = 1;

	_gate say3D ["close_iris", 50]; // play sound in 3D for all player of the gate closing
} 
else { // if iris is closed
	_gate say3D ["open_iris", 50]; // play sound in 3D for all player of the gate opening
};

for "_i" from 1 to 22 do { // for each animation in all parts of the iris
	_gate animate [format ["anim_iris%1", _i], _animation]; // play the animation of the iris in the gate
};

sleep 1.5; // wait for the animation to finish (1.5 secounds)

if (_gate getVariable ['is_open_gate', false]) then {
	{ // delete all lightpoint links with the local gate
		if((typeOf _x) == "#lightpoint") then {
			deleteVehicle _x;
		};
	} forEach (attachedObjects _gate);

	if (_animation == 0) then { // if iris is open
		[_gate] remoteExec ["pasg_fnc_create_gate_light", 0];
	};
};
