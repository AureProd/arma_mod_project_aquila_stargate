class CfgPlanets
{
	gates[] = { // planet id / planet name / stargate object id / dhd object id / list of logos address for the ring of the stargate (5 logos max)
		{1, "Tau'ry", "porte_tauri", "dhd_tauri", {6, 30, 11, 19, 15, 37, 1}},
		{82, "Qa'al", "porte_qa_al", "dhd_qa_al", {20, 3, 16, 5, 31, 10, 25}},
	};

	liste_logos[] = { // logo id / value for SGI stargate / value for SGA stargate / number of dhd logo
		{1, 0, 0, 0}, // Earth
		{2, 0.025, 0.025, 1}, // Crater
		{3, 0.049, 0.049, 2}, // Virgo
		{4, 0.075, 0.075, 3}, // Bootes
		{5, 0.102, 0.102, 4}, // Centaurus
		{6, 0.127, 0.127, 5}, // Libra
		{7, 0.152, 0.152, 6}, // Serpens Caput
		{8, 0.179, 0.179, 7}, // Norma
		{9, 0.205, 0.205, 8}, // Scorpio
		{10, 0.230, 0.230, 9}, // Cra
		{11, 0.255, 0.255, 10}, // Scutum
		{12, 0.281, 0.281, 11}, // Sagittarius
		{13, 0.308, 0.308, 12}, // Aquila <-- ne pas mettre dans une adresse
		{14, 0.334, 0.334, 13}, // Mic
		{15, 0.359, 0.359, 14}, // Capricorn
		{16, 0.385, 0.385, 15}, // Pisces Austrinus
		{17, 0.410, 0.410, 16}, // Equuleus
		{18, 0.436, 0.436, 17}, // Aquarius
		{19, 0.461, 0.461, 18}, // Pegasus
		{20, 0.489, 0.489, 19}, // Sculptor
		{21, 0.512, 0.512, 20}, // Pisces
		{22, 0.537, 0.537, 21}, // Andromeda
		{23, 0.565, 0.565, 22}, // Triangulum
		{24, 0.589, 0.589, 23}, // Aries
		{25, 0.615, 0.615, 24}, // Perseus
		{26, 0.640, 0.640, 25}, // Cetus
		{27, 0.665, 0.665, 26}, // Taurus
		{28, 0.692, 0.692, 27}, // Auriga
		{29, 0.717, 0.717, 28}, // Eridanus
		{30, 0.742, 0.742, 29}, // Orion
		{31, 0.768, 0.768, 30}, // Canis Minor
		{32, 0.795, 0.795, 31}, // Monoceros
		{33, 0.820, 0.820, 32}, // Gemini
		{34, 0.849, 0.849, 33}, // Hydra
		{35, 0.870, 0.870, 34}, // Lynx
		{36, 0.897, 0.897, 35}, // Cancer
		{37, 0.920, 0.920, 36}, // Sextans
		{38, 0.948, 0.948, 37}, // Leo Minor
		{39, 0.974, 0.974, 38} // Leo
	};
};