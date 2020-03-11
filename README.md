# junior's resupply script
Advanced TF2 resupply script.

## Introduction

This script remembers which loadout you have active on each class, even after you exit TF2.  
This lets you have a single [resupply key](https://youtu.be/KaWJgQxlp20) (*aka b4nny bind*), instead of 4 (one for each loadout). No compromises.

## SETUP

1. Put both **resupply.cfg** and **nologfile.cfg** into your config directory.  
I recommend `/tf/custom/config/cfg`.  
If you need help see [this](https://www.reddit.com/r/tf2scripthelp/wiki/introduction#wiki_steam_method).

2. Add `exec resupply` to your **autoexec.cfg**.

3. Add `loadouts_class` to each **class.cfg**  
`loadouts_scout` in **scout.cfg**  
`loadouts_soldier` in **soldier.cfg**  
`loadouts_pyro` in **pyro.cfg**  
`loadouts_demoman` in **demoman.cfg**  
`loadouts_heavyweapons` in **heavyweapons.cfg**  
`loadouts_engineer` in **engineer.cfg**  
`loadouts_medic` in **medic.cfg**  
`loadouts_sniper` in **sniper.cfg**  
`loadouts_spy` in **spy.cfg**  

4. Bind your keys  
   `loadoutA`, `loadoutB` `loadoutC`, `loadoutD` for switching loadouts,
   `resup` to resupply.  
   Do this in your **autoexec.cfg** or wherever you have your binds.  
   Example:
   ```
   bind F1 loadoutA
   bind F1 loadoutB
   bind F1 loadoutC
   bind F1 loadoutD
   bind ALT resup
   ```
   For info on binds see [bind on TF2 wiki](https://wiki.teamfortress.com/wiki/Scripting#Bind) and [List of key names](https://wiki.teamfortress.com/wiki/Scripting#List_of_key_names)

5. All set


## NOTES

Your loadouts are saved in `loadout_class.txt` (one for each class) in the `/tf/cfg` folder.  
These files will get bigger everytime you change loadout on said class.
If they get too big, you might experience a short freeze when you change classes, caused by the file taking TF2 some time to process.
If they get bigger than 1 MiB (1048576 bytes, corresponds to 43 690 loadout changes), the game will refuse to load them at all.  
To solve this, you should delete them every once in a while (let's say once a year).
