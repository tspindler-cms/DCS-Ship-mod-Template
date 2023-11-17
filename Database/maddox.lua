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
	[1] = { size = 0.60, pos = {6.65, 14, -0.27}},
	[2] = { size = 0.60, pos = {-7.34, 13, -0.27}}
	-- [1] = { size = 0.60 , pos = {-8.0, 17.0, 2.914 } },
	-- [2] = { size = 0.60 , pos = {-8.0, 17.0, -3.158 } },
}


--GT.animation_arguments.radar1_rotation = 7; -- Radar 1 Rotation main radar
--GT.radar1_period = 5; --speed

--GT.animation_arguments.radar2_rotation = 2; -- Radar 2 Rotation secondary radars
--GT.radar1_period = 5; --speed

--GT.animation_arguments.radar3_rotation = 3; -- navigation radar
--GT.radar1_period = 5; --speed

GT.animation_arguments = {
	water_propeller = 6,
	radar1_rotation = 7,
	radar2_rotation = 8
}
GT.radar1_period = 5; --speed
GT.radar2_period = 180; 

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
-- we will use the https://en.wikipedia.org/wiki/5-inch/38-caliber_gun as main armament
-- dcs-lua-datamine _G["db"]["Units"]["GT_t"]["LN_t"]["Mk12_5in38cal"] 

GT_t.WS_t.ship_mk12_2x127mm = {name = "Mk12 5inch 38cal Twin"};
GT_t.WS_t.ship_mk12_2x127mm.angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(90)},
                    };
GT_t.WS_t.ship_mk12_2x127mm.omegaY = math.rad(115) -- Block 1B
GT_t.WS_t.ship_mk12_2x127mm.omegaZ = math.rad(116) -- Block 1B
GT_t.WS_t.ship_mk12_2x127mm.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk12_2x127mm.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_mk12_2x127mm.reference_angle_Z = 0
GT_t.WS_t.ship_mk12_2x127mm.LN = {}
GT_t.WS_t.ship_mk12_2x127mm.LN[1] = {}
GT_t.WS_t.ship_mk12_2x127mm.LN[1].type = 11
GT_t.WS_t.ship_mk12_2x127mm.LN[1].distanceMin = 10
GT_t.WS_t.ship_mk12_2x127mm.LN[1].distanceMax = 16000 -- effective shooting
GT_t.WS_t.ship_mk12_2x127mm.LN[1].max_trg_alt = 11300
GT_t.WS_t.ship_mk12_2x127mm.LN[1].reactionTime = 3
GT_t.WS_t.ship_mk12_2x127mm.LN[1].beamWidth = math.rad(1);
GT_t.WS_t.ship_mk12_2x127mm.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_mk12_2x127mm.LN[1].sensor, GT_t.WSN_t[11])
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL = {}
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL[1] = {}
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL[1].ammo_capacity = 200;
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL[1].shell_name = { "Mk_12_HE_shell" };
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL[1].shell_display_name = "127mm";
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL[1].shot_delay = 3;
GT_t.WS_t.ship_mk12_2x127mm.LN[1].PL[1].reload_time = 15000000; -- never
GT_t.WS_t.ship_mk12_2x127mm.LN[1].BR =
{ {
    pos = { 5.2, 0, -0.1 }
}, {
    pos = { 5.2, 0, 0.1 }
} }

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_mk12_2x127mm)
GT.WS[ws].area = 'Ship'
GT.WS[ws].center = 'CENTER_TURRET_01'
GT.WS[ws].drawArgument1 = 0
GT.WS[ws].drawArgument2 = 1
GT.WS[ws].reference_angle_Y = math.rad(0)
GT.WS[ws].angles = {
                    {math.rad(140), math.rad(-140), math.rad(-5), math.rad(75)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_127mm_1',
						},
						{
							connector_name = 'POINT_127mm_2',
						}
					};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_mk12_2x127mm)
GT.WS[ws].area = 'Ship'
GT.WS[ws].center = 'CENTER_TURRET_02'
GT.WS[ws].drawArgument1 = 2
GT.WS[ws].drawArgument2 = 3
GT.WS[ws].reference_angle_Y = math.rad(0)
GT.WS[ws].angles = {
                    {math.rad(140), math.rad(-140), math.rad(-5), math.rad(75)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_127mm_2_1',
						},
						{
							connector_name = 'POINT_127mm_2_2',
						}
					};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_mk12_2x127mm)
GT.WS[ws].area = 'Ship'
GT.WS[ws].center = 'CENTER_TURRET_03'
GT.WS[ws].drawArgument1 = 4
GT.WS[ws].drawArgument2 = 5
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
                    {math.rad(140), math.rad(-140), math.rad(-5), math.rad(75)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_127mm_3_1',
						},
						{
							connector_name = 'POINT_127mm_3_2',
						}
					};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20)
GT.WS[ws].area = 'Ship'
GT.WS[ws].center = 'CENTER_TURRET_04'
GT.WS[ws].drawArgument1 = 9
GT.WS[ws].drawArgument2 = 10
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(85)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_20mm_1',
						}
					};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20)
GT.WS[ws].area = 'Ship'
GT.WS[ws].center = 'CENTER_TURRET_05'
GT.WS[ws].drawArgument1 = 11
GT.WS[ws].drawArgument2 = 12
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(85)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_20mm_2',
						}
					};

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Oerlikon_20)
GT.WS[ws].area = 'Ship'
GT.WS[ws].center = 'CENTER_TURRET_06'
GT.WS[ws].drawArgument1 = 13
GT.WS[ws].drawArgument2 = 14
GT.WS[ws].reference_angle_Y = math.rad(180)
GT.WS[ws].angles = {
                    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(85)},
--                    {math.rad(40), math.rad(-40), math.rad(0), math.rad(65)},
--                    {math.rad(-40), math.rad(-170), math.rad(-7.5), math.rad(65)},
                    };
GT.WS[ws].LN[1].BR = 
					{
						{
							connector_name = 'POINT_20mm_3',
						}
					};


ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable( GT.WS[ws], GT_t.WS_t.ship_Torpedo84 );
GT.WS[ws].reference_angle_Z = math.rad(5);
GT.WS[ws].LN[1].BR = {
	{connector_name = 'TPO_01_gone', recoilArgument = 177, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_02_gone', recoilArgument = 178, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_03_gone', recoilArgument = 177, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
	{connector_name = 'TPO_04_gone', recoilArgument = 178, recoilT0 = -1, recoilT1 = -0.5, recoilT2 = 0.5, recoilTime = 1.0},
};
GT.WS[ws].LN[1].show_external_missile = true


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
