# junior's loadouts and resupply script
A TF2 script that manages loadout settings and resupply bind.

## Features

- single resup key that always respawns you on the right loadout  
- allows different configs for each loadout  
- remembers which loadout you have active on each class, even after you restart TF2  

Resup bind _(aka [b4nny bind](https://m.twitch.tv/masonarium/clip/DeterminedBumblingWerewolfJKanStyle/))_ let's you resupply while in spawn without needing to touch the cabinet.  
Unlike switching classes, it preserves all your buildings, charges (including uber), stickes, etc.  
See [this video](https://youtu.be/KaWJgQxlp20) as an example.

## SETUP

1. Download the [latest release]() and extract it into your config folder

2. Add `exec loadouts/load` to your _autoexec.cfg_

3. Add `exec loadouts/class` to each _class.cfg_  

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

   You should save your loadouts each time before you close TF2. You do that with `exec loadouts/save`.  
You can add `alias q "exec loadouts/save; replay_confirmquit"` to your autoexec and type `q` into console when you want to close the game.  
Another option is to edit one of main menu buttons (see step 7).  

6. Add loadout specific settings (OPTIONAL)
  
   In your _class.cfg_, **before** `exec loadouts/class`, alias your commands to `loadoutX_cfg` (X is the loadout letter).  
Be careful not to overwrite them right after (if you're not sure just put the `exec loadoutX_cfg` at the end).

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

   exec uber  // before exec loadouts/medic => lower priority than loadoutX_cfg

   exec loadouts/medic  // will call one of loadoutX_cfg

   cl_crosshair_file crosshair3  // after exec loadouts/medic => higher priority than loadoutX_cfg
   ```
   </details>

   If you decide to use these, remember to reset them for your other classes, else they will carry over.  

7. Edit your HUD (OPTIONAL)

   1. Open TF2 and type `vgui_drawtree 1` into console. A small window will pop up. Check _Highlight Selected_ and navigate to `MatSystemTopPanel > staticPanel > GameUI Panel > BaseGameUIPanel > MainMenuOverride`.  
In there find a button you'd like to edit. Selected HUD elements will have a  red outline.  
You can refer to [this image]().

   2. Once you found your button, make sure you remember it's name and open your HUD's folder. From there go to `resource/ui` and look for _mainmenuoverride.res_.

   3. Open _mainmenuoverride.res_ in Notepad. Press CTRL+F and search for the button you chose. After you have found it, look for a property called `"Command"`. Change it's value to `"engine exec loadouts/save; replay_confirmquit"`.  
When you're done, it should look like [this]().

   4. You need to restart TF2 to see the changes. You can test if it worked by having console open when you click the button. You should see `Loadouts have been saved.` as game closes.

   For more info on HUD editing check out [this awesome guide](http://doodlesstuff.com/?p=tf2hud) by Doodles.

## FAQ

### There's a delay between when I press the key and respawning.
That's normal. Happens with all resupply binds. You should press it (or spam it) right before you enter spawn room.

### How does it work?
When saving, console logging is enabled (`con_logfile cfg/saved_loadouts.txt`) and current loadouts are echoed to the console, which gets them written into that file.  
When loading loadouts, the file is executed (`exec saved_loadouts.txt`) and it sets active loadouts.  

### What if the file gets too big?
TF2 won't exec files bigger than 1 MB, which corresponds 16 444 saves. Lifespan is further extended by not saving classes, where loadout hasn't been changed.  
If you still ever manage to reach that limit, simply delete the file and the whole process will start over.  

### Something else
I made a [Steam group](), ask there.
