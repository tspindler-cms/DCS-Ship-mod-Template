-- Ship template by Joey45 edit as you see fit 
-- USS Maddox 65 by TeTeT

GT = {};
-- dofile(current_mod_path..'/scripts/ShipnameRunwaysAndRoutes.lua') -- the runways and taxiway lua file
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "maddox_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

GT.life = 7200; -- hit points
GT.mass = 11339.809; -- KGs
GT.max_velocity = 14.4 --M/S
GT.race_velocity = 12.1 --M/S
GT.economy_velocity = 7.7 --M/S 
GT.economy_distance = 13,000 -- KM
GT.race_distance = 2.778e+006
GT.shipLength = 115 -- o.a in meters
GT.Width = 13.16 --15 --meters
GT.Height = 18.5 --335.226 from sea level I think
GT.Length = 115 -- deck length I think
GT.DeckLevel = 3 -- height of deck
GT.X_nose = 57.0 -- bow wave
GT.X_tail = -57.5 -- wake
GT.Tail_Width = 8 --wake width
GT.Gamma_max = 0.35 -- no idea
GT.Om = 0.05 --no idea
GT.speedup = 0.119249; --time it takes to accelerate
GT.R_min = 665.8 -- turn radius

GT.RCS = 100000 -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9 -- new in 2.7 not sure the params


GT.TACAN		   = false;		--If it has TACAN say true if not say false or not have this entry

GT.ICLS = false; -- IF it has ICLS say true if not say false or not have this entry

GT.distFindObstacles = 10000


GT.numParking = 0 -- runways
GT.Plane_Num_ = 0 --number of planes, not sure if it matters in game
GT.Helicopter_Num_ = 0 -- Number heli spawns

-- the new LOS stuff is still new to me but this is what I have found out by looking through the lua files

--LSO view          high quality edm file, whatever you named the connector , Visiblity arg   , Position of camera

-- smoke density and position
GT.exhaust = {
}
      --[2] = { size = 1.0 , pos = {-1.9, 29.0, 14.0 } },	--if you have 2 stacks then enable this	


GT.animation_arguments.radar1_rotation = 1; -- Radar 1 Rotation main radar
GT.radar1_period = 1; --speed

GT.animation_arguments.radar2_rotation = 2; -- Radar 2 Rotation secondary radars
GT.radar1_period = 5; --speed

GT.animation_arguments.radar3_rotation = 3; -- navigation radar
GT.radar1_period = 5; --speed

								
--Damage Model
GT.DM = {
    { area_name = "Ship", 				area_arg = 70, area_life = 150 },
}


GT.airWeaponDist = 15000  -- Max engagement range air threats (meters)
GT.airFindDist = 28000 -- Max detenction range air threats (meters)

--Radar info
GT.WS = {}
GT.WS.maxTargetDetectionRange = 25000; --450000
GT.WS.radar_type = 104 --104= Short range, 103 = Mid range at a guess 102 = Long range
GT.WS.searchRadarMaxElevation = math.rad(60);
local ws;

-- weapon systems goes here

-------------------------------------------------------------------------

GT.Name = "USS Maddox" -- folder name for Liveries
GT.DisplayName = _("USS Maddox") -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("Maddox") -- Label name
GT.Rate = 5500.000000 

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR"}, --optics types
                RADAR = {"ticonderoga search radar"}, --radar types
            };

 ----------------------------------------------------
GT.DetectionRange	= GT.airFindDist;
GT.ThreatRange		= GT.airWeaponDist;
GT.Singleton		= "yes";
GT.mapclasskey		= "P0091000068"; --map icon >>MissionEditor\data\NewMap\images
GT.attribute		= {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
						"Cruisers",
						"RADAR_BAND1_FOR_ARM",
						"DetectionByAWACS",
					};
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.Categories		= {
						{name = "Armed Ship"} -- has weapons
					};	
					
					
-- categories in the mission editor 
GT.tags  = 
{
	"Destroyer",
}
--[[ 

example
GT.tags  = {"Battlecruiser",}
------------------------------------------------------------
ship type =
Carrier
Battleship
Battlecruiser
Cruiser
Destroyer
Frigate
Corvette and Patrol
Fast Attack Craft
Submarine
Support
Amphibious Assault

File location >>DCS World version\MissionEditor\modules\me_ship.lua

---------------------------------------
attributes
["ski_jump"] = {},
["catapult"] = {},
["Aircraft Carriers"] = {"Heavy armed ships",},
["Cruisers"] = {"Heavy armed ships",},
["Destroyers"] = {"Heavy armed ships",},
["Frigates"] = {"Heavy armed ships",},
["Corvettes"] = {"Heavy armed ships",},
["Submarines"] = {"Heavy armed ships",},
["Heavy armed ships"] = {"Armed ships", "Armed Air Defence", "HeavyArmoredUnits",},
["Light armed ships"] = {"Armed ships","NonArmoredUnits"},
["Armed ships"] = {"Ships"},
["Unarmed ships"] = {"Ships","HeavyArmoredUnits",},
["Ships"] = {"All",}

--]]	
