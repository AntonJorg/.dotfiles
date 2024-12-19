#!/bin/bash

selected=$(ls --ignore=".*" ~/.screenlayout/|rofi -dmenu -p "Select screen layout: ")
bash ~/.screenlayout/$selected
