#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash
change_sink=$1
default_sink=$(wpctl status | grep '\*' | sed 's/.*\*\s*\([0-9]*\)\..*/\1/' | head -n 1)
if [ "$default_sink" = 81 ]; then
		if [ "$change_sink" > 0 ]; then
    	echo ""
			wpctl set-default 77
		else
    	echo ""
		fi				
	else
		if [ "$change_sink" > 0 ]; then
    	echo ""
			wpctl set-default 81 
		else
    	echo ""
		fi			
fi


