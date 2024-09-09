// pasg_fnc_dhd_controller
// this function for play the animation of the dhd and enter the address to the remote gate
// params = [gate, remote_gate, dhd, address with 7 logos]

private _gate = param [0];
private _remote_gate = param [1];
private _dhd = param [2];
private _address_logos_list = param [3];

// check parameters is not nil
if (isNil "_gate") throw "Undefined gate in parameters";
if (isNil "_remote_gate") throw "Undefined remote gate in parameters";
if (isNil "_dhd") throw "Undefined dhd in parameters";
if (isNil "_address_logos_list") throw "Undefined address logos list in parameters";

// check parameters is valid
if ((count _address_logos_list) != 7) throw "Address logos list must have 6 elements";
if ((typeOf _dhd) != "PA_dhd") throw "Undefined dhd in parameters";

_gate setVariable ["is_open_gate", false, true];
_remote_gate setVariable ["is_open_gate", false, true];
_gate setVariable ["is_in_setup_gate", true, true];
_remote_gate setVariable ["is_in_setup_gate", true, true];

// define the list of sounds for the dhd
private _dhd_sounds = ["dhd_1", "dhd_2", "dhd_3", "dhd_4", "dhd_5", "dhd_6"];

// play the dhd sounds and enter in dhd the address to the remote gate
{
	// get random sound
	private _dhd_sound = selectRandom _dhd_sounds;

 	// change the material of the dhd for simulate pushing the button of the address logo on the dhd
	[_dhd, [(_x select 3), "a3\data_f\lights\car_headlight.rvmat"]] remoteExec ["setObjectMaterial", 0];

	// play sound
	[_dhd, [_dhd_sound, 30]] remoteExec ["say3D", 0];
	
	sleep 0.8;
} forEach _address_logos_list;

sleep 0.5;

// play sound of middle button pushing
[_dhd, ["push_dhd_middle_button", 30]] remoteExec ["say3D", 0];

// play animation on the dhd for pushing the middle button
[_dhd, ["anim_aquila", 1]] remoteExec ["animate", 0];

// change the material of the dhd for simulate pushing the button on the dhd
[_dhd, [12, "a3\data_f\lights\car_headlight.rvmat"]] remoteExec ["setObjectMaterial", 0];

sleep 0.5;

// play animation on the dhd for unpushing the middle button
[_dhd, ["anim_aquila", 0]] remoteExec ["animate", 0];

sleep 0.5;

// change the material of the dhd for simulate unpushing the button on the dhd
[_dhd, [12, "\sgi_dhd\Rvmat\sgi_dhd.rvmat"]] remoteExec ["setObjectMaterial", 0];

sleep 0.5;

// change the material of the dhd for simulate unpushing all buttons on the dhd
for "_i" from 0 to 38 do { // change rvmat of 
	[_dhd, [_i, "\sgi_dhd\Rvmat\sgi_dhd.rvmat"]] remoteExec ["setObjectMaterial", 0];
};
