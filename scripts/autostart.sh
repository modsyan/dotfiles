#!/bin/env bash

# set background
$HOME/.config/scripts/.fehbg

# Kill if already running
killall -9  imwheel picom xfce4-power-manager ksuperkey dunst sxhkd eww

# setxkbmap -option ctrl:swapcaps &

# start hotkey daemon
sxhkd &
# Launch notification daemon
dunst -config $HOME/.config/dunst/dunstrc &
# run compsoter
picom --config $HOME/.config/picom/picom.conf &
# power manager and picom start
xfce4-power-manager &
imwheel -b "4 5"&

# ~/.local/bin/discover-overlay &

easyeffects &
# thunderbird & 
discord &
# sleep 10s &
# env LD_PRELOAD=/usr/lib/spotify-adblock.so spotify --uri=%U &



# Enable Super Keys For Menu
# ksuperkey -e 'Super_L=Alt_L|F1' &
# ksuperkey -e 'Super_R=Alt_L|F1' &

if [[ ! `pidof xfce-polkit` ]]; then
    /usr/lib/xfce-polkit/xfce-polkit &
fi

# replace neovim colorscheme
# sed -i "s/theme =.*$/theme = \"chadracula\",/g" $HOME/.config/nvim/lua/custom/chadrc.lu

# change xfce4-terminal colorscheme
XFCE_TERM_PATH="$HOME/.config/xfce4/terminal"
cp "$XFCE_TERM_PATH"/colorschemes/dracula "$XFCE_TERM_PATH"/terminalrc

# change cava colorscheme
CAVA_PATH="$HOME/.config/cava"
cp "$CAVA_PATH"/colorschemes/dracula "$CAVA_PATH"/config

#discord &
#thunderbird &
xbindkeys
