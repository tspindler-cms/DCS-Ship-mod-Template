-- Ship template by Joey45 edit as you see fit 
-- P 4 torpedo boat by TeTeT

GT = {};
-- dofile(current_mod_path..'/scripts/ShipnameRunwaysAndRoutes.lua') -- the runways and taxiway lua file
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "p4_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

-- most values taken from https://en.wikipedia.org/wiki/P_4-class_torpedo_boat
-- and the speedboat: https://github.com/Quaggles/dcs-lua-datamine/blob/master/_G/db/Units/Ships/Ship/speedboat.lua

GT.life = 4 -- 7200; -- hit points
GT.mass = 2000 -- should be heavier? -- 11339.809; -- KGs
GT.max_velocity = 28 -- 14.4 --M/S
GT.race_velocity =  23 -- 12.1 --M/S
GT.economy_velocity = 15 -- 7.7 --M/S 
GT.economy_distance = 930 -- 13,000 -- KM
GT.race_distance = 200000 -- 2.778e+006
GT.shipLength = 18.7 -- 225.20 -- o.a in meters
GT.Width = 3.4 -- 43.90 --15 --meters
GT.Height = 3 -- 35.226 --335.226 from sea level I think
GT.Length = 18.7 -- 225.20 -- deck length I think
GT.DeckLevel = 1 -- 11.816 -- height of deck
GT.X_nose = 9.7 -- 107.0 -- bow wave
GT.X_tail = -9 -- -104.5 -- wake
GT.Tail_Width = 2 -- 8 --wake width
GT.Gamma_max = 0.35 -- no idea
GT.Om = 5 -- 0.05 --no idea
GT.speedup = 0.08 -- 0.119249; --time it takes to accelerate
GT.R_min = 100 -- 665.8 -- turn radius

GT.RCS = 100 -- 100000 -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.05 -- 0.9 -- new in 2.7 not sure the params

GT.TACAN		   = false -- true;		--If it has TACAN say true if not say false or not have this entry
-- GT.TACAN_position = {7.006,  43.155,  -14.1} --position of tacan TX	

GT.ICLS = false -- true; -- IF it has ICLS say true if not say false or not have this entry

--[[ 
GT.ICLS_Localizer_position =  {-109.324,  9.685,  7.715, 189.0}	-- {x [m], y [m], z [m], yaw [deg]} 
GT.ICLS_Glideslope_position = {-14.694,  19.945, 13.212,   3.5}	-- {x [m], y [m], z [m], glideslope = 3.5 [deg]}
--Optical Landing System
GT.OLS = {
Type = GT_t.OLS_TYPE.IFLOLS, 
CutLightsArg = 404, 
DatumAndWaveOffLightsArg = 405, 
MeatBallArg = 151, 
GlideslopeBasicAngle = 3.5, 
VerticalCoverageAngle = 1.7
}
 ]]
GT.distFindObstacles = 350 -- 10000


GT.numParking = 0 -- 2 -- runways
GT.Plane_Num_ = 0 -- 12 --number of planes, not sure if it matters in game
GT.Helicopter_Num_ = 0 -- 8 -- Number heli spawns

-- smoke density and position
-- insecure what to do with this

--[[ GT.exhaust = {
	  [1] = { size = 0.2 , pos = {0.0, 28.0, 16.0 } }, --Y, Z, X
} ]]
      --[2] = { size = 1.0 , pos = {-1.9, 29.0, 14.0 } },	--if you have 2 stacks then enable this	

GT.animation_arguments = {
	water_propeller = 2,
}

--[[ GT.animation_arguments.catapult_shuttles = {145, 146, 147, 148} --shuttle args
GT.animation_arguments.arresting_wires = {141, 142, 143, 144} -- can't get the visibilty anim to work, differnt #arg numbers on the Stennis and SC
GT.animation_arguments.holdback_bars_pos = {817, 818, 819, 820} 
GT.animation_arguments.holdback_bars_angle = {808, 809, 810, 811} 
GT.animation_arguments.holdback_bars_color = {812, 813, 814, 815}
GT.animation_arguments.holdback_bars_deck_cleat = {804, 805, 806, 807} --that little thing for the holdback bar
GT.animation_arguments.elevators = {57, 58, 59, 60}; --lifts
GT.animation_arguments.elevators_doors = {47, 48, 53, 54}; h--anger doors
GT.animation_arguments.elevators_fences_top = {27, 29, 31, 33}; --deck elevator fences
GT.animation_arguments.elevators_fences_bottom = {28, 30, 32, 34}; --hanger fences
GT.animation_arguments.alarm_state = 10; -- for the nets around the boat and or weapon stations or other stuff like antennas going up or platforms going from green state to red state
GT.animation_arguments.bubbles = {138, 139} -- doesn't go back down ED bug
GT.animation_arguments.landing_strip_illumination = 150; --runway lights
 ]]

