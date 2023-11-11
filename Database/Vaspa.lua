-- Ship template by Joey45 edit as you see fit 
-- Vaspa by TeTeT


GT = {};
-- dofile(current_mod_path..'/scripts/ShipnameRunwaysAndRoutes.lua') -- the runways and taxiway lua file
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship) -- all ships have this

GT.visual = {}
GT.visual.shape = "vaspa_dcs"  -- name of LODs lua
GT.visual.shape_dstr = "" -- if there is a destruction model it goes here

GT.life = 600; -- 7200; -- hit points
GT.mass = 4000; -- 11339.809; -- KGs
GT.max_velocity = 14.4 --M/S
GT.race_velocity = 12.1 --M/S
GT.economy_velocity = 7.7 --M/S 
GT.economy_distance = 13,000 -- KM
GT.race_distance = 2.778e+006
GT.shipLength = 70; -- 225.20 -- o.a in meters
GT.Width = 15; -- 43.90 --15 --meters
GT.Height = 10; -- 35.226 --335.226 from sea level I think
GT.Length = 70; -- 225.20 -- deck length I think
GT.DeckLevel = 3; -- 11.816 -- height of deck
GT.X_nose = 31; -- 107.0 -- bow wave
GT.X_tail = -39; -- -104.5 -- wake
GT.Tail_Width = 12; -- 8 --wake width
GT.Gamma_max = 0.35 -- no idea
GT.Om = 0.05 --no idea
GT.speedup = 0.2; -- 0.119249; --time it takes to accelerate
GT.R_min = 100; -- 665.8 -- turn radius

GT.RCS = 1000; -- 100000 -- new in 2.7 ----estimated RCS in square meters
GT.IR_emission_coeff = 0.9 -- new in 2.7 not sure the params


GT.TACAN		   = false;		--If it has TACAN say true if not say false or not have this entry
-- GT.TACAN_position = {7.006,  43.155,  -14.1} --position of tacan TX	

