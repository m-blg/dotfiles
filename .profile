#!/bin/sh

# Profile file. Runs on login

export PATH="$PATH:$HOME/.local/bin/statusbar:$HOME/.local/bin/"
export EDITOR="nvim"
export TERMINAL="st"  
export BROWSER="brave"

# start graphical server if dwm is not already running.
if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep -x dwm || exec startx
fi

