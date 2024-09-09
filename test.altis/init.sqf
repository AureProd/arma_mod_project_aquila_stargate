// Retrieve the planet data from the configuration
private _planets = getArray (configFile >> "CfgPlanets" >> "gates");

// Iterate over each planet to retrieve the DHD and execute the function
{
    private _dhd = call compile (_x select 3); // Retrieve the DHD ID for the planet
    [_dhd] execVM "pasg_fnc_add_action"; // Execute the function on the DHD
} forEach _planets;