--[[ GT.ICLS = true; -- IF it has ICLS say true if not say false or not have this entry
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
GT.distFindObstacles = 10000


--[[ GT.numParking = 2 -- runways
GT.Plane_Num_ = 12 --number of planes, not sure if it matters in game
GT.Helicopter_Num_ = 8 -- Number heli spawns
 ]]
-- the new LOS stuff is still new to me but this is what I have found out by looking through the lua files

--LSO view          high quality edm file, whatever you named the connector , Visiblity arg   , Position of camera
-- local LSO_Station = { HQ_model = "empty", dockConnector  = "LSO_VIEW" , hide_argument = 821 , cameraPos = {-110+1,19.8,-18+0.5,180}} --this camera pos works

-- GT.Stations = 	{	LSO = LSO_Station, }

-- GT.LSOView = {cockpit = "empty", position = {--[[connector = "LSO_VIEW", ]]offset = {0.0, 0.0, 0.0, 0.0, 0.0}}} --this offset has no effect but the line needs to be here


-- Landing point
-- GT.Landing_Point	= {101.926,   11.812,   -12.378} -- y z x You need this otherwise the aircraft will not load on the deck

-- smoke density and position
GT.exhaust = {
	  [1] = { size = 0.2 , pos = {0.0, 28.0, 16.0 } }, --Y, Z, X
}
      --[2] = { size = 1.0 , pos = {-1.9, 29.0, 14.0 } },	--if you have 2 stacks then enable this	


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

GT.animation_arguments.radar1_rotation = 1; -- Radar 1 Rotation main radar
GT.radar1_period = 1; --speed

GT.animation_arguments.radar2_rotation = 2; -- Radar 2 Rotation secondary radars
GT.radar1_period = 5; --speed

GT.animation_arguments.radar3_rotation = 3; -- navigation radar
GT.radar1_period = 5; --speed

-- for lights you can look at the shps in the modelviewer 
--                             {int ArgumentNo, float OffValue, float OnValue, [float AnimationDuration],  [bool cycleAnimation]}
--[[ GT.carrierIlluminationStates = { 
								 {{307, 0.0, 0.45}, {308, 0.0, 0.45}, {790, 0.0, 0.60}, {792, 0.0, 0.37}}, --NAV_LIGHTS
								 {{307, 0.0, 0.75}, {308, 0.0, 0.75}, {790, 0.0, 0.50}, {792, 0.0, 0.45}}, -- AC_LAUNCH_STATE
								 {{307, 0.0, 0.30}, {308, 0.0, 0.30}, {150, 0.0, 1.00}, {790, 0.0, 0.50}, {792, 0.0, 0.37}}, -- AC_RECOVERY_STATE
								}
 ]]								
--Damage Model
GT.DM = {
	----- Hull.
		{ area_name = "Hull_Bow_Port",			area_arg = 72,	area_life = 70, area_fire = { pos = {29.96, 3.0, 3.7}, size = 1.5}},
		{ area_name = "Hull_Bow_Stbd", 			area_arg = 73,	area_life = 70, area_fire = { pos = {32.0, 3.0,-3.3}, size = 1.5}},
		{ area_name = "Hull_Stern_Port", 		area_arg = 74,	area_life = 60, area_fire = { pos = {-35.772, 0.3, 5.8}, size = 1.5}},
		{ area_name = "Hull_Stern_Stbd", 		area_arg = 75,	area_life = 60, area_fire = { pos = {-43.008, 0.3, -5.8}, size = 1.5}},
		{ area_name = "Hull_Deck_Forward", 		area_arg = 76,	area_life = 60, area_fire = { pos = {43.684, 5.0, 3.0}, size = 1.5}},
		 { area_name = "Hull_Stern_Transom", 	area_arg = 77,	area_life = 60, area_fire = { pos = {-57.0, 2.6, 0.0}, size = 1.5}},
	-------- Superstructure	
		{ area_name = "Rear-Superstructure",	area_arg = 82,	area_life = 80, area_fire = { pos = {-35.0, 4.0, 0.0}, size = 1.5}},
		{ area_name = "Bridge",					area_arg = 83,	area_life = 80, area_fire = { pos = {12.6, 5.0, 0.0}, size = 1.5}},
	-------- 3x 4.5in Turrets	
		{ area_name = "Turret_A",				area_arg = 96,	area_life = 60, area_fire = { pos = {34.4, 6.6, 0.0}, size =  1.5}},
		{ area_name = "Turret_B",				area_arg = 97,	area_life = 60, area_fire = { pos = {24.2, 8.4, 0.0}, size =  1.5}},
		{ area_name = "Turret_Y",				area_arg = 98,	area_life = 60, area_fire = { pos = {-36.8, 6.2, 0.0}, size =  1.5}},
	---- Sink	
		{ area_name = "Vaspa_Destroyed",		area_arg = 77,	area_life = 60, area_fire = { pos = {-2.1, 2, 0.0}, size = 3}},
	
	}
--GT.WS[ws].pointer = "BRIDGE" --possible CA or Weapon controls??
--GT.driverViewConnectorName = {"DRIVER_POINT", offset = {0.0, 0.0, 0.0}} --possible CA or weapon controls??
--GT.driverCockpit = "DriverCockpit/DriverCockpitWithIR" --possible CA or weapon controls??

GT.airWeaponDist = 15000  -- Max engagement range air threats (meters)
GT.airFindDist = 28000 -- Max detenction range air threats (meters)

--Radar info
GT.WS = {}
GT.WS.maxTargetDetectionRange = 25000; --450000
GT.WS.radar_type = 104 --104= Short range, 103 = Mid range at a guess 102 = Long range
GT.WS.searchRadarMaxElevation = math.rad(60);
local ws;

-- weapon systems goes here

GT_t.WS_t.ship_2x23mm = {name = "2x23mm 2A14x2"};
GT_t.WS_t.ship_2x23mm.angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(90)},
                    };
