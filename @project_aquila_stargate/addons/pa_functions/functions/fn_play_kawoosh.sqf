// pasg_fnc_play_kawoosh
// this function is used to create the kawoosh effect for the gate
// params = [gate]

private _gate = param [0];

sleep 0.9; // wait for gate to open (900 miliseconds)

if (((typeOf _porte) == "PA_stargate_tauri") and ((_porte animationPhase 'anim_iris1') == 1)) exitWith {}; // exit if the iris of the gate is closed

private _particle_gate = "#particlesource" createVehicleLocal (getPosATL _gate); // create particle source at the gate

// define colors
_gray = [[0.2,0.3,0.5,0.2],[0.3,0.3,0.6,0.2],[0.2,0.2,0.4,0.1],[0.1,0.3,0.5,0.3]];
_blue_1 = [[0.8,0.7,0.7,0.1],[0.9,1.0,0.9,0.2],[0.8,0.8,1.0,0.2],[0.95,0.8,1.0,0.1]];
_blue_2 = [[0.9,1.0,0.9,0.2],[0.9,1.0,0.9,0.2],[0.9,1.0,0.9,0.2],[0.9,1.0,0.9,0.2]];

// define 3D particle object
_shape = "A3\data_f\ParticleEffects\Universal\smoke.p3d";

_j = 0;

_x_size = 5.2;
_life_time = 2.8;

private _gate_direction = (getDir _gate);

// create the kawoosh effect for the gate in function of the gate direction
if (((_gate_direction > 315) or (_gate_direction <= 45)) or ((_gate_direction > 135) and (_gate_direction <= 225))) then { // if the gate is oriented in north and south direction
	if ((_gate_direction > 315) or (_gate_direction <= 45)) then { // if the gate is oriented in north direction
		_x = 0;
		_y = 0;
		_z = -0.5;

		while {_j < 14} do
		{
			_i = 0;

			while {_i < 11} do
			{
				if(true)then
				{
					_z =_z-.03;

					_life_time =_life_time-0.01;
					_x_size = _x_size+0.015;

					_timer = 0.5;

					_size = random (_x_size);
					_size = [_size, _size*0.6];
					drop [_shape, "", "Billboard", _timer, _life_time, [_x, _z,_y +  3.4], [0,0,0], 1, 0.2, 0.157, 0.00, _size, _gray, [0], 0.1, 0.02, "", "", _particle_gate];
					
					_size = random (_x_size);
					_size = [_size, _size*0.6];
					drop [_shape, "", "Billboard", _timer, _life_time, [_x, _z,_y +  3.4], [0,0,0], 0.5, 0.2, 0.157, 0.00, _size, _blue_1, [0], 0.1, 0.02, "", "", _particle_gate];

					_size = random (_x_size);
					_size = [_size, _size*0.6];
					drop [_shape, "", "Billboard", _timer, _life_time, [_x, _z,_y +  3.4], [0,0,0], 3, 0.2, 0.157, 0.00, _size, _blue_2, [0], 0.1, 0.02, "", "", _particle_gate];
				};

				_i = _i + 1;
			};

			sleep .001;

			_j = _j + 1;
		};
	} 
	else { // if the gate is oriented in south direction
		_x = 0;
		_z = +0.5;
		_y = 0;

		while {_j < 14} do
		{
			_i = 0;

			while {_i < 11} do
			{
				if(true)then
				{
					_z =_z+.03;

					_life_time =_life_time-0.01;
					_x_size = _x_size+0.015;

					_timer = 0.5;

					_size = random (_x_size);
					_size = [_size, _size*0.6];
					drop [_shape, "", "Billboard", _timer, _life_time, [_x, _z,_y +  3.4], [0,0,0], 1, 0.2, 0.157, 0.00, _size, _gray, [0], 0.1, 0.02, "", "", _particle_gate];

					_size = random (_x_size);
					_size = [_size, _size*0.6];
					drop [_shape, "", "Billboard", _timer, _life_time, [_x, _z,_y +  3.4], [0,0,0], 0.5, 0.2, 0.157, 0.00, _size, _blue_1, [0], 0.1, 0.02, "", "", _particle_gate];

					_size = random (_x_size);
					_size = [_size, _size*0.6];
					drop [_shape, "", "Billboard", _timer, _life_time, [_x, _z,_y +  3.4], [0,0,0], 3, 0.2, 0.157, 0.00, _size, _blue_2, [0], 0.1, 0.02, "", "", _particle_gate];
				};

				_i = _i + 1;
			};

			sleep .001;

			_j = _j + 1;
		};
	};
} 
else { // if the gate is oriented in east and west direction
	if ((_gate_direction > 45) and (_gate_direction <= 135)) then { // if the gate is oriented in east direction
		_x = -0.5;
		_z = 0;
		_y = 0;

		while {_j < 14} do
		{
			_i = 0;

			while {_i < 11} do
			{
				if(true)then
				{
					_x =_x-.03;

					_life_time =_life_time-0.01;
					_x_size = _x_size+0.015;

					_timer = 0.5;

					_size = random (_x_size);
					_size = [_size, _size*0.6];
					drop [_shape, "", "Billboard", _timer, _life_time, [_x, _z,_y +  3.4], [0,0,0], 1, 0.2, 0.157, 0.00, _size, _gray, [0], 0.1, 0.02, "", "", _particle_gate];

					_size = random (_x_size);
					_size = [_size, _size*0.6];
					drop [_shape, "", "Billboard", _timer, _life_time, [_x, _z,_y +  3.4], [0,0,0], 0.5, 0.2, 0.157, 0.00, _size, _blue_1, [0], 0.1, 0.02, "", "", _particle_gate];

					_size = random (_x_size);
					_size = [_size, _size*0.6];
					drop [_shape, "", "Billboard", _timer, _life_time, [_x, _z,_y +  3.4], [0,0,0], 3, 0.2, 0.157, 0.00, _size, _blue_2, [0], 0.1, 0.02, "", "", _particle_gate];
				};

				_i = _i + 1;
			};

			sleep .001;

			_j = _j + 1;
		};
	} 
	else { // if the gate is oriented in west direction
		_x = +0.5;
		_z = 0;
		_y = 0;

		while {_j < 14} do
		{
			_i = 0;

			while {_i < 11} do
			{
				if(true)then
				{
					_x =_x+.03;

					_life_time =_life_time-0.01;
					_x_size = _x_size+0.015;

					_timer = 0.5;

					_size = random (_x_size);
					_size = [_size, _size*0.6];
					drop [_shape, "", "Billboard", _timer, _life_time, [_x, _z,_y +  3.4], [0,0,0], 1, 0.2, 0.157, 0.00, _size, _blue_1, [0], 0.1, 0.02, "", "", _particle_gate];

					_size = random (_x_size);
					_size = [_size, _size*0.6];
					drop [_shape, "", "Billboard", _timer, _life_time, [_x, _z,_y +  3.4], [0,0,0], 0.5, 0.2, 0.157, 0.00, _size, _gray, [0], 0.1, 0.02, "", "", _particle_gate];

					_size = random (_x_size);
					_size = [_size, _size*0.6];
					drop [_shape, "", "Billboard", _timer, _life_time, [_x, _z,_y +  3.4], [0,0,0], 3, 0.2, 0.157, 0.00, _size, _blue_1, [0], 0.1, 0.02, "", "", _particle_gate];
				};

				_i = _i + 1;
			};

			sleep .001;

			_j = _j + 1;
		};
	};
};

	

