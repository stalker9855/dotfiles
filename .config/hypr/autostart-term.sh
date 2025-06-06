#!/bin/bash

# Workspace 1
hyprctl dispatch workspace 1


# Cmatrix
hyprctl dispatch movecursor 0 0
hyprctl dispatch exec 'kitty --title term-cmatrix -e cmatrix' 
sleep 0.2 
hyprctl dispatch focuswindow title:term-cmatrix 

hyprctl dispatch exec 'kitty --title term-cava -e cava' 
sleep 0.2 

hyprctl dispatch focuswindow title:term-cmatrix 
hyprctl dispatch togglesplit

sleep 0.2 
hyprctl dispatch focuswindow title:term-cava

sleep 0.2 
hyprctl dispatch resizeactive exact 70% 70%


hyprctl dispatch focuswindow title:term-cmatrix 

hyprctl dispatch exec 'kitty --title term-cbonsai -e cbonsai' 
