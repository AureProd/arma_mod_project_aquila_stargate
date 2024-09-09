// Retrieve the planet data from the configuration
private _planets = getArray (configFile >> "CfgPlanets" >> "gates");

// Iterate over each planet to retrieve the DHD and execute the function
{
	private _dhd_id = (_x select 3)
    private _dhd = call compile _dhd_id; // Retrieve the DHD ID for the planet
    
	hint format ["Setup door '%1'", _dhd_id];

	[_dhd] execVM "pasg_fnc_add_action"; // Execute the function on the DHD
} forEach _planets;

hint "Started"