class CfgPatches
{
	class pa_dhd
	{
		requiredAddons[] = {"A3_Structures_F"};
		requiredVersion = 1;
		units[] = {"PA_dhd"};
		weapons[] = {};
	};
};

#include "configs\planets.hpp"

#include "configs\functions.hpp"
#include "configs\sounds.hpp"

class CfgEditorCategories
{
	class PA_stargate_Objects
	{
		displayName = "Projact Aquilla StaGate Objects";
	};
};

class CfgEditorSubcategories
{
	class PA_stargate
	{
		displayName = "Stargates";
		priority = 40;
		side = 1;
	};

	class PA_dhd
	{
		displayName = "DHD";
		priority = 40;
		side = 1;
	};
};

class CfgVehicles
{
	class House_F;
	class PA_dhd: House_F
	{
		model = "\sgi_dhd\dhd.p3d";
		displayName = "PA DHD";
		editorCategory = "PA_stargate_Objects";
		editorsubcategory = "PA_dhd";
		scope = 2;
		icon = "";
		cost = 9400;
		armor = 100000;
		reversed = 1;
		animated = 1;
		autocenter = 0;
		class EventHandlers
		{
			init = "[_this select 0] execVM '\sgi_dhd\functions\fn_init_dhd.sqf';";
		};
		class AnimationSources
		{
			class anim_aquila
			{
				animPeriod = 0.25;
			};
		};
		hiddenselections[] = {"Earth","Crater","Virgo","Bootes","Centaurus","Libra","Serpens_Caput","Norma","Scorpio","Cra","Scutum","Sagittarius","Aquila","Mic","Capricorn","Pisces_Austrinus","Equuleus","Aquarius","Pegasus","Sculptor","Pisces","Andromeda","Triangulum","Aries","Perseus","Cetus","Taurus","Auriga","Eridanus","Orion","Canis_Minor","Monoceros","Gemini","Hydra","Lynx","Cancer","Sextans","Leo_Minor","Leo"};
	};
};
