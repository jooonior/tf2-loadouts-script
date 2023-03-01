# junior's loadouts script

Loadout specific settings and a resup bind that knows which loadout you're on.

[GitHub](https://github.com/juniorsgithub/tf2-loadouts-script)
&#183;
[TFTV](https://www.teamfortress.tv/55661/improved-resup-bind-and-loadout-specific-settings)

## Features

- single resup key that always respawns you on the right loadout
- loadout specific settings
- remembers which loadout you have active on each class,
  even after you restart TF2  

Resup bind
_(aka [b4nny bind](https://m.twitch.tv/masonarium/clip/DeterminedBumblingWerewolfJKanStyle/))_
lets you resupply while in spawn without needing to touch the fridge/cabinet.
Unlike switching classes, it preserves all of your buildings, stickies
and ubers (but not stored crits, heads or banner charges).  

## Setup

1. Download the VPK from
   [the latest release](https://github.com/juniorsgithub/tf2-loadouts-script/releases/latest/download/loadouts.vpk)
   and save it into your `tf/custom` folder

2. Add `exec loadouts/load` to your `autoexec.cfg`

3. Add `loadouts.<class>` **at the end** of each of your
   `<class>.cfg`  

   Replace `<class>` with actual class names: `scout`, `soldier`, `pyro`, `demoman`,
   `heavyweapons`, `engineer`, `medic`, `sniper`, `spy`

4. Bind your keys
  
   `loadouts.A`, `loadouts.B`, `loadouts.C`, `loadouts.D` for switching loadouts  
   `loadouts.resup` to resupply  

   Do this in your `autoexec.cfg` or wherever you have your binds.  
   
   <details>
   <summary>Example</summary>

   ```
   bind F1 loadouts.A
   bind F2 loadouts.B
   bind F3 loadouts.C
   bind F4 loadouts.D
   bind ALT loadouts.resup
   ```
   </details>

   If you need help with key names see
   [List of key names on TF2 Wiki](https://wiki.teamfortress.com/wiki/Scripting#List_of_key_names).  

## Loadout specific settings

When changing to loadout _X_, the script calls corresponding `loadout.cfg.X` alias.
You can set these aliases to execute arbitrary commands when changing lodouts.

If you want to set these per class in your `<class>.cfg`, you need to
do so **before** the `loadouts.<class>` line.

Don't forget to reset them for other classes, otherwise their values will carry over.

<details>
<summary>Example</summary>

Your `medic.cfg` could look something like this.
```
bind 1 slot1  // some binds
cl_crosshair_scale 20  // some settings

alias loadouts.cfg.A "exec uber; say_team running uber"
alias loadouts.cfg.B "exec kritz; say_team running kritz"
alias loadouts.cfg.C "exec quickfix; say_team running quickfix"
alias loadouts.cfg.D  // no settings for D

loadouts.medic
```
</details>

## FAQ

### There's a delay between when I press the key and respawning.

That's normal. Happens with all resupply binds. You should press it
(or spam it) right before you enter spawn.

### Why does `loadouts.<class>` have to be at the end?

It doesn't. But anything that comes after it overrides
the `loadouts.cfg.X` settings. If you are sure you're not breaking
anything, you can put it anywhere you like.

### My loadouts are not being saved.

Saving is done with `exec loadouts/save`. It should be called
automatically with the command TF2 uses to exit.  
If you close the game in some other way (ALT F4, closing the window,
etc.), this command doesn't get executed.
It is also possible (but unlikely) that a custom HUD may use
a different command that doesn't work.  
You can always save manually by executing the save script yourself.

### How does it work?

When saving, console logging is enabled
(`con_logfile cfg/saved_loadouts.txt`) and current loadouts are echoed
to the console, which gets them written into that file.  
When loading loadouts, the file is executed (`exec saved_loadouts.txt`)
and it sets active loadouts.  

### Doesn't it break when item servers are down?

Yup.

### Something else.

Check [the issues tab](https://github.com/juniorsgithub/tf2-loadouts-script/issues?q=is%3Aissue),
someone might have already asked. If not, feel free to open a new issue.  
Another option is 
[TFTV](https://www.teamfortress.tv/55661/improved-resup-bind-and-loadout-specific-settings).
I don't get notified when you comment there, but someone else might
help you.