--[[ GT.animation_arguments.radar1_rotation = 1; -- Radar 1 Rotation main radar
GT.radar1_period = 1; --speed

GT.animation_arguments.radar2_rotation = 2; -- Radar 2 Rotation secondary radars
GT.radar1_period = 5; --speed

GT.animation_arguments.radar3_rotation = 3; -- navigation radar
GT.radar1_period = 5; --speed ]]

-- for lights you can look at the shps in the modelviewer 
--                             {int ArgumentNo, float OffValue, float OnValue, [float AnimationDuration],  [bool cycleAnimation]}
--[[ GT.carrierIlluminationStates = { 
								 {{307, 0.0, 0.45}, {308, 0.0, 0.45}, {790, 0.0, 0.60}, {792, 0.0, 0.37}}, --NAV_LIGHTS
								 {{307, 0.0, 0.75}, {308, 0.0, 0.75}, {790, 0.0, 0.50}, {792, 0.0, 0.45}}, -- AC_LAUNCH_STATE
								 {{307, 0.0, 0.30}, {308, 0.0, 0.30}, {150, 0.0, 1.00}, {790, 0.0, 0.50}, {792, 0.0, 0.37}}, -- AC_RECOVERY_STATE
								} ]]
								
--Damage Model
GT.DM = {
	{ area_name = "BOAT", 				area_arg = 70, area_life = 100 }
 --[[    { area_name = "NOSE_R_01", 				area_arg = 70, area_life = 150, area_fire = { connector = "FIRE_NOSE_R_01", size = 0.5}},
	{ area_name = "NOSE_R_02", 				area_arg = 94, area_life = 150, area_fire = { connector = "FIRE_NOSE_R_02", size = 0.5}},
	{ area_name = "CENTER_R_01", 			area_arg = 71, area_life = 150, area_fire = { connector = "FIRE_CENTER_R_01", size = 0.5}},
	{ area_name = "CENTER_R_02", 			area_arg = 96, area_life = 150, area_fire = { connector = "FIRE_CENTER_R_02", size = 0.5}},
    { area_name = "BACK_R", 				area_arg = 72, area_life = 300, area_fire = { connector = "FIRE_BACK_R", size = 0.5}},
	
    { area_name = "NOSE_L_01", 				area_arg = 73, area_life = 150, area_fire = { connector = "FIRE_NOSE_L_01", size = 0.5}},
	{ area_name = "NOSE_L_02", 				area_arg = 95, area_life = 150, area_fire = { connector = "FIRE_NOSE_L_02", size = 0.5}},
    { area_name = "CENTER_L_01", 			area_arg = 74, area_life = 150, area_fire = { connector = "FIRE_CENTER_L_01", size = 0.5}},
	{ area_name = "CENTER_L_02", 			area_arg = 97, area_life = 150, area_fire = { connector = "FIRE_CENTER_L_02", size = 0.5}},
	{ area_name = "CENTER_L_03", 			area_arg = 98, area_life = 150},
    { area_name = "BACK_L", 				area_arg = 75, area_life = 300, area_fire = { connector = "FIRE_BACK_L", size = 0.5}},
	
	{ area_name = "PALUBA_NOSE",			area_arg = 76, area_life = 100, area_fire = { connector = "FIRE_PALUBA_NOSE", size = 0.8}},
	{ area_name = "PALUBA_MIDLE_01",		area_arg = 77, area_life = 100, area_fire = { connector = "FIRE_PALUBA_MIDLE_01", size = 0.8}},
	{ area_name = "PALUBA_MIDLE_02",		area_arg = 92, area_life = 100, area_fire = { connector = "FIRE_PALUBA_MIDLE_02", size = 0.8}},
	{ area_name = "PALUBA_BACK_01", 		area_arg = 78, area_life = 100, area_fire = { connector = "FIRE_PALUBA_BACK_01", size = 0.8}},
	{ area_name = "PALUBA_BACK_02", 		area_arg = 93, area_life = 100, area_fire = { connector = "FIRE_PALUBA_BACK_02", size = 0.8}},
	
	{ area_name = "BACK", 					area_arg = 79, area_life = 100},
	{ area_name = "RUBKA",					area_arg = 80, area_life = 100, area_fire = { connector = "FIRE_RUBKA", size = 0.8}},
	{ area_name = "MACHTA",					area_arg = 81, area_life = 100},
	{ area_name = "TOWER",					area_arg = 82, area_life = 100},

	{ area_name = "ZA_NR",					area_arg = 99, area_life = 30},
	{ area_name = "ZA_BR",					area_arg = 100, area_life = 30},
	{ area_name = "ZA_BL",					area_arg = 101, area_life = 30},
	{ area_name = "NADSTROYKA_BR",			area_arg = 102, area_life = 30},
	{ area_name = "NADSTROYKA_BL",			area_arg = 103, area_life = 30},
	{ area_name = "ZRK_BR",					area_arg = 104, area_life = 30},
	{ area_name = "ZRK_NR",					area_arg = 105, area_life = 30},
	
	
	{ area_name = "LIFT_01",				area_arg = 109, area_life = 50},
	{ area_name = "LIFT_02",				area_arg = 110, area_life = 50},
	{ area_name = "LIFT_03",				area_arg = 111, area_life = 50},
	{ area_name = "LIFT_04",				area_arg = 112, area_life = 50}, ]]
}

