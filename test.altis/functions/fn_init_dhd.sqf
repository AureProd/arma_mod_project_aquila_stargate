// pasg_fnc_init_dhd

private _dhd = param [0];

for "_i" from 0 to 38 do {
	_dhd setObjectMaterial [_i, "\sgi_dhd\Rvmat\sgi_dhd.rvmat"];
};

[_dhd] call pasg_fnc_add_action;
