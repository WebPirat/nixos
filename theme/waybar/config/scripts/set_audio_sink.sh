#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

default_sink=$(wpctl status | grep '\*' | sed 's/.*\*\s*\([0-9]*\)\..*/\1/' | head -n 1)
if [ "$default_sink" = 60 ]; then
   wpctl set-default 58
	 echo 'fuck'
	else
   wpctl set-default 60  
fi


