
private _gate = param [0];

private _light = {
	private _gate = param [0];
	private _actived = param [1, false];

	if ((typeOf _gate) == "PA_stargate_tauri") then {
		if (_actived) then {
			_gate setObjectTexture [1, "#(rgb,8,8,3)color(1,0,0,1)"];
			_gate setObjectTexture [3, "#(rgb,8,8,3)color(1,0,0,1)"];
			_gate setObjectTexture [5, "#(rgb,8,8,3)color(1,0,0,1)"];
			_gate setObjectTexture [7, "#(rgb,8,8,3)color(1,0,0,1)"];
			_gate setObjectTexture [13, "#(rgb,8,8,3)color(1,0,0,1)"];
			_gate setObjectTexture [15, "#(rgb,8,8,3)color(1,0,0,1)"];
			_gate setObjectTexture [17, "#(rgb,8,8,3)color(1,0,0,1)"];
		} else {
			_gate setObjectTexture [1, "#(rgb,8,8,3)color(0.05,0,0,1)"];
			_gate setObjectTexture [3, "#(rgb,8,8,3)color(0.05,0,0,1)"];
			_gate setObjectTexture [5, "#(rgb,8,8,3)color(0.05,0,0,1)"];
			_gate setObjectTexture [7, "#(rgb,8,8,3)color(0.05,0,0,1)"];
			_gate setObjectTexture [13, "#(rgb,8,8,3)color(0.05,0,0,1)"];
			_gate setObjectTexture [15, "#(rgb,8,8,3)color(0.05,0,0,1)"];
			_gate setObjectTexture [17, "#(rgb,8,8,3)color(0.05,0,0,1)"];
		};
	} else {
		if (_actived) then {
			_gate setObjectTexture [0, "#(rgb,8,8,3)color(0,0.5,1,1)"];
			_gate setObjectTexture [1, "#(rgb,8,8,3)color(0,0.5,1,1)"];
			_gate setObjectTexture [2, "#(rgb,8,8,3)color(0,0.5,1,1)"];
			_gate setObjectTexture [3, "#(rgb,8,8,3)color(0,0.5,1,1)"];
			_gate setObjectTexture [6, "#(rgb,8,8,3)color(0,0.5,1,1)"];
			_gate setObjectTexture [7, "#(rgb,8,8,3)color(0,0.5,1,1)"];
			_gate setObjectTexture [8, "#(rgb,8,8,3)color(0,0.5,1,1)"];
		} else {
			_gate setObjectTexture [0, "#(rgb,8,8,3)color(0,0,0.05,1)"];
			_gate setObjectTexture [1, "#(rgb,8,8,3)color(0,0,0.05,1)"];
			_gate setObjectTexture [2, "#(rgb,8,8,3)color(0,0,0.05,1)"];
			_gate setObjectTexture [3, "#(rgb,8,8,3)color(0,0,0.05,1)"];
			_gate setObjectTexture [6, "#(rgb,8,8,3)color(0,0,0.05,1)"];
			_gate setObjectTexture [7, "#(rgb,8,8,3)color(0,0,0.05,1)"];
			_gate setObjectTexture [8, "#(rgb,8,8,3)color(0,0,0.05,1)"];
		};
	};
};

if ((typeOf _gate) == "PA_stargate_tauri") then {
	[_gate, false] call _light;

	_gate setObjectTexture [20, "\pa_stargate_dhd\texture\stargate_tauri\glyphs.paa"];
	_gate setObjectTexture [21, "\pa_stargate_dhd\texture\stargate_tauri\innerr.paa"];
} else {
	[_gate, false] call _light;
	
	_gate setObjectTexture [10, "\pa_stargate_dhd\texture\stargate_goauld\SGI_portedesetoiles_co.paa"];
};
