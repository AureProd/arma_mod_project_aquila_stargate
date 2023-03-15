private _dhd_parametter = param [0]; // _dhd

// params -> [id, text, code, condition, param]
private _add_actions = 
{
	private _id = param [0];
	private _text = param [1, ""];
	private _code = param [2, {hint "An error is occured";}];
	private _condition = param [3, "true"];
	private _param = param [4, []];

	private _id_shop = _id addAction [_text, _code, _param, 1.5, true, true, "", _condition, 10];
};

{
	if (_dhd == _dhd_parametter) exitWith {}; 

	private _planet = _x;
	private _gate = (call compile (_x select 2));
	private _dhd = (call compile (_x select 3));

	if (((typeOf _gate) == "PA_stargate_tauri") or ((typeOf _gate) == "PA_stargate_goauld_iris")) then {
		[_dhd, "Close iris", {
			[((_this select 3) select 0)] spawn pasg_fnc_on_off_iris;
		}, format ["((%1 animationPhase 'anim_iris1') == 0) and (alive _this)", _gate], [_gate]] call _add_actions;

		[_dhd, "Open iris", {
			[((_this select 3) select 0)] spawn pasg_fnc_on_off_iris;
		}, format ["((%1 animationPhase 'anim_iris1') == 1) and (alive _this)", _gate], [_gate]] call _add_actions;
	};

	[_dhd, "Close stagate", {
		[((_this select 3) select 0)] call pasg_fnc_stargate_controller;
	}, format ["(%1 getVariable ['is_open_gate', false]) and (alive _this) and (!(%2 getVariable ['is_in_setup_gate', false]))", _gate, _gate], [_gate]] call _add_actions;

	{
		private _remote_gate = (call compile (_x select 3));

		if ((_x select 0) != (_planet select 0)) then {
			[_dhd, (format ["Open stargate to : ", (_x select 1)]), {
				[((_this select 3) select 0),((_this select 3) select 1)] call pasg_fnc_stargate_controller;
			}, format ["(!(%1 getVariable ['is_open_gate', false])) and (!(%2 getVariable ['is_in_setup_gate', false])) and (alive _this)", _gate, (_x select 0)], [_gate, _remote_gate]] call _add_actions;
		};
	} forEach (getArray (missionConfigFile >> "docs_planetes" >> "planetes" >> "liste"));

	[_gate] spawn pasg_fnc_player_transport_detection;

	if ((_gate getVariable ['is_open_gate', false]) and (!(_gate getVariable ['is_in_setup_gate', false]))) then {
		[_gate] call pasg_fnc_create_gate_light;
		[_gate, true] call pasg_fnc_disabled_chevrons_lights;

		if ((typeOf _gate) == "PA_stargate_tauri") then {
			_gate setObjectTexture [18, "\pa_videos\horison_events.ogv"];
		} else {
			_gate setObjectTexture [9, "\pa_videos\horison_events.ogv"];
		};

		private _remote_gate = (_gate getVariable ['remote_gate', objNull]);

		private _planets = (getArray (missionConfigFile >> "CfgPlanets" >> "gates"));
		private _logos = (getArray (missionConfigFile >> "CfgPlanets" >> "liste_logos"));

		private _index_planet = _planets findIf {
			(call compile (_x select 2)) == _gate
		};

		private _index_remote_planet = _planets findIf {
			(call compile (_x select 2)) == _remote_gate
		};

		if ((_index_planet != -1) and (_index_remote_planet != -1)) then {
			private _planet = _planets select _index_planet;
			private _remote_planet = _planets select _index_remote_planet;
			private _planets_logos = [];

			{
				private _indexPlaneteTableau = _x;

				private _index_logo = _logos findIf {
					_indexPlaneteTableau == (_x select 0)
				};

				_planets_logos pushBack (_logos select _index_logo);
			} forEach (_remote_planet select 5);

			private _dhd = (call compile (_planet select 4));

			if ((typeOf _dhd) == "PA_stargate_tauri") then {
				{
					[_dhd, [(_x select 3), "a3\data_f\lights\car_headlight.rvmat"]] remoteExec ["setObjectMaterial", 0];
				} forEach _planets_logos;
			};
		};
	};
} forEach (getArray (missionConfigFile >> "CfgPlanets" >> "gates"));
