#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

player_status=$(playerctl status -p spotify 2> /dev/null)
if [ "$player_status" = "Playing" ]; then
    echo "$(playerctl metadata artist) - $(playerctl metadata title)"
elif [ "$player_status" = "Paused" ]; then
    echo " $(playerctl metadata artist) - $(playerctl metadata title)"
fi


