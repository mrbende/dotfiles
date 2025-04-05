#!/bin/bash

# Force Chrome to open a new window with the profile
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window --profile-directory="Default" &
echo "Opening work Chrome profile..."
sleep 3

# Get Chrome window ID with more specific filtering
WORK_CHROME_ID=$(yabai -m query --windows | jq -r '.[] | select(.app=="Google Chrome" and (.title | type=="string") and (.title | contains("Google Chrome - Reed (Lantern)"))) | .id')
echo "Work Chrome ID: $WORK_CHROME_ID"

# Move the window to a specific space if found
if [[ -n "$WORK_CHROME_ID" && "$WORK_CHROME_ID" != "null" ]]; then
    yabai -m window $WORK_CHROME_ID --space 2
    echo "Moved work Chrome to space 2"
else
    echo "Work Chrome window not found"
fi

# Do the same for the personal profile
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window --profile-directory="Profile 1" &
echo "Opening personal Chrome profile..."
sleep 3

# Get Chrome window ID for personal profile
PERSONAL_CHROME_ID=$(yabai -m query --windows | jq -r '.[] | select(.app=="Google Chrome" and (.title | type=="string") and (.title | contains("Google Chrome - Reed"))) | .id')
echo "Personal Chrome ID: $PERSONAL_CHROME_ID"

# Move the window to a specific space if found
if [[ -n "$PERSONAL_CHROME_ID" && "$PERSONAL_CHROME_ID" != "null" ]]; then
    yabai -m window $PERSONAL_CHROME_ID --space 5
    echo "Moved personal Chrome to space 5"
else
    echo "Personal Chrome window not found"
fi

echo "Workspace setup complete!"
