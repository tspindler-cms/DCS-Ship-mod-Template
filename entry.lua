declare_plugin("tetet_vaspa",
{
dirName		  = current_mod_path,
displayName   = _("Vaspa Torpedo Boat"),
shortName	  =   "Vaspa",
version		  =   "2.9.1",
state		  =   "installed",
developerName =   "TeTeT",
info		  =    _("Vaspa Torpedo Boat"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins = 
{
	 {     
	     name  = "Vaspa", 
		 dir   = "Skins/1" 
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/Vaspa.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

-- dofile(current_mod_path..'/Weapons/Weapon.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")


plugin_done()