#!/bin/bash

# Settings to change per game
prefixdir="$HOME/games"
identifier="my-game"
winebin="wine"
setupfile="setup.exe"
prefix="$prefixdir/$identifier/pfx"


mkdir -p $prefix

# Install the game in 'prefixdir/identifier/pfx/drive_c/game' and show no notifications or create desktop or start menu icons
WINEPREFIX="$prefix" "$winebin" "$setupfile" -c /DIR='c:\\game' /NOICONS /VERYSILENT
