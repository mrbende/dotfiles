#!/bin/bash

# Wait for yabai to initialize
sleep 3

### open all applications minus browser
open -a "iTerm"
open -a 'Slack'
open -a "AWS VPN Client" 
open -a "NordLayer.app"
open -a "Spotify"

sleep 3

# Ensure other apps are in the correct spaces
yabai -m query --windows | jq -r '.[] | select(.app=="iTerm") | .id' | xargs -I{} yabai -m window {} --space terminal
yabai -m query --windows | jq -r '.[] | select(.app=="Slack") | .id' | xargs -I{} yabai -m window {} --space slack
yabai -m query --windows | jq -r '.[] | select(.app=="AWS VPN Client") | .id' | xargs -I{} yabai -m window {} --space vpn
yabai -m query --windows | jq -r '.[] | select(.app=="NordLayer") | .id' | xargs -I{} yabai -m window {} --space vpn
yabai -m query --windows | jq -r '.[] | select(.app=="Spotify") | .id' | xargs -I{} yabai -m window {} --space fun

# open browsers
source ${HOME}/.config/yabai/browser-start.sh

# Focus on first space
yabai -m space --focus 1

echo "Workspace setup complete!"
