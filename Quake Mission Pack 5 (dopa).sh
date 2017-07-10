#!/bin/bash
# +------------------------------------------------------------------------------------+
# | Launch Quake with addons hipnotic, rogue, dopa 07/09/17                            |
# |                                                                                    |
# | Prerequisites:                                                                     |
# | 1. Registered Version of QUAKE in v.1.06 or 1.08                                   |
# | 2. Mission Pack 1 - Scourge of Armagon aka hipnotic                                |
# | 3. Mission Pack 2 - Dissolution of Eternity aka rogue                              |
# | 4. Episode 5 - Dimension of the Past (20th years anniversary of QUAKE)             |
# | 5. Raspberry Pie with RetroPie and libretro-tyrquake installed                     |
# | 6. Working zip! If not type "sudo apt install zip"                                 |
# |                                                                                    |
# | Episode 5 - Dimension of the Past is released for free at                          | 
# | https://cdn.bethsoft.com/quake/dopa.rar                                            |
# +------------------------------------------------------------------------------------+
# |                                                                                    |
# | Why:                                                                               |
# | I wasn't able to run HIPNOTIC and ROGUE as descriped in the wiki                   |
# |                                                                                    | 
# | How to:                                                                            |
# | In your base folder ~/RetroPie/roms/quake/id1/ are two files pak0.pak and pak1.pak |
# | these are the base files for QUAKE.                                                |
# |                                                                                    |
# | Now, against the wiki recommendation copy all pak file to base files of quake.     |
# | Rename hipnotic/pak0.pak to hipnotic.pak and copy to base files of quake/id1/      |
# | Rename rogue/pak0.pak to rogue.pak and copy to quake/id1/                          |
# | Rename dopa/pak2.pak to dopa.pak and copy to quake/id1/                            |
# |                                                                                    |
# | Check settings in Synopsis!                                                        |
# | Check if path locations is correct                                                 |
# | Check if quake settings load correct edition!                                      |
# | Check if save settings are correct setted (that stores your savegames!)            |
# +------------------------------------------------------------------------------------+
# |                                                                                    |
# |             One year anniversary of being RetroPie forum member!                   |
# |                            !!old but not outdated!!                                |
# |                                                                                    |
# +------------------------------------------------------------------------------------+
# | v1.1: Cleaned up code, Now we can handle names with space within          07/10/17 |
# +------------------------------------------------------------------------------------+


# ------------------------------- Settings area ----------------------------------------

# Synopsis - Douple Check pathes and settings

# path variable should not end with slash

# pak1.pak loads full version of Quake
# dopa.pak loads Episode 5
# hipnotic.pak loads Mission Pack 1
# rogue.pak loads Mission Pack 2
#------------

path="/home/pi/RetroPie/roms/ports/quake/id1"
quake="dopa.pak"
save="savegames_dopa.zip"

# --------------------------------------------------------------------------------------

#
# Check presence of pak2.pak (forced reboot or annother error)
# Prevents game file gettig deleted - fail save feature
#------------
if [ -e "${path}/pak2.pak" ]; then
echo "Error! pak2.pak present! Please resolve problem and rename file!"
echo "I've done NO changes to current media!"
sleep 10
exit
fi

#
# Is file definated really available?
#------------
if ! [ -e "${path}/$quake" ]; then
echo "Error! ${path}/$quake not found!"
echoe "Please resolve problem in script or install file!"
sleep 10
exit
fi

#
# Extracting gamessaves
# if pak1.pak is loaded then exclude move command
#------------
unzip -qq -o "${path}/$save" -d "$path"
if  [ "${quake,,}" != "pak1.pak" ]; then 
mv "${path}/$quake" "${path}/pak2.pak" 
fi

#
# Start the dance!
#------------
"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "quake" "${path}/pak0.pak"

#
# Archiving gamessaves
# if pak1.pak is loaded then exclude move command
#------------
# There is an error in zip if pathes contains spaces within
zip -mj $path/$save $path/*.sav
if  [ "${quake,,}" != "pak1.pak" ]; then 
mv "${path}/pak2.pak" "${path}/$quake" 
fi