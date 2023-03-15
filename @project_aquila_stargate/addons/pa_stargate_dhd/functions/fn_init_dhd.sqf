
private _dhd = param [0];

for "_i" from 0 to 38 do {
	_dhd setObjectMaterial [_i, "\pa_stargate_dhd\rvmat\sgi_dhd.rvmat"];
};

[_dhd] execVM '\pa_stargate_functions\functions\fn_add_action.sqf';
