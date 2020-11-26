# junior's loadouts and resupply script
A TF2 script that manages loadout settings and resupply bind.  

[github](https://github.com/juniorsgithub/tf2-loadouts-script)&nbsp; 

## Features

- single resup key that always respawns you on the right loadout  
- allows for loadout specific settings  
- remembers which loadout you have active on each class, even after you restart TF2  

Resup bind _(aka [b4nny bind](https://m.twitch.tv/masonarium/clip/DeterminedBumblingWerewolfJKanStyle/))_ lets you resupply while in spawn without needing to touch the cabinet.  
Unlike switching classes, it preserves all of your buildings, stickies and ubers (but not stored crits, heads or banner charges).  
See [this video](https://youtu.be/KaWJgQxlp20) as an example.

## SETUP

1. Download the [latest release](https://github.com/juniorsgithub/tf2-loadouts-script/releases/latest/download/tf2-loadouts-script.zip) and extract it into your `/custom` folder

2. Add `exec loadouts/load` to your _autoexec.cfg_

3. Add `exec loadouts/class` **at the end** of each _class.cfg_  

   <details>
   <summary>Class names</summary>

   _scout.cfg_ : `exec loadouts/scout`  
   _soldier.cfg_ : `exec loadouts/soldier`  
   _pyro.cfg_ : `exec loadouts/pyro`  
   _demoman.cfg_ : `exec loadouts/demoman`  
   _heavyweapons.cfg_ : `exec loadouts/heavyweapons`  
   _engineer.cfg_ : `exec loadouts/engineer`  
   _medic.cfg_ : `exec loadouts/medic`  
   _sniper.cfg_ : `exec loadouts/sniper`  
   _spy.cfg_ : `exec loadouts/spy`  

   </details>

4. Bind your keys
  
   `loadoutA`, `loadoutB`, `loadoutC`, `loadoutD` for switching loadouts  
   `resup` to resupply  

   Do this in your _autoexec.cfg_ or wherever you have your binds.  
   
   <details>
   <summary>Example</summary>

   ```
   bind F1 loadoutA
   bind F2 loadoutB
   bind F3 loadoutC
   bind F4 loadoutD
   bind ALT resup
   ```
   </details>

   If you need help with key names see [List of key names on TF2 Wiki](https://wiki.teamfortress.com/wiki/Scripting#List_of_key_names).  

5. Save your loadouts

   Loadouts are saved each time you close TF2. If you have console open you should see a save message right before the game exits.  
If you prefer to use commands, `quit` and `replay_confirmquit` work fine, but `exit` does not save your loadouts.

6. Add loadout specific settings _(OPTIONAL)_
  
   In your _class.cfg_, **before** `exec loadouts/class`, alias your commands to `loadoutX_cfg` (X is the loadout letter).  

   <details>
   <summary>Example</summary>

   in _medic.cfg_  
   ```
   bind 1 slot1  // some binds
   cl_crosshair_scale 20  // some settings

   alias loadoutA_cfg "exec uber; say_team running uber"
   alias loadoutB_cfg "exec kritz; say_team running kritz"
   alias loadoutC_cfg "exec quickfix; say_team running quickfix"
   alias loadoutD_cfg  // no settings for D

   exec loadouts/medic
   ```
   </details>

   If you decide to use these, remember to reset them for your other classes, else they will carry over.  

## FAQ

### There's a delay between when I press the key and respawning.
That's normal. Happens with all resupply binds. You should press it (or spam it) right before you enter spawn.

### Why does `exec loadouts/class` have to be at the end?
It doesn't. But anything that comes after it overrides the `loadoutX_cfg` settings. If you are sure you're not breaking anything you can put it anywhere you like.

### My loadouts are not being saved.
Saving is done with `exec loadouts/save`. It should be execed automatically with the command TF2 uses to exit.  
If you close the game in some other way (ALT F4, closing the window, etc.), this command doesn't get executed. It is also possible (but unlikely) that a custom HUD may use a different command that doesn't work.  
You can always save manually by execing the file yourself.

### How does it work?
When saving, console logging is enabled (`con_logfile cfg/saved_loadouts.txt`) and current loadouts are echoed to the console, which gets them written into that file.  
When loading loadouts, the file is executed (`exec saved_loadouts.txt`) and it sets active loadouts.  

### What if the save file gets too big?
TF2 won't exec files larger than 1 MB, which translates to 19 418 saves. Lifespan is further extended by not saving classes, where loadout hasn't been changed.  
If you still ever manage to reach that limit, simply delete the file and this whole process will start over.  

### Something else
I made a [Steam group](https://steamcommunity.com/groups/juniors-pot/discussions/0/3826311001003607453/), ask there.
