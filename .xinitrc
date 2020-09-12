# exec cinnamon-session

setxkbmap -option "caps:escape"
setxkbmap -option "shift:both_capslock"
xset r rate 200 30

feh --bg-scale --no-fehbg ~/.config/wall
# Clock.sh &
pulseaudio --start &
dwmblocks &

dwm