--GT.WS[ws].pointer = "BRIDGE" --possible CA or Weapon controls??
--GT.driverViewConnectorName = {"DRIVER_POINT", offset = {0.0, 0.0, 0.0}} --possible CA or weapon controls??
--GT.driverCockpit = "DriverCockpit/DriverCockpitWithIR" --possible CA or weapon controls??

GT.airWeaponDist = 1000 -- 15000  -- Max engagement range air threats (meters)
GT.airFindDist = 3000 -- 28000 -- Max detection range air threats (meters)

--Radar info
GT.WS = {}
GT.WS.maxTargetDetectionRange = 5000 -- 25000; --450000
GT.WS.radar_type = 104 --104= Short range, 103 = Mid range at a guess 102 = Long range
GT.WS.searchRadarMaxElevation = math.rad(60);
local ws;

-- weapon systems goes here
GT_t.WS_t.ship_dshk_2x12mm = {name = "2x12.7mm DShK"};
GT_t.WS_t.ship_dshk_2x12mm.angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(90)},
                    };
GT_t.WS_t.ship_dshk_2x12mm.omegaY = math.rad(115) -- Block 1B
GT_t.WS_t.ship_dshk_2x12mm.omegaZ = math.rad(116) -- Block 1B
GT_t.WS_t.ship_dshk_2x12mm.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_dshk_2x12mm.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_dshk_2x12mm.reference_angle_Z = 0
GT_t.WS_t.ship_dshk_2x12mm.LN = {}
GT_t.WS_t.ship_dshk_2x12mm.LN[1] = {}
GT_t.WS_t.ship_dshk_2x12mm.LN[1].type = 3
GT_t.WS_t.ship_dshk_2x12mm.LN[1].distanceMin = 10
GT_t.WS_t.ship_dshk_2x12mm.LN[1].distanceMax = 1200 -- effective shooting
GT_t.WS_t.ship_dshk_2x12mm.LN[1].max_trg_alt = 500
GT_t.WS_t.ship_dshk_2x12mm.LN[1].reactionTime = 3
GT_t.WS_t.ship_dshk_2x12mm.LN[1].beamWidth = math.rad(1);
GT_t.WS_t.ship_dshk_2x12mm.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_dshk_2x12mm.LN[1].sensor, GT_t.WSN_t[3])
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL = {}
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL[1] = {}
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL[1].ammo_capacity = 2000;
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL[1].shell_name = {"Utes_12_7x108_T", "Utes_12_7x108", "Utes_12_7x108", "Utes_12_7x108", "Utes_12_7x108"};
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL[1].shell_display_name = "12.7mm";
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL[1].shot_delay = 0.08;
GT_t.WS_t.ship_dshk_2x12mm.LN[1].PL[1].reload_time = 15;
GT_t.WS_t.ship_dshk_2x12mm.LN[1].BR = 
{ {
	pos = { 2, 0, -0.1 }
}, {
	pos = { 2, 0, 0.1 }
} }

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_dshk_2x12mm)
GT.WS[ws].area = 'BOAT'
GT.WS[ws].center = 'CENTER_TURRET_01'
GT.WS[ws].drawArgument1 = 0
GT.WS[ws].drawArgument2 = 1
-- GT.WS[ws].reference_angle_Z = math.rad(0) -- same as in line 171?
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(85)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_12_7mm_1',
					--		recoilArgument = 150,
						},
						{
							connector_name = 'POINT_12_7mm_2',
					--		recoilArgument = 150,
						}
					};

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Torpedo84 );
GT.WS[ws].area = 'BOAT'
GT.WS[ws].center = 'CENTER_TOWER';
-- GT.WS[ws].reference_angle_Z = math.rad(0);
-- GT.WS[ws].angles = {{math.rad (180), math.rad (180), math.rad(0), math.rad(0)},}
GT.WS[ws].LN[1].BR = {
	{connector_name = 'TPO_01', recoilArgument = 177, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
};
GT.WS[ws].LN[1].show_external_missile = true

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Torpedo84 );
GT.WS[ws].area = 'BOAT'
GT.WS[ws].center = 'CENTER_TOWER';
-- GT.WS[ws].reference_angle_Z = math.rad(0);
-- GT.WS[ws].angles = {{math.rad (180), math.rad (180), math.rad(0), math.rad(0)},}
GT.WS[ws].LN[1].BR = {
	{connector_name = 'TPO_02', recoilArgument = 178, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
};
GT.WS[ws].LN[1].show_external_missile = true

-------------------------------------------------------------------------

GT.Name = "P4" -- folder name for Liveries
GT.DisplayName = _("P 4 Torpedo Boat") -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("P 4") -- Label name
GT.Rate = 4000 -- 5500.000000 

-- most likely not correct
GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR"}, --optics types
                RADAR = {"ticonderoga search radar"}, --radar types
            };
