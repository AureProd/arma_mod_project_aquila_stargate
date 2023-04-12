
private _dhd = param [0];

for "_i" from 0 to 38 do {
	_dhd setObjectMaterial [_i, "\pa_dhd\Rvmat\sgi_dhd.rvmat"];
};

[_dhd] execVM '\pa_functions\functions\fn_add_action.sqf';
