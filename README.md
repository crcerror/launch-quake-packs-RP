# launch-quake-packs-RP-
This are small bash files to help in launching all Quake Addons within RetroPie

## This verions uses zip as packer 
## please install zip first via `sudo apt install zip`

```
# +------------------------------------------------------------------------------------+
# | Launch Quake with addons hipnotic, rogue, dopa v1 07/09/17                         |
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
```
