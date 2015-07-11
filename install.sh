#!/bin/bash

I3CONFIG="$HOME/.i3"
I3STATUS_CONFIG_BASE=${XDG_CONFIG_HOME:-"$HOME/.config"}

PWD=`pwd`

function check_and_move_previous()
{
    echo "Checking for existing configuration."

    if [ -d "${I3STATUS_CONFIG_BASE}/i3status" ] ; then
	local OLD="${I3STATUS_CONFIG_BASE}/i3status"
	local NEW="${I3STATUS_CONFIG_BASE}/i3status_old" # =)
	mv $OLD $NEW
	echo "moved found configuration directory [$OLD] to [$NEW]"
    else
	echo "i3status directory hasn't been found."
    fi

    if [ -d $I3CONFIG ] ; then
	local OLD="${I3CONFIG}"
	local NEW="${I3CONFIG}_old" # =)
	mv $OLD $NEW
	echo "moved found configuration directory [$OLD] to [$NEW]"
    else
	echo "i3wm configuration directory hasn't been found."
    fi
}

function create_symlinks()
{
    echo "Creating the symlinks"

    # For sure
    mkdir -p $I3STATUS_CONFIG_BASE

    echo "Installing ~/.i3 directory"
    ln -s "$PWD/i3" "$I3CONFIG"

    echo "Installing ~/.config/i3status directory"
    ln -s "$PWD/i3status" "$I3STATUS_CONFIG_BASE/i3status"
}



##############################################

check_and_move_previous
create_symlinks
