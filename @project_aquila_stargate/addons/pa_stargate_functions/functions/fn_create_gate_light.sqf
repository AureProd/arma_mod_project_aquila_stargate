// pasg_fnc_create_gate_light
// this function creates a light at the gate event horizon
// params = [gate]

// get gate props from parameters
private _gate = param [0];

// get gate location
private _gate_location = _gate selectionPosition ["ring", "Memory"];

// create light and set attributes and attach to gate
private _light = "#lightpoint" createVehicle (getPos _gate);  
_light setLightBrightness 0.7;  
_light setLightAmbient [0, 0, 0.1];  
_light setLightColor [0, 0, 1];  
_light setLightDayLight true;
_light attachTo [_gate, _gate_location];