GT_t.WS_t.ship_2x23mm.omegaY = math.rad(115) -- Block 1B
GT_t.WS_t.ship_2x23mm.omegaZ = math.rad(116) -- Block 1B
GT_t.WS_t.ship_2x23mm.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_2x23mm.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_2x23mm.reference_angle_Z = 0
GT_t.WS_t.ship_2x23mm.LN = {}
GT_t.WS_t.ship_2x23mm.LN[1] = {}
GT_t.WS_t.ship_2x23mm.LN[1].type = 3
GT_t.WS_t.ship_2x23mm.LN[1].distanceMin = 10
GT_t.WS_t.ship_2x23mm.LN[1].distanceMax = 2500 -- effective shooting
GT_t.WS_t.ship_2x23mm.LN[1].max_trg_alt = 2000
GT_t.WS_t.ship_2x23mm.LN[1].reactionTime = 3
GT_t.WS_t.ship_2x23mm.LN[1].beamWidth = math.rad(1);
GT_t.WS_t.ship_2x23mm.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_2x23mm.LN[1].sensor, GT_t.WSN_t[3])
-- set_recursive_metatable(GT_t.WS_t.ship_2x23mm.LN[1].sensor, GT_t.WSN_t[10])
GT_t.WS_t.ship_2x23mm.LN[1].PL = {}
GT_t.WS_t.ship_2x23mm.LN[1].PL[1] = {}
GT_t.WS_t.ship_2x23mm.LN[1].PL[1].ammo_capacity = 2000;
GT_t.WS_t.ship_2x23mm.LN[1].PL[1].shell_name = {"2A7_23_HE"};
GT_t.WS_t.ship_2x23mm.LN[1].PL[1].shell_display_name = "23mm HE";
GT_t.WS_t.ship_2x23mm.LN[1].PL[1].shot_delay = 0.066666666666667
GT_t.WS_t.ship_2x23mm.LN[1].PL[1].reload_time = 10;
GT_t.WS_t.ship_2x23mm.LN[1].BR = 
{ {
	pos = { 2, 0, -0.1 }
}, {
	pos = { 2, 0, 0.1 }
} }


ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_2x23mm );
GT.WS[ws].area = 'Turret_B';
GT.WS[ws].center = 'CENTER_TOWER_01';
GT.WS[ws].drawArgument1 = 44;
GT.WS[ws].drawArgument2 = 54;
GT.WS[ws].angles[1][1] = math.rad(170);
GT.WS[ws].angles[1][2] = math.rad(-170);
GT.WS[ws].angles[1][3] = math.rad(-5);
GT.WS[ws].angles[1][4] = math.rad(70);
GT.WS[ws].reference_angle_Y = math.rad(0);  
GT.WS[ws].reference_angle_Z = math.rad(0); 
GT.WS[ws].LN[1].BR[1].recoilTime = 1.0;
GT.WS[ws].LN[1].BR[2].recoilTime = 1.0;
GT.WS[ws].LN[1].BR = 
{
	{
		connector_name = 'POINT_23mm_1_1',
		recoilArgument = 150,
	},
	{
		connector_name = 'POINT_23mm_1_2',
		recoilArgument = 150,
	}
}

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_2x23mm );
GT.WS[ws].area = 'Turret_A';
GT.WS[ws].center = 'CENTER_TOWER_02';
GT.WS[ws].drawArgument1 = 44;
GT.WS[ws].drawArgument2 = 54;
GT.WS[ws].angles[1][1] = math.rad(170);
GT.WS[ws].angles[1][2] = math.rad(-170);
GT.WS[ws].angles[1][3] = math.rad(-5);
GT.WS[ws].angles[1][4] = math.rad(70);
GT.WS[ws].reference_angle_Y = math.rad(0);  
GT.WS[ws].reference_angle_Z = math.rad(0); 
GT.WS[ws].LN[1].BR[1].recoilTime = 1.0;
GT.WS[ws].LN[1].BR[2].recoilTime = 1.0;
GT.WS[ws].LN[1].BR = 
{
	{
		connector_name = 'POINT_23mm_2_1',
		recoilArgument = 150,
	},
	{
		connector_name = 'POINT_23mm_2_2',
		recoilArgument = 150,
	}
}

-------------------------------------------------------------------------

GT.Name = "tetet_vaspa" -- folder name for Liveries
GT.DisplayName = _("Vaspa Torpedoboat") -- name in game in ME and on the tape at the bottom
GT.DisplayNameShort = _("Vaspa") -- Label name
GT.Rate = 5500.000000 

--[[ GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR"}, --optics types
                RADAR = {"Tor 9A331", "carrier search radar"}, --radar types
            };
 ]]
GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR",},
			RADAR = {
				"ticonderoga search radar",
			}
		};			
 ----------------------------------------------------
GT.DetectionRange	= GT.airFindDist;
GT.ThreatRange		= GT.airWeaponDist;
GT.Singleton		= "yes";
GT.mapclasskey		= "P0091000039"; --map icon >>MissionEditor\data\NewMap\images
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
					};	
]]							
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,		
                    "Cruisers",
                    "RADAR_BAND1_FOR_ARM",
                    "DetectionByAWACS",
				};
 	

GT.Categories = {
					{name = "Armed Ship"},
				};
					
-- categories in the mission editor 
GT.tags  = 
{
	"Fast Attack Craft"
};
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

add_surface_unit(GT)