GT.sensor = {
	height = 1.8
};

 ----------------------------------------------------
GT.DetectionRange	= GT.airFindDist;
GT.ThreatRange		= GT.airWeaponDist;
GT.Singleton		= "no";
GT.mapclasskey		= "P0091000039"; -- "P0091000065"; --map icon >>MissionEditor\data\NewMap\images
--[[ GT.attribute		= {wsType_Navy, wsType_Ship, wsType_AirCarrier, WSTYPE_PLACEHOLDER, -- >> \DCS World Version\Scripts\Database\wsTypes.lua
						"Aircraft Carriers", 
						"Arresting Gear",  --if it has arrester wires
						"catapult", --if it has catapults
						"ski_jump", -- if it has a ramp
						"RADAR_BAND1_FOR_ARM",
						"RADAR_BAND2_FOR_ARM",
					};
					--unfortunately the list with these have since been hidden by ED along with the ships lua files
GT.Categories		= {
						{name = "AircraftCarrier"}, --aircraft carrier
						{name = "AircraftCarrier With Catapult"}, --if it has catapults
						{name = "AircraftCarrier With Tramplin"}, -- if it has a ramp
						{name = "Armed Ship"} -- has weapons
						--{name = "AircraftCarrier With Arresting Gear"} -- disables mod when enabled, showws on SC module and Stennis and Forrestal.
					};	 ]]
					GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
						"low_reflection_vessel", 
						"Light armed ships", 
						"NO_SAM", "Armed Ship"
					};
 	

GT.Categories = {
					{name = "Armed Ship"},
				};					
					
-- categories in the mission editor 
GT.tags  = 
{
	"Fast Attack Craft"
--	"ship type",
--	"if you want you can add it to another tag", --if only one delete this
}


GT.type = "speedboat"
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

-- add_surface_unit(GT)