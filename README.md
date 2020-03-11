# junior's resupply script
Advanced TF2 resupply script.

## Introduction

This script remembers which loadout you have active on each class, even after you exit TF2.
This lets you have a single [resupply key](https://youtu.be/KaWJgQxlp20) (aka b4nny bind), instead of 4 (one for each loadout). No compromises.

## SETUP

1. Put both `resupply.cfg` and `nologfile.cfg` into your config directory.
I recommend `/tf/custom/config/cfg`. If you need help finding that see [this](https://www.reddit.com/r/tf2scripthelp/wiki/introduction#wiki_steam_method).

2. Add `exec resupply` to your `autoexec.cfg`.

3. Add `loadouts_class` to each `class.cfg`
```
loadouts_scout
loadouts_soldier
loadouts_pyro
loadouts_demoman
loadouts_heavyweapons
loadouts_engineer
loadouts_medic
loadouts_sniper
loadouts_spy
```

4. Bind keys to:
```
loadoutA
loadoutB
loadoutC
loadoutD
resup
```
These should be self explanatory ^

5. Profit


## NOTES

Your loadouts are saved in `loadout_class.txt` (one for each class) in the `/tf/cfg` folder.
These files will get bigger everytime you change loadout on said class.
If they get too big, you might experience a short freeze when you change classes, caused by the file taking TF2 some time to process.
If they get bigger than 1 MiB (1048576 bytes, corresponds to 43 690 loadout changes), the game will refuse to load them at all.
To solve this, you should delete them every once in a while (let's say once a year).
