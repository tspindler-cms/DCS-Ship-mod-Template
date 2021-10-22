declare_plugin("Ship name by developer",
{
dirName		  = current_mod_path,
displayName   = _("Ship name"),
shortName	  =   "Short Ship name",
version		  =   "Version number",
state		  =   "installed",
developerName =   "developer name",
info		  =    _("info on the main screen on the icon"),
encyclopedia_path = current_mod_path .. '/Encyclopedia',

Skins = 
{
	 {     
	     name  = "Ship name", 
		 dir   = "Skins/1" 
	 },
},

})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_texture_path	(current_mod_path ..  "/Textures/ShipTextures.zip") -- I use unique names to cut down on any errors and combatibility clashes with other mods

dofile(current_mod_path..'/Weapons/Weapon.lua') -- any custom weapons the mod has
dofile(current_mod_path .."/Database/db_ships.lua")


plugin_done()