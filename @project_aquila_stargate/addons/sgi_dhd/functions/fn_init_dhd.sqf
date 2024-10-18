// pasg_fnc_init_dhd

private _dhd = param [0];

//diag_log format ["Setting up door '%1'", _dhd]; // Display the setup message

for "_i" from 0 to 38 do {
	_dhd setObjectMaterial [_i, "\sgi_dhd\Rvmat\sgi_dhd.rvmat"];
};

[_dhd] call pasg_fnc_add_action;
