#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash


# Überprüfe, ob Discord läuft
if pgrep -x ".Discord-wrappe" > /dev/null
then
    # Discord läuft: Ändere das Format, um es anzuzeigen
    printf '{"text": "<span></span>", "tooltip": "Shutdown on click"}\n'
else
    # Discord läuft nicht
    echo '{"text": "Discord", "alt": "discord", "class": "discord", "format": "<span></span>"}'
fi

