// Retrieve the planet data from the configuration
private _planets = getArray (configFile >> "CfgPlanets" >> "gates");

// Iterate over each planet to retrieve the DHD and execute the function
{
    private _dhd_id = _x select 3; // Get the DHD ID for the planet
    private _dhd = compile _dhd_id; // Compile the DHD ID to an object reference

    hint format ["Setting up door '%1'", _dhd_id]; // Display the setup message

    [_dhd] execVM "pasg_fnc_add_action"; // Execute the function on the DHD
} forEach _planets;

hint "Setup finished"; // Indicate that the setup process has begun