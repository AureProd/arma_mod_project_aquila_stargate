// Retrieve the planet data from the configuration
private _planets = getArray (configFile  >> "CfgPlanets" >> "gates");

// diag_log format ["Planets array: %1", _planets];

// Iterate over each planet to retrieve the DHD and execute the function
{
    private _dhd = call compile (_x select 3); // Compile the DHD ID to an object reference

    diag_log format ["Setting up door '%1'", _dhd]; // Display the setup message

    for "_i" from 0 to 38 do {
        _dhd setObjectMaterial [_i, "\sgi_dhd\Rvmat\sgi_dhd.rvmat"];
    };

    [_dhd] call pasg_fnc_add_action; // Execute the function on the DHD
} forEach _planets;

diag_log "Stargate mod setup finished"; // Indicate that the setup process has begun