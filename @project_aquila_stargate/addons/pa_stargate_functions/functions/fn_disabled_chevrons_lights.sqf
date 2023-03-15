// pasg_fnc_disabled_chevrons_lights
// this function is used to enable/disable chevron lights on the gate
// params = [gate, enabled]

private _gate = param [0];

if ((typeOf _gate) == "PA_stargate_tauri") then { // if the gate is the tauri gate
	[_gate, [1, "#(rgb,8,8,3)color(0.05,0,0,1)"]] remoteExec ["setObjectTexture", 0];
	[_gate, [3, "#(rgb,8,8,3)color(0.05,0,0,1)"]] remoteExec ["setObjectTexture", 0];
	[_gate, [5, "#(rgb,8,8,3)color(0.05,0,0,1)"]] remoteExec ["setObjectTexture", 0];
	[_gate, [7, "#(rgb,8,8,3)color(0.05,0,0,1)"]] remoteExec ["setObjectTexture", 0];
	[_gate, [13, "#(rgb,8,8,3)color(0.05,0,0,1)"]] remoteExec ["setObjectTexture", 0];
	[_gate, [15, "#(rgb,8,8,3)color(0.05,0,0,1)"]] remoteExec ["setObjectTexture", 0];
	[_gate, [17, "#(rgb,8,8,3)color(0.05,0,0,1)"]] remoteExec ["setObjectTexture", 0];
} 
else { // if the gate is the goauld gate
	[_gate, [0, "#(rgb,8,8,3)color(0,0,0.05,1)"]] remoteExec ["setObjectTexture", 0];
	[_gate, [1, "#(rgb,8,8,3)color(0,0,0.05,1)"]] remoteExec ["setObjectTexture", 0];
	[_gate, [2, "#(rgb,8,8,3)color(0,0,0.05,1)"]] remoteExec ["setObjectTexture", 0];
	[_gate, [3, "#(rgb,8,8,3)color(0,0,0.05,1)"]] remoteExec ["setObjectTexture", 0];
	[_gate, [6, "#(rgb,8,8,3)color(0,0,0.05,1)"]] remoteExec ["setObjectTexture", 0];
	[_gate, [7, "#(rgb,8,8,3)color(0,0,0.05,1)"]] remoteExec ["setObjectTexture", 0];
	[_gate, [8, "#(rgb,8,8,3)color(0,0,0.05,1)"]] remoteExec ["setObjectTexture", 0];
};