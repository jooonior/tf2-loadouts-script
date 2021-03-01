#!/bin/bash

# Creates loadouts.vpk with minified version of the script.

mkdir -p loadouts/cfg/loadouts

for f in cfg/loadouts/*; do
    $(dirname "$0")/minify.sh "$f" > "loadouts/$f"
done

$(dirname "$0")/vpk.sh loadouts

rm -r loadouts
